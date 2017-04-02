<?php

namespace Maxic\Parser;

use cloudflare;
use httpProxy;
use stdClass;
use Symfony\Component\DomCrawler\Crawler;

class HDStreamsParser extends AbstractParser
{

    const URL = 'https://hd-streams.org/';
    const ADMIN_AJAX_URL = 'https://hd-streams.org/wp-admin/admin-ajax.php';

    /**
     * @inheritdoc
     */
    public static function parse($url)
    {
        parent::beforeParse($url);

        $html = self::getPage($url);

        $crawler = new Crawler();
        $crawler->addHtmlContent(utf8_decode($html));

        $data = [];
        $data['poster'] = $crawler->filter('#main-content .row.post .poster > img')->first()->attr('src');
        $data['poster_raw'] = self::getBinary($data['poster']);
        $data['title']  = $crawler->filter('#main-text .text-left.title')->text();
        $data['genres'] = $crawler->filter('#main-text div')->siblings()->eq(6)->filter('.mdl-chip > .mdl-chip__text > a')->extract(['_text']);
        foreach ($data['genres'] as $key => $value) {
            $data['genres'][$key] = trim($value);
        }
        $data['acters'] = $crawler->filter('#main-text div')->siblings()->eq(8)->filter('.mdl-chip > .mdl-chip__text > a')->extract(['_text']);
        $data['tmdb'] = str_replace('https://dereferer.me/?', '', $crawler->filter('#main-text div')->siblings()->eq(9)->filter('a')->last()->attr('href'));
        $data['description'] = trim($crawler->filter('#main-text div')->siblings()->eq(11)->text());
        $data['openload'] = self::getOpenloadUrl($html);

        return $data;
    }

    /**
     * Modified function getUrl to pass cloudflare ddos protection
     * @param $url
     * @param string $type
     * @param array $post
     * @param array $headers
     * @return string
     */
    protected  static function getPage($url, $type = 'GET', $post = [], $headers = [])
    {
        $httpProxy   = new httpProxy();
        $httpProxyUA = 'proxyFactory';
        $requestLink = $url;
        $requestPage = json_decode($httpProxy->performRequest($requestLink, $type, $post, $headers));
        // if page is protected by cloudflare
        if($requestPage->status->http_code == 503) {
            // Make this the same user agent you use for other cURL requests in your app
            cloudflare::useUserAgent($httpProxyUA);

            // attempt to get clearance cookie
            if($clearanceCookie = cloudflare::bypass($requestLink)) {
                // use clearance cookie to bypass page
                $requestPage = $httpProxy->performRequest($requestLink, $type, $post, array(
                    'cookies' => $clearanceCookie
                ));
                // return real page content for site
                $requestPage = json_decode($requestPage);
                return $requestPage->content;
            } else {
                // could not fetch clearance cookie
                throw new \RuntimeException("Could not fetch CloudFlare clearance cookie (most likely due to excessive requests)");
            }
        }
    }

    protected  static function getBinary($url, $type = 'GET', $post = [], $headers = [])
    {
        $httpProxy   = new httpProxy();
        $httpProxyUA = 'proxyFactory';
        $requestLink = $url;
        $requestPage = json_decode($httpProxy->performRequest($requestLink, $type, $post, $headers));
        // if page is protected by cloudflare
        if($requestPage->status->http_code == 503) {
            // Make this the same user agent you use for other cURL requests in your app
            cloudflare::useUserAgent($httpProxyUA);

            // attempt to get clearance cookie
            if($clearanceCookie = cloudflare::bypass($requestLink)) {
                // use clearance cookie to bypass page
                $httpProxy->setBinaryMode(true);
                $requestPage = $httpProxy->performRequest($requestLink, $type, $post, array(
                    'cookies' => $clearanceCookie
                ));

                return $requestPage;
            } else {
                // could not fetch clearance cookie
                throw new \RuntimeException("Could not fetch CloudFlare clearance cookie (most likely due to excessive requests)");
            }
        }
    }

    /**
     * Decrypt data from a CryptoJS json encoding string
     *
     * @param mixed $passphrase
     * @param mixed $jsonString
     * @return mixed
     */
    protected  static function cryptoJsAesDecrypt($passphrase, $jsonString){
        $jsondata = json_decode($jsonString, true);
        $salt = hex2bin($jsondata["s"]);
        $ct = base64_decode($jsondata["ct"]);
        $iv  = hex2bin($jsondata["iv"]);
        $concatedPassphrase = $passphrase.$salt;

        $md5 = array();
        $md5[0] = md5($concatedPassphrase, true);
        $result = $md5[0];
        for ($i = 1; $i < 3; $i++) {
            $md5[$i] = md5($md5[$i - 1].$concatedPassphrase, true);
            $result .= $md5[$i];
        }
        $key = substr($result, 0, 32);
        $data = openssl_decrypt($ct, 'aes-256-cbc', $key, true, $iv);
        return json_decode($data, true);
    }

    protected static function getOpenloadUrl($html){
        $crawler = new Crawler();
        $crawler->addHtmlContent($html);

        $episodeData = $crawler->filter('.movie > a')->first()->extract(['data-episode', 'data-server']);
        $openloadRequest = [
            'action' => 'load_episodes',
            'b' => $crawler->filter('.dgvaup')->first()->attr('data-img'),
            'episode' => $episodeData[0][0],
            'server' => $episodeData[0][1]
        ];

        preg_match('#"postid":"(\d+)".+"nonce":"([^"]+)"#is', $html, $match);
        $openloadRequest += [
            'nonce' => $match[2],
            'pid' => $match[1]
        ];

        $content = self::getPage(self::ADMIN_AJAX_URL, 'POST', $openloadRequest);

        if ($content instanceof stdClass) {
            // Decrypt
            $decrypted = self::cryptoJsAesDecrypt(base64_decode($openloadRequest['b']), base64_decode($content->u));
            if (null === $decrypted) {
                throw new \Exception('Could not decrypt openload link');
            }

            return $decrypted;
        } else {
            throw new \RuntimeException('Could not request to openload link');
        }
    }

}
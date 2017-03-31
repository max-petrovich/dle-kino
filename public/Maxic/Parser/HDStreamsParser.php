<?php

namespace Maxic\Parser;

use Symfony\Component\DomCrawler\Crawler;

class HDStreamsParser extends AbstractParser
{

    const URL = 'https://hd-streams.org/';

    /**
     * @inheritdoc
     */
    static public function parse($url)
    {
        parent::beforeParse($url);

        $html = self::getUrl($url);

        $crawler = new Crawler($html);

        $poster = $crawler->filter('#main-content .row.post .poster > img')->first()->attr('src');
        $title  = $crawler->filter('#main-text .text-left.title')->text();
        $genres = $crawler->filter('#main-text div')->siblings()->eq(6)->filter('.mdl-chip > .mdl-chip__text > a')->extract(['_text']);
        $acters = $crawler->filter('#main-text div')->siblings()->eq(8)->filter('.mdl-chip > .mdl-chip__text > a')->extract(['_text']);

        $TMDb = $crawler->filter('#main-text div')->siblings()->eq(9)->filter('.mdl-chip > .mdl-chip__text > a')->extract(['_text']);

        var_dump($acters);
    }
}
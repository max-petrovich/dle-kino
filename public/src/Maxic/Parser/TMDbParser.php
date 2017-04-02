<?php

namespace Maxic\Parser;

use Symfony\Component\DomCrawler\Crawler;

class TMDbParser extends AbstractParser
{

    static public function parse($url)
    {
        $data = [];
        $html = self::getUrl($url);

        $crawler = new Crawler();
        $crawler->addHtmlContent($html, 'UTF-8');

        $data['directors'] = $crawler->filter('.featured + .people .profile a')->extract(['_text']);
        $data['year'] = preg_replace('#\D#is','',$crawler->filter('.movie_content .movie .release_date')->text());

        return $data;
    }
}
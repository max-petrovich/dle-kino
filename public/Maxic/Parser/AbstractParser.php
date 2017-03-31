<?php

namespace Maxic\Parser;


abstract class AbstractParser implements IParser
{

    static protected function beforeParse($url) {
        if (false === strpos($url, static::URL)) {
            throw new \InvalidArgumentException("Invalid URL: " . $url);
        }
    }

    /**
     * @param $url
     * @return string
     * @throws \Exception
     */
    static protected function getUrl($url)
    {
        $ch = curl_init();

        if (false === $ch) {
            throw new \BadMethodCallException("Could not create curl instance. Error: " . curl_error($ch));
        }

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $response = curl_exec($ch);

        if (false === $response) {
            throw new \Exception("Could not fetch content from url: " . $url);
        }

        return $response;
    }
}
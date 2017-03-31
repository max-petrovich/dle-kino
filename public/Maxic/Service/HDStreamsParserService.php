<?php

namespace Maxic\Service;

use Maxic\Parser\HDStreamsParser;

class HDStreamsParserService
{

    static public function parse($url)
    {
        $hdStreamParsed = HDStreamsParser::parse($url);

        // parse TMBd
        return $hdStreamParsed;
    }
}
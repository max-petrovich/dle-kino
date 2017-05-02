<?php

use Symfony\Component\Yaml\Exception\ParseException;
use Symfony\Component\Yaml\Yaml;

$filepath = ENGINE_DIR . '/data/special_tags.yml';

try {
    $special_tags = Yaml::parse(file_get_contents($filepath));
    foreach ($special_tags as $sTagKey=>$sTagValue) {
        $tpl->result['main'] = str_ireplace( '{'.$sTagKey.'}', $sTagValue, $tpl->result['main'] );
    }
} catch (ParseException $e) {
    //printf("Unable to parse the YAML string: %s", $e->getMessage());
}
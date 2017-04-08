<?php

@ob_start ();
@ob_implicit_flush ( 0 );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -14 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );

include ENGINE_DIR . '/data/config.php';
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

$is_logged = false;
$member_id = array ();

if ($config['allow_registration']) {
    require_once ENGINE_DIR . '/modules/sitelogin.php';
}

if ($is_logged === true) {
    header("Location: " . $config['http_home_url']);
    die();
}

include 'index.html';
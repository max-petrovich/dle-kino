<?php

@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );

include ENGINE_DIR . '/data/config.php';

require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

if (isset($_REQUEST['id'])) {
    $row = $db->super_query("SELECT * FROM ".PREFIX."_users_exported WHERE id = '".(int)$_REQUEST['id']."'");

    if ($row) {
        header('Content-Type: application/csv');
        header('Content-Disposition: attachment; filename=' . basename($row['filepath']));
        header('Pragma: no-cache');
        readfile(ROOT_DIR . '/uploads/' . $row['filepath']);
        die();
    }
}
die('Access denied');
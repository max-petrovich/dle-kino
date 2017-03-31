<?php

use Maxic\Service\HDStreamsParserService;

session_start();
ob_end_flush();
ob_start();

@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );

define ( 'DATALIFEENGINE', true );

$member_id = FALSE;
$is_logged = FALSE;

define ( 'ROOT_DIR', dirname ( __FILE__ ) );
define ( 'ENGINE_DIR', ROOT_DIR . '/engine' );

require ROOT_DIR . '/vendor/autoload.php';

include ENGINE_DIR . '/data/config.php';
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

//################# Определение групп пользователей
$user_group = get_vars( "usergroup" );

if( ! $user_group ) {
    $user_group = array ();

    $db->query( "SELECT * FROM " . USERPREFIX . "_usergroups ORDER BY id ASC" );

    while ( $row = $db->get_row() ) {

        $user_group[$row['id']] = array ();

        foreach ( $row as $key => $value ) {
            $user_group[$row['id']][$key] = stripslashes($value);
        }

    }
    set_vars( "usergroup", $user_group );
    $db->free();
}
//####################################################################################################################
//                    Определение категорий и их параметры
//####################################################################################################################
$cat_info = get_vars( "category" );

if( ! is_array( $cat_info ) ) {
    $cat_info = array ();

    $db->query( "SELECT * FROM " . PREFIX . "_category ORDER BY posi ASC" );
    while ( $row = $db->get_row() ) {

        $cat_info[$row['id']] = array ();

        foreach ( $row as $key => $value ) {
            $cat_info[$row['id']][$key] = stripslashes( $value );
        }

    }
    set_vars( "category", $cat_info );
    $db->free();
}

if ($config['allow_registration']) {
    require_once ENGINE_DIR . '/modules/sitelogin.php';
}

if (!$is_logged || $member_id['user_group'] != 1) {
    die("Unauthorized access");
}

$errors = null;

if (isset($_POST['links'])) {
    $approve = (isset($_POST['approve']) ? 1 : 0);

    if (empty($_POST['links'])) {
        $errors = 'Пустое поле для ссылок';
    } else {
        $links = explode("\n", $_POST['links']);

        foreach ($links as $link) {
            $link = trim($link);

            if (empty($link)) continue;

            echo "Link: " . $link . "<br>";

            try {
                // check for existing link in database
                if ($db->super_query("SELECT id as count FROM ".PREFIX."_post WHERE  xfields LIKE '%hd-streams|". $db->safesql($link) ."%'")) {
                    throw new \Exception("Already exists in database");
                }

                $parsed = HDStreamsParserService::parse($link);

                break;
            } catch (\BadMethodCallException $e) {
                echo "-> <b>" . $e->getMessage() . "<br> Script stop working!</b>";
                die();
            } catch (\Exception $e) {
                echo "-> <span style='color:#ff0000;'>" . $e->getMessage() . "</span><br>";
            }

            ob_flush();
            flush();
        }
    }

    if (null === $errors) {
        return;
    }
}

echo <<<HTML
<!doctype html>
<html >
<head>
<meta charset="UTF-8">
<title>HD Stream Parser</title>
</head>
<body>
    <h2>HD Streams Parser</h2>
    {$errors}
    <form action="" method="post" onsubmit="if (document.getElementById('links').value.length === 0) {alert('Введите ссылки'); return false;}">
        <div>
            <textarea name="links" rows="10" cols="100" id="links">
https://hd-streams.org/transformers-3-2011/
https://hd-streams.org/rogue-one-a-star-wars-story-2016/
</textarea>
        </div>
        <div>
        <label for="approve">Одобрить новости на сайте:
            <input type="checkbox" name="approve" id="approve" value="1" />
        </label>
        </div>
        <div style="padding: 20px 0;">
            <button type="submit" style="padding: 10px;">Начать парсинг</button>
        </div>
    </form>
</body>
</html>
HTML;

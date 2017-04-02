<?php

use Maxic\Parser\HDStreamsParser;
use Maxic\Parser\TMDbParser;

session_start();
ob_end_flush();
ob_start();

if( !defined( 'E_DEPRECATED' ) ) {

    @error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
    @ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );

} else {

    @error_reporting ( E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE );
    @ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_DEPRECATED ^ E_NOTICE );

}

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
require_once ENGINE_DIR . '/classes/uploads/upload.class.php';


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
            <textarea name="links" rows="10" cols="100" id="links"></textarea>
        </div>
        <div>
        <label for="approve">Одобрить новости на сайте:
            <input type="checkbox" name="approve" id="approve" value="1" checked />
        </label>
        </div>
        <div style="padding: 20px 0;">
            <button type="submit" style="padding: 10px;">Начать парсинг</button>
        </div>
    </form>
</body>
</html>
HTML;

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

                $hdStreamsParsed = HDStreamsParser::parse($link);

                if (is_array($hdStreamsParsed) && !empty($hdStreamsParsed)) {
                    // Get directors
                    $TMDbContent = TMDbParser::parse($hdStreamsParsed['tmdb']);
                    if (!is_array($TMDbContent) || count($TMDbContent) === 0) {
                        throw new \Exception("Not found directors on TMDb");
                    }
                    // # Publish news
                    // Get temp url to poster
                    $filePathDir = ROOT_DIR . '/uploads/posts/' . date('Y-m');

                    if (!is_dir($filePathDir)) {
                        @mkdir( $filePathDir, 0777, true );
                        @chmod( $filePathDir, 0777, true );
                    }
                    $fileName = date('Y-m') . '/' . time() . '_' . basename($hdStreamsParsed['poster']);
                    $filePath = ROOT_DIR . '/uploads/posts/' .  $fileName;
                    $fp = fopen($filePath, 'x');
                    fwrite($fp, $hdStreamsParsed['poster_raw']);
                    fclose($fp);
                    $posterURL = $config['http_home_url'] . 'uploads/posts/' . $fileName;

                    // ==================================================
                    $added_time = time();
                    $thistime = date( "Y-m-d H:i:s", $added_time );

                    $db->query("INSERT INTO ".PREFIX."_images (images, news_id, author, date) 
                                VALUES ('{$fileName}', 0, '".$db->safesql($member_id['name'])."', '".time()."')");

                    // Get id categories by parsed data
                    $categoriesNamesForQuery = implode(',', array_map(function($v) use($db) {
                        return "'". $db->safesql($v)."'";
                    } ,$hdStreamsParsed['genres']));

                    $rowCategories = $db->super_query("SELECT GROUP_CONCAT(id SEPARATOR ',') as category FROM ".PREFIX."_category 
                                                        WHERE name in (". $categoriesNamesForQuery .")");


                    $_POST['xfield'] = [
                        'year' => $TMDbContent['year'],
                        'regie' => $TMDbContent['directors'][0],
                        'akter' => implode(', ', array_slice($hdStreamsParsed['acters'], 0, 5)),
                        'openload' => $hdStreamsParsed['openload'],
                        'hd-streams' => $link
                    ];

                    $xfieldsaction = "init";
                    $category = ['0'];
                    include (ENGINE_DIR . '/inc/xfields.php');

                    $category = $rowCategories['category'];

                    $short_story = $db->safesql('<!--dle_image_begin:'.$posterURL.'|left--><img src="'.$posterURL.'" style="float:left;"  /><!--dle_image_end-->');
                    $full_story = $db->safesql($hdStreamsParsed['description']);

                    // Insert post, post_extras
                    $db->query("INSERT INTO ".PREFIX."_post (autor, `date`, short_story, full_story, xfields, title, descr, category, alt_name, approve, symbol, tags, metatitle)
                                VALUES ('{$member_id['name']}',
                                '$thistime',
                                '".$short_story."',
                                '".$full_story."',
                                '$filecontents',
                                '".$db->safesql($hdStreamsParsed['title'])."',
                                '',
                                '{$category}',
                                '".$db->safesql(totranslit($hdStreamsParsed['title'], true, false))."',
                                '{$approve}',
                                '', '', '')");
                    $rowId = $db->insert_id();
                    $db->query("INSERT INTO ".PREFIX."_post_extras (news_id, related_ids, access, editor, reason, user_id)
                                VALUES ('{$rowId}', '', '', '', '', '{$member_id['user_id']}')");
                    // Update image news_id images
                    $db->query("UPDATE ".PREFIX."_images SET news_id = '{$rowId}' WHERE author = '".$db->safesql($member_id['name'])."' and news_id = 0  ");

                    echo '-> <span style="color: green;">Опубликовано</span><br>';
                } else {
                    throw new \Exception('Could not parse data');
                }
            } catch (\BadMethodCallException $e) {
                echo "-> <b>" . $e->getMessage() . "<br> Script stop working!</b>";
                die();
            } catch (\Exception $e) {
                echo "-> <span style='color:#ff0000;'>" . $e->getMessage() . "</span><br>";
            }

            ob_flush();
            flush();
        }

        if ($approve) {
            clear_cache( array('news_', 'related_', 'tagscloud_', 'archives_', 'calendar_', 'topnews_', 'rss') );
        }
    }
}

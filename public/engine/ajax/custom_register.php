<?php

use Maxic\DLE\Constraint\UniqueDatabase;
use Symfony\Component\Validator\Constraints\Collection;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\EqualTo;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Validation;
use Symfony\Component\Validator\Constraints\NotBlank;

@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );

require ROOT_DIR . '/vendor/autoload.php';

include ENGINE_DIR . '/data/config.php';
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';


const SMS_CODE = 1349;

$is_logged = false;
$member_id = array ();

if ($config['allow_registration']) {
    require_once ENGINE_DIR . '/modules/sitelogin.php';
}

if ($is_logged === true) {
    header('HTTP/1.1 500 Internal Server Error');
    throw new BadFunctionCallException("Already authenticated", 500);
}

$config['reg_group'] = intval( $config['reg_group'] ) ? intval( $config['reg_group'] ) : 4;

$response = array('code' => 400);
$request = $_POST;

// Validate request
$constraintArray = array(
    'first_name'  => new NotBlank(array(
        'message' => 'Не заполнено поле Имя'
    )),
    'last_name'  => new NotBlank(array(
        'message' => 'Не заполнено поле Фамилия'
    )),
    'email' => array(
        new NotBlank(array(
            'message' => 'Не заполнено поле Email'
        )),
        new Email(array(
            'message' => 'Некорректный email'
        )),
        new UniqueDatabase(array(
            'message' => 'Email \'%value%\' уже занят',
            'db' => $db,
            'tablePrefix' => USERPREFIX
        ))
    ),
    'password' => array(
        new NotBlank(array(
            'message' => 'Не заполнено поле Пароль'
        )),
        new Length(array(
            'min' => 6,
            'minMessage' => 'Минимальная длинна пароля состовляет 6 символов'
        ))
    ),
    'country' => new NotBlank(array(
        'message' => 'Не заполнено поле Страна'
    )),
    'city' => new NotBlank(array(
        'message' => 'Не заполнено поле Город'
    )),
    'post_code' => new NotBlank(array(
        'message' => 'Не заполнено поле Индекс'
    )),
    'street' => new NotBlank(array(
        'message' => 'Не заполнено поле Улица'
    )),
    'phone' => new NotBlank(array(
        'message' => 'Не заполнено поле Телефон'
    ))
);

if (!empty($_POST['sms_code'])) {
    // check sms code
    $constraintArray['sms_code'] = array(
        new NotBlank(),
        new EqualTo(array(
            'value' => SMS_CODE,
            'message' => 'Неправильный код'
        ))
    );
}

$constraint = new Collection($constraintArray);
$constraint->allowExtraFields = true;

$validator = Validation::createValidator();

$violations = $validator->validate($request, $constraint);

if (0 !== count($violations)) {
    /** @var \Symfony\Component\Validator\ConstraintViolation $violation */
    foreach ($violations as $violation) {
        $response['errors'][] = $violation->getMessage();
    }
    $response['code'] = 400;
} else {
    if (!empty($_POST['sms_code'])) {
        // REGISTER USER

        foreach ($request as $key=>$value) {
            $request[$key] = ucfirst($db->safesql($value));
        }

        $md5password = md5( $request['password'] );
        $regpassword = md5( $md5password);

        $add_time = time();
        $_IP = get_ip();

        // generate user name
        $login = totranslit($request['first_name'] . '-' . $request['last_name'], true, true);
        $usersCount = $db->super_query("SELECT COUNT(user_id) as count FROM ". USERPREFIX. "_users WHERE name = '".$db->safesql($login)."'");
        if ($usersCount['count'] == 0) {
            $userName = $login;
        } else {
            $userName = $login . ((int)$usersCount['count'] + 1);
        }

        // Make xfields
        $_POST['xfield'] = $request;

        $xfieldsaction = "init";
        $xfieldsadd = true;
        $xfieldsid = "";
        include (ENGINE_DIR . '/inc/userfields.php');
        $filecontents = array ();
        $not_allow_symbol = array ("\x22", "\x60", "\t", '\n', '\r', "\n", "\r", '\\', ",", "/", "¬", "#", ";", ":", "~", "[", "]", "{", "}", ")", "(", "*", "^", "%", "$", "<", ">", "?", "!", '"', "'", " ", "&" );

        if( ! empty( $postedxfields ) ) {
            foreach ( $postedxfields as $xfielddataname => $xfielddatavalue ) {
                if( ! $xfielddatavalue ) {
                    continue;
                }
                $xfielddatavalue = ucfirst($db->safesql( $xfielddatavalue ));
                $xfielddataname = $db->safesql( str_replace( $not_allow_symbol, '', $xfielddataname) );
                $xfielddataname = str_replace( "|", "&#124;", $xfielddataname );
                $xfielddatavalue = str_replace( "|", "&#124;", $xfielddatavalue );
                $filecontents[] = "$xfielddataname|$xfielddatavalue";
            }

            $filecontents = implode( "||", $filecontents );
        } else
            $filecontents = '';

        $db->query( "INSERT INTO " . USERPREFIX . "_users (`name`, password, email, reg_date, lastdate, user_group, info, signature, favorites, xfields, logged_ip) 
                 VALUES ('$userName', '$regpassword', '{$request['email']}', '$add_time', '$add_time', '" . $config['reg_group'] . "', '', '', '', '{$filecontents}', '" . $_IP . "')" );
        $id = $db->insert_id();

        set_cookie( "dle_user_id", $id, 365 );
        set_cookie( "dle_password", $md5password, 365 );

        $_SESSION['dle_user_id'] = $id;
        $_SESSION['dle_password'] = $md5password;

        $response['user'] = $db->super_query("SELECT user_id, name, email FROM ". USERPREFIX."_users WHERE user_id = '{$id}' ");

        $response['code'] = 200;
    } else {
        // SEND SMS
        $smsService = new Maxic\Service\SmsService(array(
            'sender_id' => 'FelixKino',
            'api_key'   => 'live_TW8EZY2FbdljaZh7ikQT'
        ));

        $smsMessage = 'Ihr FelixKino-Code lautet ' . SMS_CODE;
        $smsResponse = $smsService->send($request['phone'], $smsMessage);

        if ((int)$smsResponse['error'] == 0) {
            $response['message'] = 'SMS sended';
            $response['code'] = 200;
        } else {
            $response['code'] = 400;
            $response['errors'] = array(
                'Не удалось отправить SMS: ' . $smsResponse['error'] . '. Text: ' . $smsResponse['errorDescription']
            );
        }
    }
}


header('Content-Type: application/json; charset=' . $config['charset'], true, $response['code']);
echo json_encode($response, JSON_UNESCAPED_UNICODE);
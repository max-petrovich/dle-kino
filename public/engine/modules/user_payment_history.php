<?php
/**
 * Included file in tpl
 */
use Maxic\Entity\UserPaymentHistory;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validation;

if( ! defined( 'DATALIFEENGINE' ) ) {
    die( "Hacking attempt!" );
}

require ROOT_DIR . '/vendor/autoload.php';

if (!$is_logged || $member_id['user_group'] == 5) {
    die('Access denied!');
}

if (!empty($_POST)) {
    $request = Request::createFromGlobals();

    $userPaymentHistory = new UserPaymentHistory();
    $userPaymentHistory->setUserName($request->get('user_name'));
    $userPaymentHistory->setFile($request->files->get('file'));

    $validator = Validation::createValidatorBuilder()
        ->addMethodMapping('loadValidatorMetadata')
        ->getValidator();

    $violations = $validator->validate($userPaymentHistory);

    if (0 !== count($violations)) {
        $error = [];
        /** @var \Symfony\Component\Validator\ConstraintViolation $violation */
        foreach ($violations as $violation) {
            $error[] = ucfirst($violation->getPropertyPath()) . ': ' . $violation->getMessage();
        }
        msgbox('Form error', implode('<br/>', $error));
    } else {
        $file = $userPaymentHistory->getFile();
        // save file
        $fileName = md5(uniqid()).'.'.$file->guessExtension();
        $file->move(ROOT_DIR . '/uploads/files/user-payment-history', $fileName);

        // add to db
        $db->query("INSERT INTO ".PREFIX."_user_payment_history (user_id,user_name,filepath,created_at)
                    VALUES ('{$member_id['user_id']}', '".$db->safesql($userPaymentHistory->getUserName())."',
                    '{$fileName}', NOW()) ");

        header("Location: " . $config['http_home_url'] . 'processing.html');
        die();
    }

}
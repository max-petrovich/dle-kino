<?php

if ($_POST) {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $country = $_POST['country'];
    $city = $_POST['city'];
    $post_code = $_POST['post_code'];
    $street = $_POST['street'];
    $phone = $_POST['phone'];
    $user_ip_address = $_SERVER["REMOTE_ADDR"];

    $to      = 'igor.rahlins90@gmail.com';
    $subject = 'Test';
    $message = "first name: $first_name, last name: $last_name, email: $email, password: $password, country: $country, city: $city, street: $street. phone: $phone, IP-адрес: $user_ip_address";
    $headers = 'From: ' . $email . "\r\n" .
        'Reply-To: '. $email . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

    $isSuccessSent = mail($to, $subject, $message, $headers);
} else {
    header('Location: /index.html');
}
?>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8'>

    <meta content='width=device-width, initial-scale=1' name='viewport'>
    <title>Successful sent</title>
    <link rel="stylesheet" media="screen" href="css/bootstrap.css" />
    <link rel="stylesheet" media="screen" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body>

<div class="sent-result-page">
    <?php if ($isSuccessSent): ?>
        <div class="successful-container">
            <h1>Sie wurden erfolgreich registriert!</h1>
            <img src="img/success.png" class="success-image">
            <p>Ihr Account wird in kürzester Zeit aktiviert.</p>
        </div>
    <?php else: ?>
        <div class="fail-container">
            <h1>Error!</h1>
            <p>Email not sent.</p>
        </div>
    <?php endif; ?>
</div>

</body>
</html>
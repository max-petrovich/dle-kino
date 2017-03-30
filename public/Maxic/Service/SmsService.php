<?php

namespace Maxic\Service;

class SmsService
{

    /**
     * @var array
     */
    protected $options = array(
        'sender_id' => null,
        'login' => null,
        'password' => null
    );

    /**
     * SmsService constructor.
     * @param array $options
     */
    public function __construct($options = array())
    {
        if (null === $options['sender_id'] || null === $options['login'] || null == $options['password']) {
            throw new \RuntimeException("Options is not valid");
        }
        $this->options = $options;
    }
    
    public function send($phoneNum, $text)
    {
        $srcaddr = urlencode($this->options['sender_id']);
        $text = urlencode($text);
        $num = $phoneNum;
        $ch = curl_init();
        $data = 'http://app.bsg.hk/sendsms?user='.$this->options['login'].'&pwd='. $this->options['password'].'&sadr='.$srcaddr.'&text='. $text.'&dadr='.$num;

        curl_setopt( $ch, CURLOPT_URL, $data );
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
        $out = curl_exec( $ch );
        curl_close( $ch );

        return $out;
    }
}
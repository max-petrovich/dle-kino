<?php

namespace Maxic\Service;

class SmsService
{

    /**
     * @var array
     */
    protected $options = array(
        'sender_id' => null,
        'sender_name' => null,
        'api_key' => null
    );

    /**
     * SmsService constructor.
     * @param array $options
     */
    public function __construct($options = array())
    {
        if (null === $options['sender_id'] || null === $options['api_key']) {
            throw new \RuntimeException("Options is not valid");
        }
        if (null === $options['sender_name']) {
            $options['sender_name'] = $options['sender_id'];
        }
        $this->options = $options;
    }

    public function send($phoneNum, $text)
    {
        $bsg = new \BSG($this->options['api_key'], $this->options['sender_id'], $this->options['sender_name']);

        $smsClient = $bsg->getSmsClient();
        $response = $smsClient->sendSms(
            $phoneNum,
            $text,
            'successSend' . (string)time()
        );

        return $response;
    }
}
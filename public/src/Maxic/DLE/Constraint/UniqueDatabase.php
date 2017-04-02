<?php

namespace Maxic\DLE\Constraint;

use Symfony\Component\Validator\Constraint;

class UniqueDatabase extends Constraint
{
    public $message = '%value%" already exists in database';
    public $db;
    public $tablePrefix = 'dle';
}
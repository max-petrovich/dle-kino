<?php

namespace Maxic\DLE\Constraint;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class UniqueDatabaseValidator extends ConstraintValidator
{
    public function validate($value, Constraint $constraint)
    {
        if (!isset($constraint->db)) {
            throw new \RuntimeException("No %db% parameter setted");
        }

        if ($constraint->db->super_query( "SELECT * FROM " . $constraint->tablePrefix . "_users WHERE email = '{$value}' " )) {
            $this->context->buildViolation($constraint->message)
                ->setParameter('%value%', $value)
                ->addViolation();
        }
    }
}
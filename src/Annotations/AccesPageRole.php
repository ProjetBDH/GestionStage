<?php
// src/Annotation/AccesPageRole.php

namespace App\Annotations;

use Doctrine\Common\Annotations\Annotation;

/**
 * @Annotation
 * @Target({"METHOD"})
 */
final class AccesPageRole extends Annotation
{
    public $access = false;
    public $exceptedRoles = [];
}
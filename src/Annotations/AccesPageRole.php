<?php
// src/Annotation/AccesPageRole.php

namespace App\Annotation;

use Doctrine\Common\Annotations\Annotation;

/**
 * @Annotation
 * @Target({"METHOD"})
 */
final class AccesPageRole extends Annotation
{
    public $access;
    public $exceptedRoles = [];
}
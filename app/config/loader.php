<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */

$loader->registerNamespaces(array(
    'Models'   => __DIR__ . '/../models/',
    'Controllers' => __DIR__ . '/../controllers/',
))->register();
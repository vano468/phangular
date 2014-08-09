<?php

$router = new Phalcon\Mvc\Router(false);

$router->add('/:controller/:action/:params', array(
    'namespace' => 'Controllers',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
));

$router->add('/:controller', array(
    'namespace' => 'Controllers',
    'controller' => 1,
));

$router->removeExtraSlashes(true);

return $router;
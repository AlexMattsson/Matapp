<?php


$router->get('/classes/get', 'api\ClassController@index');

$router->post('/feedback/store', 'api\FeedbackController@store');

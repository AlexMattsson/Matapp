<?php


$router->get('/classes/get', 'api\ClassController');

$router->post('/feedback/store',
    ['middleware' => 'access_key', "uses" =>
    'api\FeedbackController']);

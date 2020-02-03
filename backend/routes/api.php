<?php

$router->get('/classes/get', 'api\ClassController');

$router->post(
    '/feedback/store',
    ['middleware' => 'access_key', "uses" =>
    'api\FeedbackController']
);

$router->post('/register', 'api\AuthController@register');

$router->post('/login', 'api\AuthController@login');

$router->post('/logout', 'api\AuthController@logout');

$router->get('/profile', 'api\UserController@profile');

$router->get('/profile/position', 'api\UserController@profilePosition');

$router->get('/users/{id}', 'api\UserController@singleUser');

$router->get('/users', 'api\UserController@allUsers');

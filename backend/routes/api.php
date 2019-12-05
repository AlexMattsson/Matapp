<<<<<<< HEAD
<?php


$router->get('/classes/get', 'api\ClassController@index');

$router->post('/feedback/store', 'api\FeedbackController@store');
=======
<?php


$router->get('/classes/get', 'api\ClassController');

$router->post('/feedback/store',
    ['middleware' => 'access_key', "uses" =>
    'api\FeedbackController']);
>>>>>>> 1c4ced3d95c0f7fbb12a988cce89ff4e3eba83d8

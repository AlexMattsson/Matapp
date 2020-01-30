<?php

use App\Feedback;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group([
    'prefix' => '/login',
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', 'api\AuthController@index');
    $app->post('/auth', 'api\AuthController@login');
});

$router->get('/register', function () {
    return view("register");
});

$router->group([
    'middleware' => ['auth']
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', ['as' => 'index', 'token' => 'exampleToken', function () {
        $feedback = Feedback::all();
        return view("index", ['data' => $feedback]);
    }]);

    //Edit class page route
    $app->group([
        'prefix' => '/class',
    ], function (\Laravel\Lumen\Routing\Router $groupApp) {
        $groupApp->get('/', 'ClassController@index');
        $groupApp->patch('/{id:[\d]+}/update', 'ClassController@update');
        $groupApp->delete('/{id:[\d]+}/delete', 'ClassController@destroy');
        $groupApp->post('/create', 'ClassController@store');
    });
});

//Index page route

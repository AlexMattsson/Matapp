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

$router->get('/', function () use ($router) {
    $feedback = Feedback::all();
    return view("index", ['data' => $feedback]);
});

$router->group([
    'prefix' => '/class',
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', 'ClassController@index');
    $app->post('/', 'ClassController@store');
    $app->get('/{id:[\d]+}', [
        'as' => 'authors.show',
        'uses' => 'ClassController@show'
    ]);
    $app->patch('/{id:[\d]+}', 'ClassController@update');
    $app->delete('/{id:[\d]+}', 'ClassController@destroy');
});
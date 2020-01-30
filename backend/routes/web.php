<?php

use App\Feedback;
use Carbon\Carbon;
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

//Index page route
$router->get('/', function () use ($router) {
    $feedback = Feedback::all();
    return view("index", ['data' => $feedback]);
});

//Edit class page route
$router->group([
    'prefix' => '/class',
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', 'ClassController@index');
    $app->patch('/{id:[\d]+}/update', 'ClassController@update');
    $app->delete('/{id:[\d]+}/delete', 'ClassController@destroy');
    $app->post('/create', 'ClassController@store');
});

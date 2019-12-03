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
$router->get('/options.blade.php', function () use ($router) {
    return view("options");
});

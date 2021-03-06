<?php

use App\Feedback;
use App\User;
use Illuminate\Support\Facades\Cookie;
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

$router->group([
    'prefix' => '/auth',
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', 'api\AuthController@index');
    $app->post('/login', 'api\AuthController@login');
    $app->post('/logout', 'api\AuthController@logout');
});

$router->get('/register', function () {
    return view("register");
});

$router->group([
    'middleware' => ['auth']
], function (\Laravel\Lumen\Routing\Router $app) {
    $app->get('/', ['as' => 'index', 'token' => 'exampleToken', function () {
        $feedback = Feedback::all();
        $user = User::where('api_token', $_COOKIE['token'])->firstOrFail();
    
        //hitta profil positonen 
        

        return view("index", ['data' => $feedback, 'resturant_id' => $user->resturant_id]);
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

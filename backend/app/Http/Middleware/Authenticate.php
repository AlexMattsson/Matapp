<?php

namespace App\Http\Middleware;

use Closure;
use App\User;
use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException as Exception;

class Authenticate
{
    /**
     * The authentication guard factory instance.
     *
     * @var \Illuminate\Contracts\Auth\Factory
     */
    protected $auth;

    /**
     * Create a new middleware instance.
     *
     * @param  \Illuminate\Contracts\Auth\Factory  $auth
     * @return void
     */
    public function __construct(Auth $auth)
    {
        $this->auth = $auth;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (isset($_COOKIE['token'])) {
            try {
                $user = User::where('api_token', $_COOKIE['token'])->firstOrFail();
            } catch (Exception $e) {
                report($e);
                return redirect('/auth');
            }
        } else {
            return redirect('/auth');
        }

        return $next($request);
    }
}

<?php

namespace App\Http\Middleware;

use Closure;

class ExternalKeyMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $request->validate([
            'access_key' => 'bail|required|exists:accesskeys'
        ]);
        return $next($request);
    }
}

<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Log;

use Closure;

class WhiteListIp
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */

    public $AllowedIps = ['192.168.0.49', '127.0.0.1'];


    public function handle($request, Closure $next)
    {

        if (in_array($request->ip(), $this->AllowedIps)) {
            //Log::critical($request->ip());

            return $next($request);
        } else {
            return response()->json(['you dont have permission to access this application.']);
        }
    }
}

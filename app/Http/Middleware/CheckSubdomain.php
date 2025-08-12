<?php

namespace App\Http\Middleware;

use Closure;

class CheckSubdomain
{
    public function handle($request, Closure $next, $allowedSubdomains)
    {
        $subdomain = explode('.', str_replace('www.', '', $request->getHost()))[0];
        $allowedList = explode('|', $allowedSubdomains);

        if (!in_array($subdomain, $allowedList)) {
            abort(404);
        }

        return $next($request);
    }
}

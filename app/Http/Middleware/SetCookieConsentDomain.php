<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SetCookieConsentDomain
{
    public function handle(Request $request, Closure $next)
    {
        $host = $request->getHost();

        // Optional: Basisdomain ermitteln, z. B. für Subdomains wie app.example.com → .example.com
        $domain = $host;
        if (filter_var($host, FILTER_VALIDATE_IP)) {
            $domain = null; // z. B. bei localhost oder 127.0.0.1
        } elseif (str_ends_with($host, 'example.com')) {
            $domain = '.example.com';
        }

        // Dynamisch Cookie-Name und Domain setzen
        config([
            'cookie-consent.cookie.domain' => $domain,
            'cookie-consent.cookie.name' => 'cookie_consent_' . str_replace('.', '_', $host),
            'cookie-consent.cookie.lifetime' => 525600, // z. B. auch hier setzen!

        ]);

        return $next($request);
    }
}

<?php

namespace App\Providers;
use App\Http\Controllers\GlobalController;
use Illuminate\Support\ServiceProvider;
use Whitecube\LaravelCookieConsent\CookiesManager;
use Whitecube\LaravelCookieConsent\Cookies\Manager;
use Whitecube\LaravelCookieConsent\Facades\LaravelCookieConsent;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Config;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Globaler Domain-Switch (z. B. für Multi-Tenant)
        if (app()->runningInConsole()) {
            return; // Verhindere Ausführung bei Artisan-Commands
        }
        // app()->singleton(LaravelCookieConsent::class, function ($app) {
        //     $consent = new LaravelCookieConsent();

        //     $consent->setCookieDomain(request()->getHost()); // <- Dynamisch

        //     return $consent;
        // });
        // Config::set('cookieconsent.cookie.domain', request()->getHost());
        // app(CookieConsent::class)->useCookieName('cookie_consent_' . str_replace('.', '_', request()->getHost()));
        // app(LaravelCookieConsent::class)->useCookieName(
        //     'cookie_consent_' . str_replace('.', '_', request()->getHost())
        // );

        // $host = str_replace('.', '_', request()->getHost());

        // app(CookieConsentManager::class)->useCookieName('cookie_consent_' . $host);

        // $host = request()->getHost(); // z. B. blog.domain.de
        // $slug = str_replace(['.', ':'], '_', $host); // daraus wird z. B. "blog_domain_de"

        // CookiesManager::useCookieName('cookie_consent_' . $slug);

        // $host = str_replace('.', '_', request()->getHost());

     //  CookieConsent::useCookieName('cookie_consent_' . $host);

        $subb = explode('.', str_replace("www.",'',request()->getHost()))[0];
        switch($subb){
            case "asario":
                $subb = "ab";
            break;
            case "monikadargies":
                $subb = "dag";
            break;
            case "marblefx":
                $subb = "mfx";
            break;
            case "mjs":
                $subb = "mjs";
            break;
            case "ra-c-henning":
                $subb = "chh";
            break;
            default:
            $subb = $subb;
            break;
        }
        $subb2 = $subb;
        if(substr_count($_SERVER['REQUEST_URI'],"/login") || substr_count($_SERVER['REQUEST_URI'],"/admin/"))
        {
            $subb2  = "ab";
            // dd(rawurldecode("%7B%22consent_at%22%3A1752311194%2C%22laravel_cookie_consent%22%3Atrue%2C%22laravel_session%22%3Atrue%2C%22XSRF-TOKEN%22%3Atrue%2C%22darkmode_enabled%22%3Afalse%7D"));
        }

        View::share('subdomain', $subb);
        View::share('sd_alt', $subb2);
        GlobalController::SetDomain();
    }
}

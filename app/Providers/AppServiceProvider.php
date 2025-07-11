<?php

namespace App\Providers;
use App\Http\Controllers\GlobalController;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
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
            // dd($subb);
        }

        View::share('subdomain', $subb);
        View::share('sd_alt', $subb2);
        GlobalController::SetDomain();
    }
}

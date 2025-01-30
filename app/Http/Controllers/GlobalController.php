<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class GlobalController extends Controller
{
    public function __construct()
    {

    }
    public static function SetDomain()
    {
        $subdomain = explode('.', request()->getHost())[0]; // Subdomain extrahieren

        if ($subdomain === 'hm') {
            config(['database.default' => 'mariadb_hm']);
        } else {
            config(['database.default' => 'mariadb']);
        }
        if ($subdomain == 'hm') {
            // Verbindung zu 'laravel-tutorial-hm' wechseln
            \DB::setDefaultConnection('mariadb_hm');
        } else {
            // Standardverbindung zu 'laravel-tutorial'
            \DB::setDefaultConnection('mariadb');
        }

    }

}

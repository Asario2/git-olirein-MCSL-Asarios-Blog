<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
    if (!session_id()) {
        session_start();
    }
class DarkModeController extends Controller
{
    public function __construct()
    {

        $dm = @$_SESSION['dm'] == "dark" ? 'dark' :'light';
        $_SESSION['dm'] = $dm;
        echo "";
    }
    public function toggle(Request $request)
    {
        // Toggle dark mode and store in session
        // $darkMode = $request->session()->get('dark_mode', 'light') === 'dark' ? 'light' : 'dark';
        // $newMode = $request->session()->get('dark_mode', 'light') === 'light' ? 'dark' : 'light';
        // $request->session()->put('dark_mode', $newMode);
        if ($request->session()->get('dark_mode', 'light') === 'light' && $_SESSION['dm'] == "light") {
            $request->session()->forget('dark_mode');
            $_SESSION['dm'] = "dark";
            $request->session()->put('dark_mode', 'dark');
        } else {
            $request->session()->forget('dark_mode');
            $_SESSION['dm'] = 'light';
            $request->session()->put('dark_mode', 'light');
        }
        //$request->session()->put('dark_mode', $darkMode);

        return response()->json(['mode' => $_SESSION['dm']]);
    }
    public static function SetDarkMode($val)
    {
        session()->put('darkmode',$val);
    }

}

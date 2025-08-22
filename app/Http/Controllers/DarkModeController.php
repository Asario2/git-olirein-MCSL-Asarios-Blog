<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DarkModeController extends Controller
{
    public function toggle(Request $request)
    {
        $current = $request->session()->get('dark_mode', 'light');
        $newMode = $current === 'light' ? 'dark' : 'light';
        $request->session()->put('dark_mode', $newMode);

        return response()->json(['mode' => $newMode]);
    }

    public static function getMode()
    {
        return session('dark_mode', 'light');
    }
    public static function setDarkMode($mode)
    {
        $mode = $mode;
        // Beispiel: Dark-Mode im Session speichern
        session(['dark_mode' => $mode]);

        return response()->json([
            'status' => 'ok',
            'mode' => $mode,
        ]);
    }
    public static function setMode($mode)
    {
        session()->put('dark_mode', $mode);
    }
}

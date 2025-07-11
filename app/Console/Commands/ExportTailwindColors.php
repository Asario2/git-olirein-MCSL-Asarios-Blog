<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ExportTailwindColors extends Command
{
    protected $signature = 'tailwind:export-colors';
    protected $description = 'Export colors from DB to JSON file for Tailwind';

    public function handle()
    {
        // Beispiel: Farben aus Tabelle "colors" holen
        // Ersetze durch deine DB-Logik!

        $colors = DB::table('colors')->pluck('value', 'name')->toArray();

        // Beispiel: so könnte das aussehen:
        // $colors = [
        //    "primary" => "#ff0000",
        //    "layout-night-500" => "#330f00",
        // ];

        // Pfad zum Speichern (z.B. root-Verzeichnis oder public)
        $path = base_path('tailwind-colors_'.$subdomain.'.json');

        File::put($path, json_encode($colors, JSON_PRETTY_PRINT));

        $this->info("Colors exported to {$path}");
    }
}

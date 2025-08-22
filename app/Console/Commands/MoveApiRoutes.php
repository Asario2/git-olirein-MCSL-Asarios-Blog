<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class MoveApiRoutes extends Command
{
    protected $signature = 'routes:move-api';
    protected $description = 'Verschiebt alle API-Routen aus web.php nach api.php';

    public function handle()
    {
        $webPath = base_path('routes/web.php');
        $apiPath = base_path('routes/api.php');

        $webLines = file($webPath, FILE_IGNORE_NEW_LINES);
        $apiLines = [];

        $newWebLines = [];

        $collecting = false;
        $buffer = [];

        foreach ($webLines as $line) {
            // Start einer API-Route
            if (!$collecting && str_contains($line, 'Route::') && str_contains($line, '/api/')) {
                $collecting = true;
                $buffer[] = $line;
                continue;
            }

            // Sammelmodus aktiv: Zeilen anhängen
            if ($collecting) {
                $buffer[] = $line;

                // Ende der Route erreicht → wir beenden den Sammelmodus
                if (str_contains($line, '});')) {
                    $apiLines = array_merge($apiLines, $buffer, ['']); // Route + Leerzeile
                    $buffer = [];
                    $collecting = false;
                }

                continue;
            }

            // Normale (nicht-API) Zeilen bleiben in web.php
            $newWebLines[] = $line;
        }

        // Dateien überschreiben
        file_put_contents($webPath, implode(PHP_EOL, $newWebLines) . PHP_EOL);
        file_put_contents($apiPath, implode(PHP_EOL, $apiLines), FILE_APPEND);

        $this->info('Alle API-Routen wurden nach api.php verschoben!');
    }
}

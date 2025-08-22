<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ApiRoutesCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'routes:api-move';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Verschiebt alle /api/-Routen von routes/web.php nach routes/api.php';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $webFile = base_path('routes/web.php');
        $apiFile = base_path('routes/api.php');

        if (!file_exists($webFile)) {
            $this->error("Die Datei routes/web.php existiert nicht.");
            return Command::FAILURE;
        }

        $webLines   = file($webFile, FILE_IGNORE_NEW_LINES);
        $newWeb     = [];
        $apiLines   = [];

        $buffer     = [];
        $collecting = false;

        foreach ($webLines as $line) {
            // Start: Route mit /api/ gefunden
            if (!$collecting && str_contains($line, 'Route::') && str_contains($line, '/api/')) {
                $collecting = true;
                $buffer[] = $line;
                continue;
            }

            // Wenn wir gerade sammeln
            if ($collecting) {
                $buffer[] = $line;

                // Block-Ende erkannt
                if (str_contains($line, '});')) {
                    // Nur übernehmen, wenn die erste Zeile eine API-Route enthält
                    if (isset($buffer[0]) && str_contains($buffer[0], '/api/')) {
                        $apiLines = array_merge($apiLines, $buffer, ['']);
                    } else {
                        $newWeb = array_merge($newWeb, $buffer, ['']);
                    }

                    $buffer     = [];
                    $collecting = false;
                }
                continue;
            }

            // Normale Zeilen übernehmen
            $newWeb[] = $line;
        }

        // Datei web.php überschreiben
        file_put_contents($webFile, implode(PHP_EOL, $newWeb));

        // API-Routen anhängen
        if (!empty($apiLines)) {
            file_put_contents($apiFile, PHP_EOL . implode(PHP_EOL, $apiLines), FILE_APPEND);
        }

        $this->info("Alle /api/-Routen wurden verschoben!");
        return Command::SUCCESS;
    }
}


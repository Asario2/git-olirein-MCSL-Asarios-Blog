<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class CacheCdnAssets extends Command
{
    protected $signature = 'cache:assets';
    protected $description = 'Lädt externe JS- und CSS-Dateien aus Blade-Dateien lokal herunter und ersetzt die URLs.';

    public function handle()
    {
        $bladeFiles = File::allFiles(resource_path('views'));
        $cdnPattern = '/<(script|link)[^>]+(?:src|href)=["\'](https?:\/\/[^"\']+\.(css|js))["\'][^>]*>/i';
        $downloaded = [];

        foreach ($bladeFiles as $file) {
            $path = $file->getRealPath();
            $content = File::get($path);
            $newContent = $content;

            if (preg_match_all($cdnPattern, $content, $matches, PREG_SET_ORDER)) {
                foreach ($matches as $match) {
                    $tag = $match[1];
                    $url = $match[2];
                    $ext = $match[3];

                    // Lokaler Zielordner: public/js oder public/css
                    $filename = basename(parse_url($url, PHP_URL_PATH));
                    $localDir = public_path($ext);
                    $localPath = "$localDir/$filename";
                    $localUrl = "/$ext/$filename";

                    // Datei nur laden, wenn noch nicht vorhanden
                    if (!File::exists($localPath)) {
                        $this->info("Lade herunter: $url");
                        try {
                            $data = file_get_contents($url);
                            File::ensureDirectoryExists($localDir);
                            File::put($localPath, $data);
                        } catch (\Exception $e) {
                            $this->error("Fehler beim Laden von $url: " . $e->getMessage());
                            continue;
                        }
                    }

                    // URL im Template ersetzen
                    $newContent = str_replace($url, $localUrl, $newContent);
                    $downloaded[] = $url;
                }

                // Wenn geändert, Datei speichern
                if ($newContent !== $content) {
                    File::put($path, $newContent);
                    $this->info("Aktualisiert: $path");
                }
            }
        }

        $this->info("✅ Fertig! " . count($downloaded) . " externe Assets wurden verarbeitet.");
    }
}

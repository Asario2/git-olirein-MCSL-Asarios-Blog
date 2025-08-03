<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class GenerateJson extends Command
{
    protected $signature = 'app:generate-json';
    protected $description = 'Create JSON files as companion for image galleries';

    public function handle()
    {
        $basePath = public_path('images/_mfx/images/imgdir_content');
        $folders = $this->getSubfolders($basePath);

        foreach ($folders as $folderName) {
            $folderPath = $basePath . DIRECTORY_SEPARATOR . $folderName;
            $origPath = $folderPath; // Falls du später noch /orig brauchst, hier anpassen

            if (!is_dir($origPath)) {
                $this->warn("🔸 Übersprungen: Kein Ordner gefunden in $folderName");
                continue;
            }

            // Nur gültige Bilddateien einlesen
            $files = array_filter(scandir($origPath), function ($file) use ($origPath) {
                return preg_match('/\.(jpe?g|png)$/i', $file) && is_file($origPath . DIRECTORY_SEPARATOR . $file);
            });

            // Alphabetisch sortieren (natürlich, ohne Groß-/Kleinschreibung)
            natcasesort($files);

            $titleMap = $this->extractDescriptionsMap($folderPath);

            $position = 1;
            $data = [];

            foreach ($files as $file) {
                $fullPath = $origPath . DIRECTORY_SEPARATOR . "big" . DIRECTORY_SEPARATOR .$file;
                $info = @getimagesize($fullPath);
                if (!$info) {
                    $fullPath = $origPath . DIRECTORY_SEPARATOR . $file;
                    $info = @getimagesize($fullPath);

                    if(!$info){
                        $this->warn("❌ Ungültiges Bild: $file");
                        continue;
                    }
                }

                $basename = strtolower($file);

                $data[] = [
                    'position'     => $position++,
                    'filename'    => $basename,
                    'label' => $titleMap[$basename] ?? $basename,
                    'width'        => $info[0],
                    'height'       => $info[1],
                ];
            }

            // JSON-Datei schreiben
            $jsonPath = $folderPath . DIRECTORY_SEPARATOR . 'index.json';
            file_put_contents($jsonPath, json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));

            $this->info("✅ JSON erstellt: $folderName/index.json mit " . count($data) . " Einträgen.");
        }

        $this->info("🎉 Alle JSON-Dateien wurden erstellt.");
        return 0;
    }

    private function getSubfolders($dir)
    {
        return array_filter(scandir($dir), function ($item) use ($dir) {
            return $item !== '.' && $item !== '..' && is_dir($dir . DIRECTORY_SEPARATOR . $item);
        });
    }

    private function extractDescriptionsMap($folderPath)
    {
        $descFile = $folderPath . DIRECTORY_SEPARATOR . 'titlez.dat';
        if (!file_exists($descFile)) {
            return [];
        }

        // Titeldatei lesen und in UTF-8 konvertieren
        $content = mb_convert_encoding(file_get_contents($descFile), 'UTF-8', 'auto');
        $lines = explode("\n", $content);

        $map = [];

        foreach ($lines as $line) {
            $parts = explode('|||', trim($line));
            if (count($parts) === 3) {
                [, $filename, $description] = $parts;
                $map[strtolower(trim($filename))] = trim($description);
            }
        }

        return $map;
    }
}

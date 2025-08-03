<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class CopyImagesFromDirectories extends Command
{
    protected $signature = 'images:copy-from-dirs';
    protected $description = 'Sucht in bestimmten Ordnern nach Bilddateien und kopiert sie bei Übereinstimmung in public/images/original';

    protected $directories = [
        './_work',
        'D:\\XAMPPP\\htdocs\\mcs_general\\__work',
        'F:\\Backup\\PhotosBackup',
    ];

    public function handle()
    {
        $this->info("Starte die Durchsuchung der Ordner...");
        $imagePathsInDb = readimages("/images/_mfx/images/imgcomp_content/");
        // $imagePathsInDb = DB::table('images')->pluck('image_path')->toArray();
        $targetDir = public_path('images/images/orig');

        if (!File::exists($targetDir)) {
            File::makeDirectory($targetDir, 0755, true);
        }

        foreach ($this->directories as $dir) {
            $this->searchAndCopy($dir, $imagePathsInDb, $targetDir);
        }   

        $this->info("Fertig!");
    }
    protected function searchAndCopy($dir, $imagePathsInDb, $targetDir)
    {
        if (!File::exists($dir)) {
            $this->warn("Verzeichnis nicht gefunden: $dir");
            return;
        }

        $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];

        $files = File::allFiles($dir);

        foreach ($files as $file) {
            $extension = strtolower($file->getExtension());

            // Nur Bilddateien berücksichtigen
            if (!in_array($extension, $allowedExtensions)) {
                continue;
            }

            $filename = $file->getFilename();
            $filepath = $file->getRealPath();

            $md5Filename = md5($filename . "_1");

            if (in_array($filename, $imagePathsInDb) || in_array($md5Filename, $imagePathsInDb)) {
                $destination = $targetDir . DIRECTORY_SEPARATOR . $filename;

                if (!File::exists($destination)) {
                    File::copy($filepath, $destination);
                    $this->info("Kopiert: $filename");
                } elseif (filesize($filepath) > filesize($destination)) {
                    File::copy($filepath, $destination);
                    $this->info("Ersetzt (größer): $filename");
                } else {
                    $this->line("Bereits vorhanden (und gleich oder größer): $filename");
                }
            }
        }
    }

}

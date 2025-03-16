<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class CleanUnusedImages extends Command
{
    protected $signature = 'clean:unused-images';
    protected $description = 'Löscht nicht verwendete Bilder aus den Blog-Ordnern, wenn sie nicht in der Datenbank existieren';

    public function handle()
    {
        $basePath = public_path('images/blogs');
        $subDirs = ['big', 'thumbs', 'orig'];

        // Alle Bilddateien in den Verzeichnissen sammeln
        $allImages = collect(File::files($basePath))
            ->merge(collect($subDirs)->flatMap(fn($dir) => File::files("$basePath/$dir")))
            ->map(fn($file) => $file->getFilename());

        // Alle Bilder, die in der Datenbank vorhanden sind
        $dbImages = DB::table('blogs')->pluck('image_path')->filter()->unique()->toArray();

        $deleted = 0;
        foreach ($allImages as $image) {
            if (!in_array($image, $dbImages) && $image != "009.jpg") {
                // Datei aus allen relevanten Ordnern löschen
                File::delete("$basePath/$image");
                foreach ($subDirs as $dir) {
                    File::delete("$basePath/$dir/$image");
                }
                $deleted++;
                $this->info("Gelöscht: $image");
            }
        }
        $basePath = public_path('images/images');
        $subDirs = ['big', 'bthumbs', 'orig','sm','thumbs'];

        // Alle Bilddateien in den Verzeichnissen sammeln
        $allImages = collect(File::files($basePath))
            ->merge(collect($subDirs)->flatMap(fn($dir) => File::files("$basePath/$dir")))
            ->map(fn($file) => $file->getFilename());

        // Alle Bilder, die in der Datenbank vorhanden sind
        $dbImages = DB::table('images')->pluck('image_path')->filter()->unique()->toArray();

        $deleted = 0;
        foreach ($allImages as $image) {
            if (!in_array($image, $dbImages) && $image != "009.jpg") {
                // Datei aus allen relevanten Ordnern löschen
                File::delete("$basePath/$image");
                foreach ($subDirs as $dir) {
                    File::delete("$basePath/$dir/$image");
                }
                $deleted++;
                $this->info("Gelöscht: $image");
            }
        }


        $this->info("✅ Fertig! $deleted Dateien wurden gelöscht.");
    }
}

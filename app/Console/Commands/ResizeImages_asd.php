<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Imagick\Driver as ImagickDriver;

class ResizeImages_asd extends Command
{
    protected $signature = 'imagedir:resize';
    protected $description = 'Resize images in all folders to 400px width and save to thumbs.';

    public function handle()
    {
        $baseDir = public_path('images/_mfx/images/imgdir_content');
        $folders = $this->readFolders($baseDir);
        $manager = new ImageManager(new ImagickDriver());

        foreach ($folders as $folder) {
            $sourceDir = $baseDir . '/' . $folder . '/orig';
            $thumbsDir = $baseDir . '/' . $folder . '/thumbs';

            if (!File::exists($sourceDir)) {
                $this->info("Quelle fehlt: $sourceDir");
                continue;
            }

            if (!File::exists($thumbsDir)) {
                File::makeDirectory($thumbsDir, 0777, true);
            }

            $files = File::files($sourceDir);
            foreach ($files as $file) {
                $thumbPath = $thumbsDir . '/' . $file->getFilename();

                // Optional: Überspringen, wenn Thumbnail schon existiert
                if (File::exists($thumbPath)) {
                    continue;
                }

                // Bild einlesen & proportional auf 400px Breite skalieren
                $image = $manager->read($file->getPathname());
                $width = 400;
                $height = (int) ($image->height() * ($width / $image->width()));
                $image = $image->resize($width, $height);
                $image->save($thumbPath);

                $this->info("Resized: $folder/" . $file->getFilename());
            }
        }
    }

    /**
     * Holt alle Unterordner im angegebenen Verzeichnis.
     */
    private function readFolders($path): array
    {
        if (!File::exists($path)) {
            $this->warn("Verzeichnis nicht gefunden: $path");
            return [];
        }

        $exclude = ['thumbs', 'orig', 'sm', 'big', 'ret', 'bthumbs', 'titlez.dat'];

        return collect(File::directories($path))
            ->map(fn($dir) => basename($dir))
            ->filter(fn($dirName) => !in_array($dirName, $exclude))
            ->values()
            ->toArray();
    }
}

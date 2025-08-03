<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Imagick\Driver as ImagickDriver;
use Intervention\Image\Image; // Import der Image-Klasse

class ResizeImages extends Command
{
    protected $signature = 'images:resize';
    protected $description = 'Resize images to 350px width and save to /thumbs/';

    // public function handle()
    // {
    //     $this->info("Teststart");

    //     $dirs = $this->readfolders("images/_mfx/images/imgdir_content/");
    //     dd($dirs); // Stopp und prüfe Ergebnis

    //     $this->info("Testende");
    // }
    public function handle()
    {
        $this->info("Start resizing...");

        $manager = new ImageManager(new ImagickDriver());

        foreach ($this->readfolders("/images/_mfx/images/imgdir_content/") as $ref) {

            $sourceDir = public_path("/images/_mfx/images/imgdir_content/$ref/orig/");
            $thumbsDir = $sourceDir . '/..';

            if (!File::exists($thumbsDir)) {
                File::makeDirectory($thumbsDir, 0777, true);
            }

            if (!File::exists($sourceDir)) {
                $this->warn("Quellordner fehlt: $sourceDir");
                continue;
            }

            foreach (File::files($sourceDir) as $file) {
                $thumbPath = $thumbsDir . '/' . $file->getFilename();
                if (File::exists($thumbPath)) {
                    // continue;
                }

                $image = $manager->read($file->getPathname());
                $width = 1000;
                $height = (int) ($image->height() * ($width / $image->width()));
                $image = $image->resize($width, $height);
                $image->save($thumbPath);
                $this->info("Resized: " . $file->getFilename());
            }
        }

        $this->info("✅ Fertig!");
    }
    protected function readfolders($relativePath)
    {
        $fullPath = public_path($relativePath);

        if (!File::exists($fullPath)) {
            return [];
        }

        return collect(File::directories($fullPath))
            ->map(fn($dir) => basename($dir))
            ->filter(fn($name) => !in_array($name, ['thumbs', 'orig', 'big', 'ret', 'sm', 'bthumbs', 'titlez.dat']))
            ->values()
            ->toArray();
    }
}

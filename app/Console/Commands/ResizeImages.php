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

    public function handle()
    {
        $sourceDirs = [public_path("images/images/orig")        ];
        $thumbsDir = public_path('images/images/thumbs');

        if (!File::exists($thumbsDir)) {
            File::makeDirectory($thumbsDir, 0777, true);
        }

        // ImageManager mit ImagickDriver initialisieren
        $manager = new ImageManager(new ImagickDriver());

        foreach ($sourceDirs as $sourceDir) {
            if (!File::exists($sourceDir)) {
                continue;
            }

            $files = File::files($sourceDir);
            foreach ($files as $file) {
                $thumbPath = $thumbsDir . '/' . $file->getFilename();
                if (File::exists($thumbPath)) {
                    // continue;
                }

                // Bild einlesen und skalieren
                 $image =  $manager->read($file->getPathname())->resize(400, null, function ($constraint) {
                    $constraint->aspectRatio(); // Maintains aspect ratio
                    $constraint->upsize(); // Prevents upscaling the image if it's smaller than 350px
                 });
                $image = $manager->read($file->getPathname());
                $width = 400;
                $height = (int) ($image->height() * ($width / $image->width()));
                //  \Log::info($width."x".$height);
                $image = $image->resize($width, $height);
                $image->save($thumbPath);
                $this->info("Resized: " . $file->getFilename());
            }
        }
    }
}

<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Imagick;

class WatermarkImages extends Command
{
    protected $signature = 'watermark:images ';
    protected $description = 'Bilder mit Watermark versehen und skalieren';

    public function handle()
    {
        $baseDir = public_path("/images/_mfx/images/imgdir_content/");

        foreach($this->readfolders($baseDir) as $ddir)
        {
        $path = $baseDir . $ddir;
        $origDir = $path . '/orig';
        $bigDir = $path . '/big';
        $watermarkPath = $path . '/../../watermark_mfx.png';
            // dd($origDir);
        if (!is_dir($origDir)) {
            $this->error("Ordner $origDir existiert nicht.");
            continue;
        }

        if (!file_exists($watermarkPath)) {
            $this->error("Watermark-Datei $watermarkPath existiert nicht.");
            continue;
        }

        if (!is_dir($bigDir)) {
            mkdir($bigDir, 0755, true);
        }

        $watermark = new Imagick($watermarkPath);
        $watermarkWidth = $watermark->getImageWidth();
        $watermarkHeight = $watermark->getImageHeight();

        $files = readimages_alt($origDir);
        // dd($files);

        foreach ($files as $file) {
            $image = new Imagick($file);

            // Bildbreite prüfen und skalieren
            $width = $image->getImageWidth();
            $height = $image->getImageHeight();

            if ($width > 1350) {
                $newHeight = (1350 / $width) * $height;
                $image->resizeImage(1350, $newHeight, Imagick::FILTER_LANCZOS, 1);
            }

            // Position Watermark: rechts unten
            $imgWidth = $image->getImageWidth();
            $imgHeight = $image->getImageHeight();

            $x = $imgWidth - $watermarkWidth - 10; // 10px Abstand zum Rand
            $y = $imgHeight - $watermarkHeight - 10;

            // Watermark auf Bild setzen (composite)
            $image->compositeImage($watermark, Imagick::COMPOSITE_OVER, $x, $y);

            // Bild speichern
            $filename = basename($file);
            $image->writeImage($bigDir . '/' . $filename);

            $image->clear();
            $image->destroy();

            $this->info("Verarbeitet: $filename");
        }
    }
        $watermark->clear();
        $watermark->destroy();

        $this->info("Alle Bilder verarbeitet.");

    }
    private function readfolders($dir)
    {
        $folders = [];
        foreach (scandir($dir) as $item) {
            if ($item === '.' || $item === '..') continue;
            if (is_dir($dir . '/' . $item)) {
                $folders[] = $item;
            }
        }
        return $folders;
    }
}

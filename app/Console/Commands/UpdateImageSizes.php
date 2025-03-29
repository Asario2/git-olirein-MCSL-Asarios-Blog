<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Models\Image;

class UpdateImageSizes extends Command
{
    // Der Name des Befehls
    protected $signature = 'images:update-sizes';

    // Eine kurze Beschreibung des Befehls
    protected $description = 'Liest alle Bilder aus dem Verzeichnis und speichert deren Größe in der Datenbank';

    // Führe die Logik aus
    public function handle()
    {
        // Definiere den Pfad zum Ordner mit den Bildern
        $directory = public_path('images/images/big/'); // Verzeichnis mit den Bildern

        // Hole alle Bilddateien im Verzeichnis
        $files = glob($directory . '*.{jpg,jpeg,png,gif}', GLOB_BRACE);

        foreach ($files as $file) {
            // Hole die Breite und Höhe des Bildes
            list($width, $height) = getimagesize($file);

            // Überprüfe, ob das Bild bereits in der Datenbank existiert
            $imagePath = basename($file); // Bildpfad relativ zum public-Verzeichnis
            // s

            $image = Image::where('image_path', $imagePath)->first();

            // Wenn das Bild gefunden wurde, aktualisiere die Größe
            if ($image) {
                $image->update([
                    'img_x' => $width,
                    'img_y' => $height,
                ]);
                $this->info("Datensatz für $imagePath erfolgreich aktualisiert.");
            } else {
                // Wenn das Bild nicht existiert, kannst du es entweder überspringen oder einen neuen Datensatz erstellen
                $this->warn("Bild $imagePath nicht in der DB gefunden.");
            }
        }

        $this->info('Alle Bilder wurden erfolgreich verarbeitet!');
    }
}

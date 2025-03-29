<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    // Die Tabelle, die dieses Model repräsentiert
    protected $table = 'images';

    // Die Felder, die massenweise zugewiesen werden können
    protected $fillable = [
        'image_path', // Der Pfad des Bildes
        'img_x',      // Breite des Bildes
        'img_y',      // Höhe des Bildes
    ];

    // Falls du Timestamps nicht benötigst, kannst du diese Zeilen entfernen
    public $timestamps = false;
}

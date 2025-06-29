<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;


class MigrateRatings extends Command
{
    protected $signature = 'migrate:ratings';
    protected $description = 'Überträgt alte Bewertungsdaten in die neue ratings‑Tabelle';

    public function handle(): int
    {
        $this->info('Starte Update von ratings.table …');

        /*
        |--------------------------------------------------------------------------
        | Schritt 1: Alle relevanten Datensätze mit EINER Abfrage holen
        |--------------------------------------------------------------------------
        |
        |   i  = images
        |   io = images_old
        |   c  = image_cat
        |   ic = images_categories
        |
        |   Ergebnis-Spalten:
        |       • i.id      (image_id)
        |       • ic.name   (category_name)  → wird in ratings.table geschrieben
        */
        $rows = DB::table('images as i')
            ->join('images_old as io', 'io.headline', '=', 'i.headline')
            ->join('images_cat      as c',  'c.id',      '=', 'io.images_cat_id')
            ->join('image_categories as ic', 'ic.name', '=', 'c.name')
            ->select(
                'i.id  as image_id',
                'ic.name as category_name'
            )
            ->get();

        if ($rows->isEmpty()) {
            $this->warn('Keine passenden Datensätze gefunden.');
            return self::SUCCESS;
        }

        /*
        |--------------------------------------------------------------------------
        | Schritt 2: ratings.table aktualisieren
        |--------------------------------------------------------------------------
        |   • ratings muss mindestens die Spalte "image_id" (oder ähnlich)
        |     und die Spalte "table" besitzen.
        |   • Bei Bedarf passe den Where‑Key unten an (z. B. ratings.image_id).
        */
        $updated = 0;

        foreach ($rows as $row) {
            $affected = DB::table('ratings')
                ->where('id', $row->image_id)      // ← KEY in ratings
                ->update(['table' => ucfirst($row->category_name)]);

            $updated += $affected;
        }


        $this->info("Fertig – {$updated} Einträge in ratings.table aktualisiert.");
        $this->info('Setze ratings.table für alle leeren Einträge …');

        // -------- EIN einziges JOIN‑Update in Raw‑SQL --------
        $sql = "
            UPDATE ratings   AS r
            JOIN   images AS ii
            ON r.images_id=ii.id
            JOIN   image_categories AS ic

                   ON ic.id = ii.image_categories_id
            SET    r.`table` = ic.name
            WHERE  (r.`table` IS NULL OR r.`table` = '')
        ";

        $affected = DB::update($sql);

        $this->info("Fertig – {$affected} Zeile(n) aktualisiert.");
        return self::SUCCESS;
    }

    }

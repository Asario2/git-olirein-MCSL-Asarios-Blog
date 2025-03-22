<?php

    namespace App\Console\Commands;

    use Illuminate\Console\Command;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Support\Facades\Schema;
    use Carbon\Carbon;
    class RandomizeTimestamps extends Command
    {
        protected $signature = 'timestamps:randomize';
        protected $description = 'Setze zufällige Zeitstempel für die Spalten created_at, updated_at und published_at in aufsteigender Reihenfolge der IDs zwischen 02.10.2024 14:30:02 und 15.03.2025 22:25:57';


        public function handle()
        {
            // Tabellen und Spalten, die überprüft werden
            $tables = ['admin_table', 'didyouknow', 'images', 'ratings', 'testfield', 'comments'];
            $columns = ['created_at', 'published_at', 'updated_at'];

            // Start- und Enddatum für zufällige Zeitstempel
            $startDate = Carbon::create(2024, 10, 4, 0, 0, 0);
            $endDate = Carbon::create(2025, 3, 15, 23, 59, 59);

            // Durchlaufe alle Tabellen und Spalten
            foreach ($tables as $table) {
                foreach ($columns as $column) {
                    // Stelle sicher, dass die Spalte existiert
                    if (DB::getSchemaBuilder()->hasColumn($table, $column)) {
                        $this->updateNullValues($table, $column, $startDate, $endDate);
                    }
                }
            }

            $this->info('Die NULL-Werte wurden erfolgreich ersetzt!');
        }

        // Funktion zum Ersetzen der NULL-Werte in der Tabelle
        private function updateNullValues($table, $column, $startDate, $endDate)
        {
            // Holen der Zeilen mit NULL-Werten in der gegebenen Spalte, sortiert nach ID
            $rows = DB::table($table)
                ->whereNull($column)
                ->orderBy('id')
                ->get();

            // Berechne den Zeitraum in Sekunden
            $timeRange = $endDate->timestamp - $startDate->timestamp;

            // Gesamtanzahl der Zeilen
            $totalRows = $rows->count();

            // Durchlaufe alle Zeilen und ersetze die NULL-Werte mit einem chronologisch verteilten Datum
            foreach ($rows as $index => $row) {
                // Berechne den Zeitstempel für diese Zeile
                $timeOffset = ($index / ($totalRows - 1)) * $timeRange;
                $randomTimestamp = $startDate->timestamp + $timeOffset;

                // Generiere den zufälligen Zeitstempel
                $randomDate = Carbon::createFromTimestamp($randomTimestamp)->toDateTimeString();

                // Aktualisiere den Datensatz
                DB::table($table)
                    ->where('id', $row->id)
                    ->update([$column => $randomDate]);

                $this->info("Zeile ID {$row->id} in der Tabelle {$table} wurde mit {$randomDate} aktualisiert.");
            }
        }
    }

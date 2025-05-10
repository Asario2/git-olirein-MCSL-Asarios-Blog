<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

class ConvertTextFields extends Command
{
    protected $signature = 'convert:textfields';
    protected $description = 'Konvertiert alle TEXT-Felder in der DB mit RUMLAUT(), außer _table und cache';

    public function handle()
    {
        $tables = DB::select('SHOW TABLES');
        $dbNameKey = 'Tables_in_' . DB::getDatabaseName();

        foreach ($tables as $table) {
            $tableName = $table->$dbNameKey;

            if ($tableName === 'cache') {
                continue;
            }

            $columns = DB::select("SHOW COLUMNS FROM `$tableName`");

            // Filter gültige TEXT-Spalten
            $textColumns = array_filter($columns, function ($column) {
                $type = strtolower($column->Type);
                $name = $column->Field;

                return (
                    !Str::endsWith($name, '_table') &&
                    (
                        Str::contains($type, 'text') ||
                        Str::contains($type, 'varchar')
                    )
                );
            });

            if (empty($textColumns)) {
                continue;
            }

            $rows = DB::table($tableName)->get();

            foreach ($rows as $row) {
                $update = [];
                $id = $row->id ?? null;

                if (!$id) continue;

                foreach ($textColumns as $column) {
                    $field = $column->Field;
                    $value = $row->$field;

                    if (!$value) {
                        continue;
                    }

                    $converted = RUMLAUT($value,$tableName);

                    if ($converted !== $value) {
                        $update[$field] = $converted;
                    }
                }

                if (!empty($update)) {
                    DB::table($tableName)->where('id', $id)->update($update);
                    $this->info("Updated ID $id in table $tableName");
                }
            }
        }

        $this->info('Alle gültigen Felder wurden erfolgreich bearbeitet.');
    }
}

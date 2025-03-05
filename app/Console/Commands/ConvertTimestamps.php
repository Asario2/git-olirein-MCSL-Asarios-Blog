<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class ConvertTimestamps extends Command
{
    protected $signature = 'convert:timestamps {table}';
    protected $description = 'Konvertiert UNIX-Timestamps zu DATETIME und ändert Spaltentypen';

    public function handle()
    {
        $tableName = $this->argument('table');
        $this->convertTableTimestamps($tableName);
        $this->info("Timestamps in Tabelle $tableName wurden konvertiert.");
    }

    private function convertTableTimestamps(string $tableName)
    {
        $columns = Schema::getColumnListing($tableName);
        $timestampColumns = ['created_at', 'updated_at', 'published_at'];
        
        // Temporär in VARCHAR(200) umwandeln
        Schema::table($tableName, function (Blueprint $table) use ($columns, $timestampColumns) {
            foreach ($timestampColumns as $column) {
                if (in_array($column, $columns)) {
                    $table->string($column, 200)->nullable()->change();
                }
            }
        });
        
        // Unix-Timestamps in DATETIME umwandeln
        foreach ($timestampColumns as $column) {
            if (in_array($column, $columns)) {
                DB::statement("UPDATE `$tableName` SET `$column` = FROM_UNIXTIME(`$column`) WHERE `$column` REGEXP '^[0-9]{1,10}$'");
            }
        }
        
        // Spalten auf DATETIME setzen
        Schema::table($tableName, function (Blueprint $table) use ($columns, $timestampColumns) {
            foreach ($timestampColumns as $column) {
                if (in_array($column, $columns)) {
                    $table->dateTime($column)->nullable()->change();
                }
            }
        });
    }
}

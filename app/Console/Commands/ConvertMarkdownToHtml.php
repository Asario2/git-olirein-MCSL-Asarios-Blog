<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use League\CommonMark\CommonMarkConverter;

class ConvertMarkdownToHtml extends Command
{
    protected $signature = 'convert:markdown-to-html';
    protected $description = 'Konvertiert alle TEXT-Felder in Markdown zu HTML (inkl. nl2br)';

    public function handle()
    {
        $converter = new CommonMarkConverter([
            'html_input' => 'escape',
            'allow_unsafe_links' => false,
        ]);

        $tables = DB::select('SHOW TABLES');
        $dbName = "oliver_rein";
        $key = "Tables_in_{$dbName}";

        foreach ($tables as $tableObj) {
            $table = $tableObj->$key;
            $this->info("Verarbeite Tabelle: $table");

            if (!Schema::hasTable($table)) continue;

            $columns = DB::select("SHOW COLUMNS FROM `$table`");

            // Filtere auf TEXT-Spalten
            $textColumns = collect($columns)->filter(function ($column) {
                return Str::contains($column->Type, ['text']);
            });

            if ($textColumns->isEmpty()) continue;

            $rows = DB::table($table)->get();

            foreach ($rows as $row) {
                $updated = false;
                $updateData = [];

                foreach ($textColumns as $col) {
                    $field = $col->Field;
                    $value = $row->$field ?? null;
                    $vax = false;
                    if( substr_count($field,"_table") || $field == "cache" ){
                        $value2 = str_replace(["<p>","</p>","<br />"],'',$value);
                        $vax = true;
                    }

                    if (!$value || Str::startsWith(trim($value), '<') || Str::startsWith(trim($value), 'i:')) {
                        continue;
                    }
                    if(!$vax)
                    {
                        $html = RUMLAUT($converter->convert($value)->getContent());
                        $html = nl2br($html);
                    }
                    else{
                        $html = $value2;
                    }


                    if ($html !== $value) {
                        $updateData[$field] = $html;
                        $updated = true;
                    }
                }

                if ($updated) {
                    @DB::table($table)->where('id', $row->id)->update($updateData);
                    $this->line("➤ Aktualisiert ID {$row->id} in $table");
                }
            }
        }

        $this->info('✅ Konvertierung abgeschlossen.');
    }
}

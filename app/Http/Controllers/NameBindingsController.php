<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Settings;
class NameBindingsController extends Controller
{
    public function RefreshFields()
    {
        // Schritt 1: Alle name aus der Tabelle `admin_table` extrahieren
        $tableNames = DB::table('admin_table')->pluck('name')->toArray();

        // Schritt 2: Überprüfen, ob jede Tabelle in der Datenbank existiert
        $existingTables = [];
        foreach ($tableNames as $tableName) {
            if (DB::getSchemaBuilder()->hasTable($tableName)) {
                $existingTables[] = $tableName;
            }
        }

        // Schritt 3: Alle Spaltennamen der existierenden Tabellen sammeln
        $columns = [];
        foreach ($existingTables as $table) {
            $colss = DB::getSchemaBuilder()->getColumnListing($table);
            foreach ($colss as $column) {
                $columns2[$column] = '';  // Füge die Spalte als Schlüssel hinzu
            }

            $columns = array_merge($columns2,$columns);
        }

        // Optional: Gebe das Ergebnis zurück
        // return response()->json([
        //     'existing_tables' => $existingTables,
        //     'columns' => $columns,
        // ]);
        $this->RemoveDuplicates($columns);
    }
    public function RemoveDuplicates($cols)
    {
         $exl = Settings::$exl;
        $columns = $cols;
        $filteredColumns = [];
        foreach($columns as $key=>$value)
        {
            if(!array_key_exists($key,$exl)){
                $filteredColumns[$key] = $value;
            }
        }






         $newcont = '';
         foreach($filteredColumns as $key=>$vale)
         {
            $newcont .= "\"$key\"=>\"\", ";
         }
         echo "<pre>".wordwrap($newcont,200,"\n")."</pre>";
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Inertia\Inertia;
use Illuminate\Support\Facades\Hash;
use Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\IMULController;
use App\Http\Controllers\GlobalController;
use App\Http\Controllers\FormController;
use App\Helper\CustomHelpers;
use App\Models\Settings;
use App\Models\Table;
use App\Models\AdminTable;
use App\Models\UsersRight;
use App\Services\Inkrementierer;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
if(!session_id()){
        session_start();
    }

class TablesController extends Controller
{
      public function __construct()
    {
        GlobalController::SetDomain();

    }

    public function index2()
    {
        if(!CheckRights(Auth::id(),"admin_table","view"))
        {
            return redirect()->route('tables.noview');

        }
        // Daten aus der 'admin_table' Tabelle abrufen (welche z.B. Tabellennamen und Beschreibungen enthält)
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("created_at","DESC")->get();

        // Gebe die Tabellen mit der Beschreibung an die View zurück
        return view('tables.index2', compact('tables'));
    }
    public function CCindex(Request $request)
    {
        if(!CheckRights(Auth::id(),"admin_table","view"))
        {
            return redirect()->route('tables.noview');

        }
        $offset = $request->input('offset', 0);
        $limit = 10;
        // Daten aus der 'admin_table' Tabelle abrufen (welche z.B. Tabellennamen und Beschreibungen enthält)
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("created_at","DESC")->get();
        $table = "comments";
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);

        if ($table == "blogs" || $table == "mindblog" || $table == "images") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->skip($offset)->take($limit)->get();
        // Gebe die Tabellen mit der Beschreibung an die View zurück
        return view('tables.CC', compact('tables','table','columns','posts'));
    }
        public function loadMore(Request $request,$table)
    {
        $offset = $request->input('offset', 0);
        $limit = 10;

        // Weitere Beiträge laden

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blogs" || $table == "mindblog" || $table == "images") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }

        // Hole alle Einträge aus der Tabelle mit Paginierung
        $perPage = 10; // Anzahl der Einträge pro Seite
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->skip($offset)->take($limit)->get();
        //  $data = DB::table($table)->select($columns)->orderby($ord[0], $ord[1])->paginate($perPage);
        //$posts = DB::table($table)->where('pub',"1")->orderBy($ord[0], $ord[1])->take(10)->get();
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        // Wenn die Anfrage AJAX ist (für das Scrollen), gib JSON zurück
        // if ($request->ajax()) {
        //     return view('tables.partial_table_rows', compact('data', 'columns', 'table','tables'))->render();
        // }

        // Rückgabe der Hauptansicht

        return view('posts.partials.table_items', compact('posts','columns','tables','table'))->render();
    }
    public function loadMoreCC(Request $request,$table)
    {
        $offset = $request->input('offset', 0);
        $limit = 20;

        // Weitere Beiträge laden

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blogs" || $table == "mindblog" || $table == "images") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }

        // Hole alle Einträge aus der Tabelle mit Paginierung
        $perPage = 10; // Anzahl der Einträge pro Seite
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->skip($offset)->take($limit)->get();
        //  $data = DB::table($table)->select($columns)->orderby($ord[0], $ord[1])->paginate($perPage);
        //$posts = DB::table($table)->where('pub',"1")->orderBy($ord[0], $ord[1])->take(10)->get();
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        // Wenn die Anfrage AJAX ist (für das Scrollen), gib JSON zurück
        // if ($request->ajax()) {
        //     return view('tables.partial_table_rows', compact('data', 'columns', 'table','tables'))->render();
        // }

        // Rückgabe der Hauptansicht

        return view('posts.partials.comment_center', compact('posts','columns','tables','table'))->render();
    }
    public function com_loadMore(Request $request,$table)
    {
        $offset = $request->input('offset', 0);
        $limit = 10;

        // Weitere Beiträge laden
        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blogs" || $table == "mindblog" || $table == "images") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }

        $comments = DB::table('comments')
            ->join('users', 'comments.users_id', '=', 'users.id')
            ->where('comments.post_id', '=', 1)
            ///->whereNotIn('comments.id', $this->processedIds) // IDs aus processedIds ausschließen
            ->orderBy("comments.id", "asc") // Sortierung nach Erstellungsdatum
            ->select('users.name', 'users.image_path', 'comments.*') // Gewünschte Spalten auswählen
            ->take($limit)
            ->offset($offset)
            ->get() ;// Daten abrufen

        // Hole alle Einträge aus der Tabelle mit Paginierung
        $perPage = 10; // Anzahl der Einträge pro Seite
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->skip($offset)->take($limit)->get();
        //  $data = DB::table($table)->select($columns)->orderby($ord[0], $ord[1])->paginate($perPage);
        //$posts = DB::table($table)->where('pub',"1")->orderBy($ord[0], $ord[1])->take(10)->get();
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        // Wenn die Anfrage AJAX ist (für das Scrollen), gib JSON zurück
        // if ($request->ajax()) {
        //     return view('tables.partial_table_rows', compact('data', 'columns', 'table','tables'))->render();
        // }

        // Rückgabe der Hauptansicht

        return view('posts.partials.comment_items', compact('comments','posts','columns','tables','table'))->render();
    }
    public function edit(Request $request,$table, $id,$edit=false)
    {
        // Check if the table exists
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Table does not exist.']);
        }
        if(isset($_POST['image_path']))
        {

        $thumbcol = ['users'];
        $IMUL = NEW IMULController();
        if(in_array($table,$thumbcol))
        {
        $res = $IMUL->upload($request,'1050','image_path',"images/$table/big/");
        $res = $IMUL->upload($request,'350','image_path',"images/$table/thumbs/");
        $res = $IMUL->upload($request,'550','image_path',"images/$table/");
        }

        }
        // Get all columns excluding 'created_at', 'updated_at', and 'published_at'
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $excl_cols[] = "position";
        $ext_disabled = Settings::$excl_disabled;
        $ext_date = Settings::$excl_datefields;
        $exl = Settings::$exl;
        $req = Settings::$no_req;
        $columns = array_diff($columns, $excl_cols);

        // Find the specific record by its ID
        $entry = DB::table($table)->select($columns)->where('id', $id)->first();

        // Check if the entry exists
        if (!$entry) {
            return redirect()->back()->withErrors(['error' => 'Entry not found.']);
        }
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        // Return the edit view with the entry data
        $edit = @$_GET['edit'];
        $pic = @$_GET['pic'];
        return view('tables.edit', compact('entry', 'columns', 'table','ext_disabled','ext_date','exl','req','tables','edit','pic','id'));
    }
    public function xiupdate(Request $request,$table,$name,$id,$val)
    {

        DB::table($table)
    ->where('id', $id)
    ->update([$name => $val]);

    }
    function CreateTable(Request $request,$table)
    {
        // return "test";
        return $this->EditTables($request,0,$table);
    }
    function EditTables(Request $request,$id = '',$table='blogs',$kk=''){

        $path = request()->path(); // Gibt "home/show/images/search/Fasermaler"
        $parts = explode("/", $path);

        foreach(gettables() as $ta)
        {
            if(in_array($ta,$parts))
            {
                $table = $ta;
                $_GET['table'] = $ta;

            }
            continue;
        }
        if(!CheckRights(Auth::id(),$table,"edit"))
        {
            header("Location: /no-rights");
            exit;
        }
        if($id == 0 && !CheckRights(Auth::id(),$table,"add"))
        {
            header("Location: /no-rights");
            exit;
        }
        if(substr_count($table,".")){
            return;
        }
        // \Log::info("aaaaa:".json_encode([$table,$id]));
        $tablez = [];
        if(!empty($id))
        {
            if($table == "undefined" || !DB::table($table)->where("id",$id)->exists())
            {
                return redirect()->route("admin.tables.show",$table)->with('error', 'Kein Eintrag mit dieser ID vorhanden');
            }
        }


        $edstate = !$id ? "Erstellen" : "Bearbeiten";
        $breadcrumbs = collect($tablez)->mapWithKeys(function ($item) {
            //return [$item->title => route('admin.tables.show', $item->id)];
        });

        $breadcrumbs = $breadcrumbs->put('Liste der Tabellen', route('admin.tables.index'));
        $breadcrumbs->put('Tabelle '.ucf($table), route('admin.tables.show',(["table"=>$table])));
        $breadcrumbs = $breadcrumbs->toArray();

        $tables = DB::table($table)->get();

        $tables->transform(function ($item) {
            if (!empty($item->profile_photo_path)) {
                $item->profile_photo_path = "/images/" . $item->profile_photo_path;
            }
            return $item;
        });
        // if(!substr_count($taxx[$id]->profile_photo_path, "images") && Schema::hasColumn("profile_photo_path",$taxx  ))
        // {
        //     $taxx->profile_photo_path = "/images/".$taxx->profile_photo_path;
        // }
        $exf = $this->ExportFields($table,$id);
        // \Log::info("item:".json_encode($exf,JSON_PRETTY_PRINT));
        if(!@$kk){
            $entry = DB::table($table)->find($id);
            return Inertia::render('Admin/TableForm', [
                'entry'=> $entry,
                'datarows' => $tables,
                "rows" => $tables,
                "editstate"=> $edstate,
                "table" => $tables,
                "ItemName" => "Beiträge",
                "itemName_des" => "Beitrags",
                 "ffo"  => $exf,
                "tablez" => $table,
                'breadcrumbs' => $breadcrumbs,
            ])->withViewData(['debug' => true]);
        }
        // return [
        //     'datarows' => $tables,
        //     "rows" => $tables,
        //     "editstate"=> $edstate,
        //     "table" => $tables,
        //     "ItemName" => "Beiträge",
        //     "itemName_des" => "Beitrags",
        //     "ffo"  => $exf,
        //     "tablez" => $table,
        //     'breadcrumbs' => $breadcrumbs,
        // ];
    }
    public function GetOptionz($column)
    {
        $sortop = FormController::getOptions($column);
        return response()->json([$column.".sortedOptions" => $sortop]);
    }
    public function getOptionz_sel($table,$name)
    {
        $sortop = FormController::getOptions_sel($table,$name);
        return response()->json([$name.".sortedOptions_sel" => $sortop]);
    }
    public function getOptionz_itemscope($table,$name2)
    {
        $name = "status";
        $sortop = FormController::getOptions_itemscope($table,$name);
        return response()->json([$name.".sortedOptions_sel" => $sortop]);
    }
    public function ExportFields($table,$id)
    {
        $create = '';
        if ($table == "blogs" || $table == "mindblog" || $table == "comments") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif($table == "admin_table")
        {
            $ord[0] = "name";
            $ord[1] = "ASC";
        }
        elseif($table == "images")
        {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        // elseif ($table == "images") {
        //     $ord[0] = 'headline';
        //     $ord[1] = 'ASC';
        // }

        else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        $id = (int)$id;
        if(!Schema::hastable($table)){
            return;
        }
        $id = $id == 0 ? null : $id;
        $columns = Schema::getColumnListing($table);
        $columns = array_diff($columns, ['id']);
        // if (Schema::hasColumn($table, 'pub')) {
        //     $query = DB::table($table)->where("pub", "=", 1);
        // } else {
            $query = DB::table($table);
        // }
        if($id)
        {
            // dd($table);
            $tables = $query->where('id', $id)->orderBy($ord[0], $ord[1])->first();
            $exists = $query->where('id', $id)->exists();
            $ffoo = ["formFields" => ["defekt" => "true"]];
            if (!$exists) {
                // \Log::info("exists:".json_encode($ffoo));
                 return response()->json(($ffoo));
            }

        }
        else{
            if(is_int($table))
            {
                $table = $id;
            }

            $tables  = DB::table($table)->orderBy($ord[0],$ord[1])->first();
            $create = true;
        }


            foreach($columns as $column)
            {
                // \Log::info(json_encode([$column,$tables->$column]));
              $fields[] = FormController::Fields($column,$tables->$column,$table,$id,$create);
            }
            $formFields = array_filter($fields);


            $transformed = [];
            foreach ($formFields as $item) {
                if (is_array($item)) {
                    $key = array_key_first($item); // z. B. 'pub'
                    $transformed[$key] = $item[$key];
                }
            }
            // $formFields = json_decode(json_encode($formFields));
            $formFields = $transformed;
            $ar = ['formFields' => ($formFields)];
            $ar2 = 'formFields: {

                "idField": {
                  "name": "id",
                  "type": "text",
                  "label": "ID",
                  "value": "2",
                  "id": "2",
                  "class": "disabled"
               },
                "nameField": {
                  "name": "name",
                  "type": "text",
                  "label": "Name",
                  "value": "Devlog_alt",
                  "id": "2",
                  "class": "text"
               },
                "created_atField": {
                  "name": "created_at",
                  "type": "datetime",
                  "label": "Erstellt am:",
                  "value": "",
                  "id": "2",
                  "class": "datetime"
               }';
            //    \Log::info("item:".json_encode($formFields,JSON_PRETTY_PRINT));
            return response()->json($formFields);
    }
    public function ShowTable(Request $request, $table_alt = null)
    {
        $table = $table_alt ?? 'images';
        $path = request()->path();
        $path = strtolower($path);
        $parts = explode("/", $path);

        foreach (gettables() as $ta) {
            if (in_array($ta, $parts)) {
                $table = $ta;
                $_GET['table'] = $ta;
            }
        }

        // \Log::info("tb: " . $table);

        if (!$table || !Schema::hasTable($table)) {
                    abort(404, "Tabelle existiert nicht.");
        }

        if (!CheckRights(Auth::id(), $table, "view")) {
            return redirect("/no-rights");
        }



        $columns = Schema::getColumnListing($table);
        $joins = [];
        $selects = ["{$table}.*"];

        $headline = Settings::$headline[$table] ?? 'id';
        $otherField = Settings::$otherField[$table] ?? null;
        $of = $otherField ?? 'id';

        // Name alias
        $selects[] = "{$table}.{$headline} AS name";

        // Beschreibung
        if ($otherField != "users_id") {
            $selects[] = "{$table}.{$otherField} AS description";
        } elseif (in_array('users_id', $columns)) {
            $joins['users'] = [
                'from' => 'users.id',
                'to'   => "{$table}.users_id",
            ];
            $selects[] = "users.name AS users"; // wichtig!
            $selects[] = "{$table}.users_id";
        }

        foreach ($columns as $col) {
            if (Str::endsWith($col, '_id')) {
                $baseName = Str::beforeLast($col, '_id'); // z. B. admin_table_id → admin_table
                $relatedTable = $baseName;   // admin_table → admin_tables

                if (Schema::hasTable($relatedTable) && !isset($joins[$relatedTable])) {
                    $joins[$relatedTable] = [
                        'from' => "{$relatedTable}.id",
                        'to'   => "{$table}.{$col}",
                    ];

                    // 🎯 NAME-Wert als "admin_table", "users", etc. hinzufügen
                    $selects[] = "{$relatedTable}.name AS {$baseName}";
                }

                // Damit der Wert (z. B. users_id) im Ergebnis bleibt
                $selects[] = "{$table}.{$col}";
            }
        }
        // JOINs für *_id-Felder
        // foreach ($columns as $col) {
        //     if (Str::endsWith($col, '_id') && $col != "post_id") {
        //         $baseName = Str::beforeLast($col, '_id'); // z. B. admin_table_id → admin_table
        //         $relatedTable = Str::plural($baseName);   // admin_table → admin_tables

        //         if (Schema::hasTable($relatedTable) && !isset($joins[$relatedTable])) {
        //             $joins[$relatedTable] = [
        //                 'from' => "{$relatedTable}.id",
        //                 'to'   => "{$table}.{$col}",
        //             ];
        //             // → Alias als Singular: "users", "admin_table"
        //             $selects[] = "{$relatedTable}.name AS {$baseName}";
        //         }
        //     }
        // }

        // Query aufbauen
        $query = DB::table($table)->select($selects);

        foreach ($joins as $relatedTable => $join) {
            $query->leftJoin($relatedTable, $join['to'], '=', $join['from']);
        }

        // Sortierung
        if(Schema::hasColumn($table,"position")){
            $ord = ["position","asc"];
        }
            elseif ($table == "blogs" || $table == "didyouknow" || $table == "images" || $table == "comments" || $table == "shortpoems") {
                $ord = ["created_at", "DESC"];
            } elseif (in_array($table, ["admin_table", "image_categories", "camera","users"])) {

                $ord = ["name","ASC"];

            }
            elseif($table == "news" || $table == "projects"){
                $ord = ["created_at","DESC"];
            }
            elseif ($table == "images") {
                $ord = ["id", "DESC"];

            } elseif ($table == "privacy") {
                $ord = ["created_at", "ASC"];
            } elseif($table == "texts"){
                $ord = ["headline","ASC"];
            }
            elseif(Schema::hasColumn($table,"position")){
                $ord = ["position","ASC"];
            }
            else {
                $ord = ["id", "DESC"];
            }

        // Filter & Sortierung
        $pag = 20;
       if(@$request->search){
        $pag = 20;
       }
       $xis = $table.".id";
        $xisd = "-1";
        if($table == "users")
        {
            $xis = "xis_disabled";
            $xisd = "1";
        }

        // \Log::info("NA:".json_encode([$ord[0],$ord[1]]));
        // $tables = $query
        //     ->filterdefault(['search' => request('search')])
        //     ->whereNot($xis,$xisd)
        //     ->orderByRaw("LOWER($table.$ord[0]) $ord[1]")
        //     ->paginate($pag)
        //     ->withQueryString();

        $orderColumn = $table.".".$ord[0];
        $orderDirection = strtoupper($ord[1]) === 'DESC' ? 'DESC' : 'ASC';

        $tables = $query
            ->filterdefault(['search' => request('search')])
            ->whereNot($xis, $xisd)
            ->orderByRaw('CAST('.$orderColumn.' AS UNSIGNED) '.$orderDirection.'')
            ->paginate($pag)
            ->withQueryString();

        // Beschreibung kürzen
        if ($otherField) {
            $tables->getCollection()->transform(function ($item) use ($otherField) {
                if (isset($item->$otherField)) {
                    $item->description = html_entity_decode(KILLMD($item->$otherField, 18, 3));
                }
                return $item;
            });
        }

        // Hauptname-Text decodieren
        $tables->getCollection()->transform(function ($item) use ($table) {
            $nameField = "{$table}_name";
            if (isset($item->$nameField)) {
                $item->$nameField = html_entity_decode($item->$nameField);
            }
            return $item;
        });

        // Nutzerbilder laden (nur wenn users_id vorhanden)
        $result = $tables->items();
        $userIds = collect($result)->pluck('users_id')->unique()->filter()->values();

        $users_img = DB::table('users')
            ->whereIn('id', $userIds)

            ->select('id', 'profile_photo_path', 'name')
            ->get()
            ->keyBy('id')
            ->map(function ($user) {
                return [
                    'img' => $user->profile_photo_path,
                    'name' => $user->name,
                ];
            });

        return Inertia::render('Admin/TableShow', [
            'filters' => array_filter(request()->only(['search'])),
            'searchValue' => request('search'),
            'breadcrumbs'   => [
                'Home' => route('admin.dashboard'),
                'Liste der Tabellen' => route('admin.tables.index'),
                "Tabelle ".ucf($table)."" => null
            ],
            'datarows'      => $result,
            'rows'          => $tables,
            'table'         => ucf($table),
            'table_alt'     => $table,
            'ItemName'      => 'Beiträge',
            'itemName_des'  => 'Beitrags',
            'formData'      => 'test',
            'tablez'        => ucf($table),
            'table_q'       => strtolower($table),
            'namealias'     => "{$table}_name",
            'users'         => $users_img,

        ]);
    }
    public function getHeadlines($table){
        if(!Schema::hasColumn($table,"position"))
        {
            return [];
        }
        if(Schema::hasColumn($table,"name")){
            $hd = "name";
        }
        if(Schema::hasColumn($table,"title")){
            $hd = "title";
        }
        if(Schema::hasColumn($table,"headline")){
            $hd = "headline";
        }
        return DB::table($table)->select('id', $hd,"position")->orderBy('position')->get();
    }
    public function updatePosition(Request $request, $table)
{
    $request->validate([
        'id' => 'required|integer',
        'position' => 'required|integer|min:1',
    ]);

    $entry = DB::table($table)->where('id', $request->id)->first();
    if (!$entry) {
        return response()->json(['error' => 'Entry not found'], 404);
    }

    $newPosition = $request->position;
    $allEntries = DB::table($table)->orderBy('position')->get();

    if ($newPosition > $allEntries->count()) {
        $newPosition = $allEntries->count();
    }

    // Eintrag rausnehmen
    $sorted = $allEntries->reject(fn($e) => $e->id === $entry->id);

    // Neue Reihenfolge bauen
    $result = collect();
    foreach ($sorted as $index => $item) {
        if (($index + 1) === $newPosition) {
            $result->push($entry->id); // hier an exakter Stelle einfügen
        }
        $result->push($item->id);
    }

    // Falls letzter Platz → anhängen
    if (!$result->contains($entry->id)) {
        $result->push($entry->id);
    }

    // Positionen speichern
    foreach ($result as $index => $id) {
        DB::table($table)->where('id', $id)->update(['position' => $index + 1]);
    }

    return response()->json([
        'success' => true,
        'message' => 'Position aktualisiert',
        'new_position' => $newPosition,
        'order' => $result->values(), // zum Debuggen
    ]);
}


    public function getCreatedAt()
    {
        $crea = [];

        foreach (Settings::$searchable[SD()] as $tablex) {
            $rows = DB::table($tablex)
                ->select(
                    'id AS post_id',
                    'created_at AS created'
                )
                ->get()
                ->toArray();

            // Zeit entfernen (alles nach dem Datum abschneiden)
            foreach ($rows as &$row) {
                // created z. B. "2025-06-17 13:45:22"
                // wir nehmen nur das Datum
                // \Log::info($row->created);
                $row->created = substr($row->created, 0, 10);
            }

            $crea[$tablex] = $rows;
        }
         \Log::info("rows:".json_encode($crea));
        return response()->json($crea);
    }
    public function save_order(Request $request,$table)
    {
        $rows = request()->input('rows');
        // $rows = json_decode($rows);
        \Log::info("row:". json_encode($rows,JSON_PRETTY_PRINT));
        // \Log::info("TABLE:".$table);
        foreach($rows as $row){
            if(isset($row['id'],$row['position']))
            {
            DB::table($table) ->where('id', $row['id'])
            ->update(['position' => $row['position']]);
            }
        }

        return true;
    }


    function stripslashes_recursive($data) {
        if (is_array($data)) {
            return array_map('stripslashes_recursive', $data); // Rekursive Anwendung
        } else {
            return stripcslashes($data); // Standardmäßige Anwendung von stripslashes auf den Wert
        }
    }
    public function ListTables(Request $request,$table_alt='')
    {
        $table = $table_alt;
        if(!CheckZRights("DataBases"))
        {
            header("Location: /no-rights");
            exit;
        }
        $tables = Table::select("admin_table.name as full_name","admin_table.name","admin_table.*")->filterBlog($request->only('search'))
            ->orderBy('name', 'ASC')
            ->paginate(20)
            ->withQueryString();

            $tables->getCollection()->transform(function ($table) {
                $table->name = ucf($table->name);
                return $table;
            });
        // \Log::info('tab:'.json_encode($tables, JSON_PRETTY_PRINT));
        return Inertia::render('Admin/TableList', [
            'filters' => Request()->all('search'),
            'datarows' => $tables,
            "rows" => $tables,
            "table_alt"=> $table,
            "tablez" => ucf($table),
            "tables"  => $tables,
        ]);
    }
    public function ListTables_old()
    {
                // Hole die Daten aus der Tabelle adm_table
                $tables = Table::all()->keyBy('id');
            // $tables = $tables->sortBy('position');

                $dd = (array)$tables;

                $result = array_values($dd);

                // Ausgabe als JSON ohne Indizes
                // echo json_encode($result, JSON_PRETTY_PRINT);
                $qq = json_encode(["datarows" => $result]);
               // \Log::info("prop:".json_encode($dd));
        return Inertia::render('Admin/TableList', [

            $qq
        ]);
    }
    public function GetTables()
    {
        // Hole die Daten aus der Tabelle adm_table
        $tables = Table::all()->sortBy('position');

        // Konvertiere die sortierte Collection in ein numerisches Array
        $tab = ["rows" => $tables->values()->toArray()];

        // Gebe die Daten als JSON zurück
        return response()->json($tab);
    }

    // Funktion zum Auflisten aller Einträge der Tabelle
    public function index(Request $request, $table)
    {
        // Prüfen, ob die Tabelle existiert
        if(!CheckRights(Auth::id(),$table,"view"))
        {
            return redirect()->route('tables.noview');


        }
        // \Log::info("t:".$table);
        if (!Schema::hasTable($table)) {

            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht2']);
        }

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }
        elseif ($table == "blogs" || $table == "mindblog") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif($table == "images")
        {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        $take = $table == "admin_table" ? 20  : 10;
        // Hole alle Einträge aus der Tabelle mit Paginierung
        $perPage = 10; // Anzahl der Einträge pro Seite
        //  $data = DB::table($table)->select($columns)->orderby($ord[0], $ord[1])->paginate($perPage);
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->take($take)->get();
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        // Wenn die Anfrage AJAX ist (für das Scrollen), gib JSON zurück
        // if ($request->ajax()) {
        //     return view('tables.partial_table_rows', compact('data', 'columns', 'table','tables'))->render();
        // }


        // Rückgabe der Hauptansicht
        return view('tables.index', compact('posts', 'columns', 'table','tables'));
    }


    public function index4(Request $request,$table)
    {
        // Prüfen, ob die Tabelle existiert
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht3']);
        }

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $ext_disabled = Settings::$excl_disabled;
        $ext_date = Settings::$excl_datefields;
        $exl = Settings::$exl;
        $req = Settings::$no_req;
        $excl_cols = Settings::$excl_cols;
        $columns = array_diff($columns, $excl_cols);
        if (Schema::hasColumn($table, "position"))
        {
            $ord[0] = 'position';
            $ord[1] = 'ASC';

        }
        elseif($table == "mindblog")
        {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        else
        {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        // Hole alle Einträge aus der Tabelle
        $perPage = 10;
        if(@$_GET['page'])
        {
            $perPage = $_GET['page']*$perPage;
        }
        $data = DB::table($table)->select($columns)->orderBy($ord[0], $ord[1])->paginate($perPage);
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();



    // Holen der paginierten Daten
    $tables = DB::table('admin_table')->orderBy('position', 'ASC')->get();

    // Wenn die Anfrage AJAX ist (für das Scrollen), gib JSON zurück
    if ($request->ajax()) {
        return view('tables.partial_table_rows', compact('data', 'columns', 'table','exl','req','tables'))->render();
    }
        return view('tables.index', compact('data', 'columns', 'table','exl','req','tables'));
    }
        /**
         * Zeigt ein Formular zum Erstellen eines neuen Eintrags in einer spezifizierten Tabelle.
         *
         * @param string $table
         * @return \Illuminate\View\View
         */


        public function sel_update(Request $request)
        {
        $id = $request->input('id');  // Erhalte die ID des Datensatzes
        $author_id = $request->input('author_id');  // Erhalte die neue Position
        $table = $request->input('table');

        // Finde den Datensatz in der Datenbank
        $item = DB::table($table)->where("id",$id);
        if ($item) {
            // Aktualisiere den Positionseintrag
            $item->position = $position;
            $item->save();

            // Erfolgsmeldung
            return response()->json(['status' => 'success']);
        }

        // Fehlerbehandlung, falls der Datensatz nicht gefunden wird
        return response()->json(['status' => 'error', 'message' => 'Datensatz nicht gefunden'], 404);
        }
        public function createEntryForm($table,$edit='')
        {
            // Überprüfen, ob die Tabelle existiert
            if (!Schema::hasTable($table)) {
                abort(404, 'Tabelle nicht gefunden');
            }

            // Hole die Spaltennamen der Tabelle (außer den zeitbezogenen Spalten)
            $columns = Schema::getColumnListing($table);
            $excl_cols = Settings::$excl_cols;
            $ext_disabled = Settings::$excl_disabled;
            $ext_date = Settings::$excl_datefields;
            $exl = Settings::$exl;
            $req = Settings::$no_req;
            $excl_cols[] = "id";
            $excl_cols[] = "position";
            if (($key = array_search("password", $excl_cols)) !== false) {
                unset($excl_cols[$key]);
            }
            //    vde($excl_cols);
            $excludedColumns = $excl_cols;
            // Filtere die Spalten, um die ausgeschlossenen Spalten zu entfernen
            $columns = array_filter($columns, function ($column) use ($excludedColumns) {
                return !in_array($column, $excludedColumns);
            });
            $edit = @$_GET['edit'];
            $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
            // Zeige das Formular an
            return view('tables.create-entry', compact('edit','table', 'columns','req','ext_disabled','ext_date','exl','tables'));
        }

        /**
         * Speichert einen neuen Eintrag in der angegebenen Tabelle.
         *
         * @param \Illuminate\Http\Request $request
         * @param string $table
         * @return \Illuminate\Http\RedirectResponse
         */
        public function createEntry($table,Request $request)
        {
            // Überprüfen, ob die Tabelle existiert
            if (!Schema::hasTable($table)) {
                abort(404, 'Tabelle nicht gefunden');
            }

            // Hole die Spaltennamen der Tabelle
            $columns = Schema::getColumnListing($table);
            $excl_cols = Settings::$excl_cols;
            $excludedColumns = $excl_cols;

            // Filtere die Spalten, um die ausgeschlossenen Spalten zu entfernen
            $columns = array_filter($columns, function ($column) use ($excludedColumns) {
               // return !in_array($column, $excludedColumns);
            });

            // Validierung der Eingabewerte basierend auf den dynamischen Spalten
            $validatedData = $request->validate(
                array_fill_keys($columns, 'required|string') // Annahme: alle Felder sind Strings, du kannst den Typ anpassen
            );

            // Speichere den neuen Eintrag in der Tabelle
            DB::table($table)->insert($validatedData);

            return redirect()->route('tables.index',compact('table'))->with('success', 'Neuer Eintrag erfolgreich erstellt.');
        }
        public function store(Request $request, $table = '')
        {
            $table = $_GET['table'] ?? $table;
            if($table == "admin_table")
            {
                $tableId = '1';
                $currentRights = DB::table('users_rights')->where('name', "Developer")->first();

                // Schritt 2: Füge '1' oder '0' an die jeweiligen Spalten an
                $updatedRights = [
                    'view_table' => $currentRights->view_table . '1',    // Beispiel: füge eine '1' an den Wert von view_table an
                    'add_table' => $currentRights->add_table . '1',      // Beispiel: füge eine '0' an den Wert von add_table an
                    'edit_table' => $currentRights->edit_table . '1',    // Beispiel: füge eine '1' an den Wert von edit_table an
                    'publish_table' => $currentRights->publish_table . '1',  // Beispiel: füge eine '1' an den Wert von publish_table an
                    'delete_table' => $currentRights->delete_table . '1',    // Beispiel: füge eine '0' an den Wert von delete_table an
                    'date_table' => $currentRights->date_table . '1',        // Beispiel: füge eine '1' an den Wert von date_table an
                ];

                $idxx = $idxx ?? [];
                // Schritt 3: Aktualisiere die Werte in der Datenbank
                DB::table('users_rights')->where('name', "Developer")->update($updatedRights);
                $currentRights_us = DB::table('users_rights')->whereNotIn('name', ['Developer'])->get();
                foreach($currentRights_us as $id=> $currentRights)
                {
                    $updatedRights = [
                        'view_table' => $currentRights->view_table . '0',    // Beispiel: füge eine '1' an den Wert von view_table an
                        'add_table' => $currentRights->add_table . '0',      // Beispiel: füge eine '0' an den Wert von add_table an
                        'edit_table' => $currentRights->edit_table . '0',    // Beispiel: füge eine '1' an den Wert von edit_table an
                        'publish_table' => $currentRights->publish_table . '0',  // Beispiel: füge eine '1' an den Wert von publish_table an
                        'delete_table' => $currentRights->delete_table . '0',    // Beispiel: füge eine '0' an den Wert von delete_table an
                        'date_table' => $currentRights->date_table . '0',        // Beispiel: füge eine '1' an den Wert von date_table an
                    ];
                // vde($currentRights->id);
                if(!@in_array($currentRights->id,$idxx))
                {
                    DB::table('users_rights')->where('id', $currentRights->id)->update($updatedRights);

                    $idxx[] = $currentRights->id;
                }

                }
                $_SESSION['adm_tab'] = "1";
            }

            $columns = Schema::getColumnListing($table);
            if(in_array('title',$columns))
            {
                $hcode = 'title';
            }
            elseif(in_array('headline',$columns))
            {
                $hcode = 'headline';
            }
            elseif(in_array('name',$columns))
            {
                $hcode = 'name';
            }
            elseif(in_array('queue',$columns))
            {
                $hcode = 'queue';
            }
            $excl_cols = Settings::$excl_cols;
            $excl_cols[] = 'id';
            if (($key = array_search("password", $excl_cols)) !== false) {
                unset($excl_cols[$key]);
            }
            //$columns = array_diff($columns, $excl_cols);
            $data = $request->only($columns); // Nur erlaubte Felder speichern
            // VDE($data);
            $conditions = [$hcode=>$request->$hcode ];
            $imul = new IMULController();

            $imagePath = null;
            if ($request->hasFile('image_path')) {
            $this->time = time();
            // vde($this->time);
            if(!@is_array(Settings::$image_sizes[$table])){
                $this->tab = "default";
            }
            else
            {
                $this->tab = $table;
            }
            if(is_dir(public_path("images/$table/big/")))
            {
                $bsize = Settings::$image_sizes[$this->tab]['big'] ??  1200;
                $imageUploadResponse = $imul->upload($request,$bsize,"image_path","images/$table/big/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/sm/")))
            {
                $ssize = 128;
                $imageUploadResponse = $imul->upload($request,$ssize,"image_path","images/$table/sm/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/bthumbs/")))
            {
                $btsize = Settings::$image_sizes[$this->tab]['bthumbs'] ??  490;
                $imageUploadResponse = $imul->upload($request,$btsize,"image_path","images/$table/bthumbs/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/thumbs/")))
            {
                $tsize = Settings::$image_sizes[$this->tab]['thumbs'] ?? 350;
                $imageUploadResponse = $imul->upload($request,$tsize,"image_path","images/$table/thumbs/",'image_path',$this->time);
            }
            $dsize = Settings::$image_sizes[$this->tab]['default'] ?? 700;
            $imageUploadResponse = $imul->upload($request,$dsize,"image_path","images/$table/",'image_path',$this->time);

            if ($imageUploadResponse->status() === 200) {
                $imagePath = $imageUploadResponse->getData()->path;

            }

        }
        // vde($imagePath);
        if(empty($imagePath))
        {
            // $imagePath = $tabledata->image_path;
        }
        else{
            //DB::table($table)->where('id', $id)->update(["image_path"=>$imagePath]);

        }


        $excl_cols = Settings::$excl_cols;
        //$columns = array_diff($columns, $excl_cols);



        $data = $request->only($columns); // Nur erlaubte Felder speichern
        if($request->image_path)
        {
            $data['image_path'] = $imagePath;
        }


        unset($data['id']);
        if(in_array('position',$columns))
        {

            DB::table($table)->update(['position' => DB::raw('position + 1')]);
            $data['position'] = 0;
        }
        else
        {
            unset($data['position']);
        }
        $data['created_at'] = ($data['created_at']);
            // $colss = DB::select(DB::raw('SHOW COLUMNS FROM $table')); // Ersetzt 'users' durch deine Tabelle
            // $colss = Schema::getColumnListing($table);
            $colss =  DB::select("SHOW COLUMNS FROM $table");

            foreach ($colss as $columna)
            {

                if (substr_count($columna->Field,'_at'))
                {
                    $ints = Settings::$int_date_tables;
                    $columno = array($columna,$data);



                    $data[$columna->Field] = $data[$columna->Field];



                }

            }
            // $exists = DB::table($table)->where($hcode, $request->$hcode)->first();

            // $oneSecondAgo = Carbon::now()->subSecond(2);
            $this->UP_POSI($table);
            if(@$data['date_begin'])
            {
                $data['date_begin'] = strtotime($data['date_begin']);
                $data['date_end'] = strtotime($data['date_end']);
            }
            return $this->insertIntoTable($request,$data,$table,$hcode);








/**
 *
 *->with('success', 'Neuer Eintrag erfolgreich erstellt.');
 *
 */
            $asdg = ["1"];
            return redirect()->route('tables.index',compact('table','asdg'))->with('success', 'Neuer Eintrag erfolgreich erstellt.');;
        }
        /**
         *
         * Update Position -1 after insert/deleting
         *
         */
        public function UP_POSI($table,$destroy='')
        {
            $columns = Schema::getColumnListing($table);
            if(in_array("position",$columns))
            {
                if($destroy)
                {
                    DB::table($table)
                        ->where("position", ">", 0)  // Condition: only update rows where position > 0
                        ->update(['position' => DB::raw('position - 1')]);
                }
                else
                {
                    DB::table($table)
                        ->where("position", ">", -1)  // Condition: only update rows where position > 0
                        ->update(['position' => DB::raw('position - 1')]);
                }
            }


        }


    public function insertIntoTable(Request $request, $data, $table, $hcode)
    {
            // Initialisiere Session-Variablen, falls nicht vorhanden
            $_SESSION['Oko'] = $_SESSION['Oko'] ?? [];
            $_SESSION['adump'] = $_SESSION['adump'] ?? false;

           // \Log::info("uuni:" . json_encode($hcode . $request->input($hcode)));
            $exists = DB::table($table)
                ->where($hcode, $request->input($hcode))
                ->where("created_at", ">", Carbon::now()->subSeconds(2))
                ->exists();

            if ($exists) {
                return redirect()->route('tables.index', compact('table'))
                    ->with('error', 'Der Eintrag mit diesem ' . ucfirst($hcode) . ' existiert bereits.');
            }

            // Erhalte den Wert des hcode aus der Anfrage
            $hcodeValue = $request->input($hcode); // Beispiel: $request->input('hcode')

            // Zeitstempel vor 2 Sekunden
            $twoSecondsAgo = Carbon::now()->subSeconds(2);

            // Prüfe, ob ein Eintrag mit dem gleichen hcode existiert
            $existingEntry = DB::table($table)
                ->where($hcode, $hcodeValue)
                ->first();

            // Fall 1: Kein vorhandener Eintrag oder vorhandener Eintrag ist älter als 2 Sekunden
            if (empty($existingEntry) || ($existingEntry->created_at < $twoSecondsAgo) && !in_array($hcodeValue, $_SESSION['Oko'])) {
                // Füge neuen Eintrag ein
                DB::table($table)->insert($data);

                // Speichere den hcode-Wert in der Session, um weitere Duplikate zu verhindern
                $_SESSION['Oko'][] = $hcodeValue;
                $_SESSION['adump'] = true;

                return redirect()->route('tables.index', compact('table'))
                    ->with('success', 'Eintrag erfolgreich eingefügt._alt');
            }

            $uni = DB::table($table)
                ->where($hcode, $hcodeValue)
                ->count() > 0;
            $firstEntry = DB::table($table)->where($hcode, $hcodeValue)->first();

            // Fall 2: Es gibt einen neueren oder gleich alten Eintrag (<= 2 Sekunden alt)
            if (!in_array($hcodeValue, $_SESSION['Oko'])) {
                return redirect()->route('tables.index', compact('table'))
                    ->with('error', 'Der Eintrag mit diesem ' . ucfirst($hcode) . ' existiert bereits.');
            }

            // Standard-Antwort (falls kein anderer Fall zutrifft)
            return redirect()->route('tables.index', compact('table'))
                ->with('success', 'Eintrag erfolgreich eingefügt');
        }


        public function insertIntoTable_old2(Request $request, $data, $table, $hcode)
        {
            // Initialisiere Session-Variablen, falls nicht vorhanden
            $_SESSION['Oko'] = $_SESSION['Oko'] ?? [];
            $_SESSION['adump'] = $_SESSION['adump'] ?? false;

                //\Log::info("uuni:".json_encode($hcode.$request->input($hcode)));
                $exists = DB::table($table)
                    ->where($hcode, $request->input($hcode))
                    ->where("created_at",">",Carbon::now()->subSeconds(2))
                    ->exists();

                if ($exists) {
                    return redirect()->route('tables.index', compact('table'))
                        ->with('error', 'Der Eintrag mit diesem ' . ucfirst($hcode) . ' existiert bereits.');
                }

            // Erhalte den Wert des hcode aus der Anfrage
            $hcodeValue = $request->input($hcode); // Beispiel: $request->input('hcode')

            // Zeitstempel vor 2 Sekunden
            $twoSecondsAgo = Carbon::now()->subSeconds(2);

            // Prüfe, ob ein Eintrag mit dem gleichen hcode existiert
            $existingEntry = DB::table($table)
                ->where($hcode, $hcodeValue)
                ->first();


            // Fall 1: Kein vorhandener Eintrag oder vorhandener Eintrag ist älter als 2 Sekunden
            if (empty($existingEntry) || ($existingEntry->created_at < $twoSecondsAgo) && !in_array($hcodeValue, $_SESSION['Oko'])) {
                // Füge neuen Eintrag ein
                DB::table($table)->insert($data);

                // Speichere den hcode-Wert in der Session, um weitere Duplikate zu verhindern
                $_SESSION['Oko'][] = $hcodeValue;
                $_SESSION['adump'] = true;

                return redirect()->route('tables.index', compact('table'))
                    ->with('success', 'Eintrag erfolgreich eingefügt._alt');
            }
            //
            $uni = DB::table($table)
                ->where($hcode, $hcodeValue)
                ->count() > 0;
            $firstEntry = DB::table($table)->where($hcode, $hcodeValue)->first();


            // Fall 2: Es gibt einen neueren oder gleich alten Eintrag (<= 2 Sekunden alt)
               if (!in_array($hcodeValue, $_SESSION['Oko'])) {
                   // return redirect()->route('tables.index', compact('table'))
                     //   ->with('error', 'Der Eintrag mit diesem ' . ucfirst($hcode) . ' existiert bereits.');
                }

            // Standard-Antwort (falls kein anderer Fall zutrifft)
            return redirect()->route('tables.index', compact('table'))
                ->with('success', 'Eintrag erfolgreich eingefügt._Alt2');
        }
        public function CheckDouble($name,$val,$table)
        {



        }
        public function insertIntoTable_old(Request $request, $data, $table,$hcode)
        {
            // unset($_SESSION['gohh']);
            $_SESSION['Oko'] = $_SESSION['Oko'] ?? [];
            // Erhalte den Wert des hcode aus der Anfrage
            $hcodeValue = $request->input($hcode);  // z.B. $request->input('hcode')

            // Zeitstempel vor 2 Sekunden
            $twoSecondsAgo = now(); // 2 Sekunden vor der aktuellen Zeit
            $twoSecondsAgo = Carbon::now()->subSeconds(2);
            // Prüfe, ob ein Eintrag existiert
            $existingEntry = DB::table($table)
                ->where($hcode, $hcodeValue)->first();  // Prüfe auf das Vorhandensein des Wertes in der hcode-Spalte

            // Wenn kein Eintrag vorhanden ist oder er älter als 2 Sekunden ist, füge den neuen Eintrag in die Datenbank ein
            if(empty($existingEntry) || (isset($existingEntry) && @$existingEntry->created_at >= $twoSecondsAgo) && !in_array($request->$hcode,$_SESSION['Oko']))
            {
                DB::table($table)->insert($data);
                // $_SESSION['gohh']  = true;
                $_SESSION['Oko'][] = $request->$hcode;
                $_SESSION['adump']  = true;
                // return $this->deleteRecentDuplicates($table,$hcode);
                // return TablesController::removeDuplicates($table, $hcode);
                // return $this->removeDuplicateEntries($table,$hcode);
                return redirect()->route('tables.index',compact('table'))
                ->with('success', 'Eintrag erfolgreich eingefügt.');
            }
            elseif(!in_array($request->$hcode,$_SESSION['Oko']) && !$_SESSION['adump']){
                return redirect()->route('tables.index',compact('table'))
                ->with('error', 'Der Eintrag mit diesem '.ucfirst($hcode).' existiert bereits');
            }
            return redirect()->route('tables.index',compact('table'))
                ->with('success', 'Eintrag erfolgreich eingefügt.');


            // Gib bei erfolgreichem Einfügen eine Erfolgsmeldung zurück

        }
       public function removeDuplicateEntries($table, $hcode)
{
    // Aktueller Zeitstempel minus 4 Sekunden
     $twoSecondsAgo = now();

    // // Finde doppelte Einträge
    // $duplicates = DB::table($table)
    //     ->select($hcode, DB::raw('MIN(id) as min_id'), DB::raw('COUNT(*) as count'))
    //     ->groupBy($hcode)
    //     ->having('count', '>', 1)
    //     ->get();

    // foreach ($duplicates as $duplicate) {
    //     // Finde die doppelten Einträge, die jünger als 4 Sekunden sind
    //     $entriesToDelete = DB::table($table)
    //         ->where($hcode, $duplicate->$hcode)
    //         ->where('id', '>', $duplicate->min_id) // Überspringe den ältesten Eintrag
    //         ->where('created_at', '>=', $twoSecondsAgo) // Finde nur Einträge jünger als 4 Sekunden
    //         ->get();
    //     \Log::info("ed:".json_encode($entriesToDelete));
    //     // Lösche die jüngeren doppelten Einträge
    //     foreach ($entriesToDelete as $entry) {
    //         DB::table($table)
    //             ->where('id', $entry->id)
    //             ->delete();
    //         DB::statement("ALTER TABLE $table AUTO_INCREMENT = 0");
    //     }
    // }
    $duplicates = DB::table($table)
        ->select($hcode, DB::raw('MIN(id) as min_id'), DB::raw('COUNT(*) as count'))
        // ->where('created_at', '>', time() - 10) // UNIX-Zeitstempel verwenden
        ->groupBy($hcode)
        ->having('count', '>', 1)
        ->get();



    foreach ($duplicates as $duplicate) {
        $entriesToDelete = DB::table($table)
            ->where($hcode, $duplicate->$hcode)
            ->where('id', '>', $duplicate->min_id)
            ->where('created_at', '>=', $twoSecondsAgo)
            ->get();

    }


    // Überprüfen, ob ein doppelter Eintrag vorhanden ist
    if (isset($duplicate)) {
        $dupli = DB::table($table)->where('id', $duplicate->min_id)->first();
        if ($dupli && $dupli->created_at >= $twoSecondsAgo) {
            return redirect()->back()->with('error', 'Eintrag schon vorhanden.');
        }
    }
    $edit = @$_GET['edit'];
    if($edit)
    {
        return redirect()->route($edit, ['table' => $table, 'adm_tab' => @$_SESSION['adm_tab'],"pic"=>@$_GET['pic']])
                     ->with('success', 'Eintrag erfolgreich eingefügt.');
    }

    // Erfolgreiches Einfügen
    return redirect()->route('tables.index', ['table' => $table, 'adm_tab' => @$_SESSION['adm_tab']])
                     ->with('success', 'Eintrag erfolgreich eingefügt.');
}


        public function store_old(Request $request, $table)
        {
        // Überprüfen, ob die Tabelle existiert
        if (!Schema::hasTable($table)) {
            abort(404, 'Tabelle nicht gefunden');
        }

        // Hole die Spaltennamen der Tabelle
        $columns = Schema::getColumnListing($table);
        $excludedColumns = ['id', 'updated_at', 'published_at'];

        // Filtere die Spalten, um die ausgeschlossenen Spalten zu entfernen
        $columns = array_filter($columns, function ($column) use ($excludedColumns) {
           //return !in_array($column, $excludedColumns);
        });

        // Erstelle ein Validierungsarray basierend auf den dynamischen Spalten der Tabelle
        $validationRules = array_fill_keys($columns, 'required|string');

        // Führe die Validierung der Benutzereingaben durch
        $validatedData = $request->validate($validationRules);

        // Speichere den neuen Eintrag in der Tabelle
        DB::table($table)->insert($validatedData);

        // Umleitung mit Erfolgsmeldung
        return redirect()->route('tables.index',['table' => $table, 'adm_tab' => @$_SESSION['adm_tab']])->with('success', 'Neuer Eintrag erfolgreich erstellt.');
    }
    function deleteRecentDuplicates($table, $hcode) {
        // Zeitmarke: Nur Einträge der letzten Sekunde betrachten
        $oneSecondAgo = Carbon::now()->subSeconds(1);

        // Finde doppelte Einträge, die innerhalb der letzten Sekunde erstellt wurden
        $duplicates = DB::table($table)
            ->where('created_at', '>=', $oneSecondAgo) // Nur Einträge der letzten Sekunde
            ->select($hcode, DB::raw('MIN(id) as min_id'), DB::raw('COUNT(*) as count'))
            ->groupBy($hcode)
            ->having('count', '>', 1)
            ->get();

        $alreadyExisting = false;

        foreach ($duplicates as $duplicate) {
            // Finde alle doppelten Einträge (außer dem ältesten Eintrag)
            $entriesToDelete = DB::table($table)
                ->where($hcode, $duplicate->$hcode)
                ->where('id', '!=', $duplicate->min_id) // Behalte den ältesten Eintrag
                ->get();

            // Lösche die jüngeren doppelten Einträge
            foreach ($entriesToDelete as $entry) {
                DB::table($table)
                    ->where('id', $entry->id)
                    ->delete();
            }

            // Setze die Auto-Increment-Werte (optional)
            DB::statement("ALTER TABLE $table AUTO_INCREMENT = 1");

            // Markiere, dass ein doppelter Eintrag gefunden wurde
            $alreadyExisting = true;
        }

        // Falls Duplikate existieren, gib eine Fehlermeldung zurück
        if ($alreadyExisting) {
            return redirect()->back()->with('error', 'Eintrag mit diesem '.$hcode.' existiert bereits.');
        }

        // Erfolgsmeldung, wenn keine Duplikate gefunden wurden
        return redirect()->back()->with('success', 'Einträge erfolgreich gespeichert.');
    }
        public static function removeDuplicates($table, $hcode) {

       $twoSecondsAgo = Carbon::now()->subSeconds(1);

        // Finde doppelte Einträge basierend auf der Spalte $hcode
        $duplicates = DB::table($table)
            ->where('created_at', '>=', $twoSecondsAgo)
            ->select($hcode, DB::raw('MIN(id) as min_id'), DB::raw('COUNT(*) as count'))
            ->groupBy($hcode)
            ->having('count', '>', 1)
            ->get();

        foreach ($duplicates as $duplicate) {
            // Behalte den ältesten Eintrag (min_id) und lösche die anderen
            DB::table($table)
                ->where($hcode, $duplicate->$hcode)
                ->where('id', '!=', $duplicate->min_id)
                ->delete();

            // Überprüfe, ob der älteste Eintrag (min_id) kürzlich erstellt wurde
            $dupli = DB::table($table)->where('id', $duplicate->min_id)->first();
            if ($dupli && $dupli->created_at >= $twoSecondsAgo) {
                return redirect()->back()->with('error', 'Eintrag schon vorhanden.');
            }
        }

        // Setze AUTO_INCREMENT zurück, nachdem alle Duplikate gelöscht wurden
        DB::statement("ALTER TABLE $table AUTO_INCREMENT = 1");

        // Überprüfe, ob es sich um eine Bearbeitung handelt
        $edit = request('edit');
        if ($edit) {
            return redirect()->route($edit, [
                'table' => $table,
                'adm_tab' => session('adm_tab'),
                'pic' => request('pic')
            ])->with('success', 'Eintrag erfolgreich eingefügt.');
        }

        // Erfolgreiches Einfügen
        return redirect()->route('tables.index', [
            'table' => $table,
            'adm_tab' => session('adm_tab')
        ])->with('success', 'Eintrag erfolgreich eingefügt.');


        // Setze AUTO_INCREMENT zurück


    }
    public function update(Request $request, $table, $id,$edit='')
    {
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht4']);
        }
        // if(Schema::hasColumn($table, 'title',$id) && $this->GetTitle($table,$request->title,$id))
        // {
        //     return redirect()->route('tables.edit',compact('table','id'))->with('error', 'Titel existiert bereits.');
        // }

        $columns = Schema::getColumnListing($table);
        $tabledata = DB::table($table)->where('id', $id)->first();
        $imul = new IMULController();
        $imagePath = null;
        $count = false;
       // \Log::info("asd:".json_encode($request->input));
        if(is_dir(public_path("/images/$table/big/")))
        {
            $count = true;
        }
        if ($request->hasFile('image_path')) {
            $this->time = time();
            $imageUploadResponse = $imul->ul_store($request,1050,'image_path','images/'.$table.'/','image_path',$count);

            if ($imageUploadResponse->status() === 200) {
                $imagePath = $imageUploadResponse->getData()->path;
                if($imagePath != $tabledata->image_path)
                {
                    @unlink(getcwd().'/images/$table/'.$tabledata->image_path);
                }

            }

        }
        // vde($imagePath);
        if(empty($imagePath))
        {
            $imagePath = @$tabledata->image_path;
        }
        else{
            DB::table($table)->where('id', $id)->update(["image_path"=>$imagePath]);

        }


        $excl_cols = Settings::$excl_cols;
        $excl_cols[] = "image_path";

        $columns = array_diff($columns, $excl_cols);


        $data = $request->only($columns); // Nur erlaubte Felder speichern
        $data['created_at'] = ($data['created_at']);
        if(@$data['birthday'])
        {
            $data['birthday'] = ($data['birthday']);
        }
        if(@$data['date_begin'])
        {
            $data['date_begin'] = ($data['date_begin']);
            $data['date_end'] = ($data['date_end']);


        }

        $edit = @$_GET['edit'];
        // Aktualisiere den Eintrag
        DB::table($table)->where('id', $id)->update($data);
        $admTab = isset($_SESSION['adm_tab']) ? $_SESSION['adm_tab'] : '';
                if ($table == "blogs" || $table == "mindblog" || $table == "images") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }

        if($edit){
            //Route: Route::get('/blogposts/', [BlogPostController::class, 'index'])->name('blogposts.index2');
            // edit: blogposts.index2
            // vde($_GET['pic']);
            return redirect()->route($edit, ['table' => $table, 'adm_tab' => $admTab,"pic"=>@$_GET['pic']])->with('success', 'Eintrag erfolgreich aktualisiert.');
        }
        return redirect()->route('tables.index', ['table' => $table, 'adm_tab' => $admTab])->with('success', 'Eintrag erfolgreich aktualisiert.');
    }
    public function no_view()
    {
        $table = "admin_table";
        $tables = DB::table('admin_table')->select('name', 'description')->orderby("position","ASC")->get();
        return view("tables.noview",compact('table','tables'));
    }
    public function GetTitle($table,$title,$id)
    {
        return DB::table($table)->where('title', $title)->whereNot("id",$id)->value('id');
    }
    public function old_updateTable(Request $request,$table,$id)
    {
        // $table = $request->table;  // Die Tabelle, die bearbeitet wird
        // $id = $request->id;        // Die ID der Zeile
        $field = $request->field;  // Das Feld, das aktualisiert wird
        $value = $request->value;  // Der neue Wert
        file_put_contents(storage_path("logs/asd.log"),"table6: ".$table."\nfield: ".$field."\nval: ".$value."\nid: ".$id);
        // Überprüfe."<br />". ob die Tabelle und das Feld existieren
        if (Schema::hasTable($table) && Schema::hasColumn($table, $field)) {
            // Aktualisiere den entsprechenden Datensatz in der dynamischen Tabelle
            DB::table($table)
                ->where('id', $id)
                ->update([$field => $value]);

             return response()->json([
        'status' => 'success',
        'message' => 'Reihenfolge erfolgreich geändert'
    ]);
        }

       return response()->json(['status' => 'error', 'message' => 'Ungültige Tabelle oder Spalte'], 404);
    }
 // Log::info("Vergleiche '{$row->name}' mit users_rights");

                        // if (trim(strtolower($row->name)) === "users_rights") {
                        //     $insertedPosition = $i;
                        //     Log::info("Treffer! Neue Position: $i");
                        // }

    public function StoreTable(Request $request, $table)
    {
        $formData = $request->input('formData');
        foreach($formData as $key=>$val)
        {
            $fi = FormController::getClass($key,'','');
            if(substr_count($fi,"textarea"))
            {
                $formData[$key] = CustomHelpers::sanitizeHtmlInput($val);

            }

        }
        if ((isset($formData['pub']) || Schema::hasColumn($table, 'pub')) && (empty($formData['pub']) || is_null($formData['pub']))) {
            $formData['pub'] = "1";
        }

        if(Schema::hasColumn($table, 'password'))
        {
            $formData['password'] = Hash::make($formData['password']);
        }

        if (Schema::hasColumn($table, 'image_path') && empty($formData['image_path'])) {
            $formData['image_path'] = "008.jpg";
        }

        $columns = Schema::getColumnListing($table);
        $hasOnColumn = collect($columns)->contains(fn($column) => str_contains($column, '_on'));

        if (is_array($hasOnColumn)) {
            foreach ($hasOnColumn as $key => $val) {
                $formData[$key] = (int)$val;
            }
        }

        if (Schema::hasColumn($table, 'img_x')) {
            $imgPath = public_path("/images/{$table}/big/{$formData['image_path']}");
            if (file_exists($imgPath)) {
                list($width, $height) = getimagesize($imgPath);
                $formData['img_x'] = $width;
                $formData['img_y'] = $height;
            }
        }

        if (Schema::hasColumn($table, 'preis') || isset($formData['preis'])) {
            $formData['preis'] = $formData['preis'] ?? "0.0";
            $formData['preis'] = str_replace(",", ".", $formData['preis']);
        }
        if (Schema::hasColumn($table, 'position'))
        {
            $formData['position'] = -1;
        }
        foreach($columns as $key=>$val)
        {
            if(substr_count($val,"is_") || $val == "ischecked")
            {

                $formData[$val] = (int)@$formData[$val];
            }
        }

        $newId = DB::table($table)->insertGetId($formData);

        // === SPEZIALBEHANDLUNG für admin_table ===
        if ($table === "admin_table") {
            $formData['position'] = -1;

            // Temporäre Spalte für Neupositionierung
            if (!Schema::hasColumn('admin_table', 'position_alt')) {
                Schema::table('admin_table', function (Blueprint $table) {
                    $table->unsignedInteger('position_alt')->nullable()->after('position');
                });
            }

            $tables = DB::table('admin_table')->orderBy('name')->get();
            $insertedPosition = null;

            foreach ($tables as $i => $row) {
                DB::table('admin_table')->where('id', $row->id)->update(['position_alt' => $i]);

          // \Log::info("Vergleiche '{$row->name}' mit neuer ID $newId");
                if ($row->id === $newId) {
                    $insertedPosition = $i;
              // \Log::info("Treffer! Neue Position für ID $newId ist $i");
                }
            }

            DB::table('admin_table')->update(['position' => DB::raw('position_alt')]);

            Schema::table('admin_table', function (Blueprint $table) {
                $table->dropColumn('position_alt');
            });

            // Rechte aktualisieren für ID 1
            $user = DB::table('users_rights')->where('id', 1)->first();

            if ($user && $insertedPosition !== null) {
                $columns = Schema::getColumnListing('users_rights');
                $tableColumns = array_filter($columns, fn($col) => str_ends_with($col, '_table'));

                // === Für ID 1: '1' einfügen ===
                $updates = [];

                foreach ($tableColumns as $col) {
                    $current = (string)($user->{$col} ?? '');
                    $chars = str_split($current);
                    $chars = array_pad($chars, max(strlen($current), $insertedPosition), '0');

                    array_splice($chars, $insertedPosition, 0, ['1']);
                    $new = implode('', $chars);
                    $updates[$col] = $new;

              // \Log::info("User ID 1 Update [$col] → $new (1 eingefügt bei Index $insertedPosition)");
                }

                if (!empty($updates)) {
                    DB::table('users_rights')->where('id', 1)->update($updates);
              // \Log::info("users_rights erfolgreich aktualisiert", $updates);
                } else {
                    \Log::warning("Keine Updates für users_rights ID 1 durchgeführt.");
                }

                // === Für alle anderen: '0' einfügen ===
                $otherUsers = DB::table('users_rights')->where('id', '!=', 1)->get();

                foreach ($otherUsers as $otherUser) {
                    $otherUpdates = [];

                    foreach ($tableColumns as $col) {
                        $current = (string)($otherUser->{$col} ?? '');
                        $chars = str_split($current);
                        $chars = array_pad($chars, max(strlen($current), $insertedPosition), '0');

                        array_splice($chars, $insertedPosition, 0, ['0']);
                        $new = implode('', $chars);
                        $otherUpdates[$col] = $new;

                  // \Log::info("User ID {$otherUser->id} Update [$col] → $new (0 eingefügt bei Index $insertedPosition)");
                    }

                    if (!empty($otherUpdates)) {
                        DB::table('users_rights')->where('id', $otherUser->id)->update($otherUpdates);
                    }
                }
            } else {
                \Log::warning("Benutzer mit ID 1 nicht gefunden oder insertedPosition ist null.");
            }
        }

        if (CheckZRights("UserRights") && $table == "admin_table") {
            return response()->json(["status" => "success", "message" => "Gespeichert, Bitte <a href='/admin/User_Rights'>Benutzerrechte</a> aktualisieren"]);
        }

        return response()->json(['status' => 'success', 'message' => 'Daten erfolgreich gespeichert!']);
    }



    public function getSlug($table,$id='')
    {
        if(!Schema::hasColumn($table, 'autoslug'))
        {
            return;
        }
        $res = DB::table($table)->where("id",$id)->select('autoslug')->first();
        if(!empty($res) && $id && $res->autoslug != NULL)
        {
            return response()->json(['autoslug' => $res->autoslug]);
        }
        else{
            return response()->json(['autoslug' => TablesController::GenerateSlug($table)]);
        }
    }
    public static function GenerateSlug($table)
    {
        do {
            // Zufälligen vierstelligen String generieren, beginnend mit 'y'
            $slug = 'y' . substr(str_shuffle('abcdefghijklmnopqrstuvwxyz0123456789'), 0, 3);

            // Prüfen, ob der Slug bereits existiert
            $exists = \DB::table($table)->where('autoslug', $slug)->exists();
        } while ($exists); // Wiederholen, falls der Slug bereits existiert

        return $slug;
    }
    public function GetUserNull()
    {
        $unull = DB::table("users")->orderby("id","ASC")->pluck("name");
        //\Log::info("UNULL".$unull);
        return response()->json($unull);
    }
    public function UpdateTable(Request $request,$table, $id)
    {
            // Zugriff auf die übergebenen Daten
            $formData = ($request->input('formData')    );
            foreach($formData as $key=>$val)
            {

                $fi = FormController::getClass($key,'','');
                if(substr_count($fi,"textarea"))
                {
                    $formData[$key] = CustomHelpers::sanitizeHtmlInput($val);

                }
                if($val == "on")
                {
                    $formData[$key] = "1";
                }
                elseif($val == "off"){
                    $formData[$key] = "0";
                }
                elseif(substr_count($key,"is_") || $key == "ischecked")
                {

                    $formData[$key] = (int)$val;
                }

            }

        if(!FormController::CheckCreate()){
            unset($formData['password']);
        }

        if((Schema::hasColumn($table, 'image_path')) && (empty($formData['image_path']) || is_null($formData['image_path'])))
        {
            $formData['image_path'] = "008.jpg";
        }
        if(Schema::hasColumn($table, 'img_x'))
        {
        list($width,$height) = getimagesize(public_path()."/images/".$table."/big/".$formData['image_path']);

        $formData['img_x'] = $width;
        $formData['img_y'] = $height;
        }
        if(Schema::hasColumn($table, 'preis')|| isset($formData['preis']))
        {
            $formData['preis'] = str_replace(",",".",$formData['preis']);
        }
        if(empty($formData['preis']) && Schema::hasColumn($table, 'preis')){
            $formData['preis'] = "0.0";
        }
        $formData = array_diff_key($formData, array_flip(Settings::$excl_cols));
        if (Schema::hasColumn($table,"updated_at")) {
            $formData["updated_at"] = now();
        }
            // \Log::info("FD:".json_encode($formData));
        if (!Schema::hasTable($table)) {
            return response()->json(['status'=>'error', 'message' => 'Tabelle nicht gefunden'], 404);
        }
        $record = DB::table($table)->where('id', $id)->first();
            if (!$record) {
                return response()->json(['status'=>'error', 'message' => 'Eintrag nicht gefunden'], 404);
            }
        // Beispiel: Dynamische Tabelle anhand des Parameters "table"
        // if (in_array($table, ['valid_table_1', 'valid_table_2'])) {  // Überprüfe, ob die Tabelle gültig ist
            //$updatedRows = DB::table($table)->where('id', $id)->update($formData);
            // if ($updatedRows > 0) {
            //     \Log::info('Update erfolgreich: ' . $updatedRows . ' Zeilen betroffen.');
            // } else {
            //     \Log::info('Kein Update durchgeführt.');
            // }
            // DB::enableQueryLog();  // Aktiviert das Query Log
            DB::enableQueryLog();
            $updated = DB::table($table)->where('id', $id)->update($formData);
            // $queries = DB::getQueryLog();
            // \Log::info('ID:', $id);
            // \Log::info('FormData:', $formData);
            // \Log::info($updated);
            $queries = DB::getQueryLog();
            $sql = DB::table($table)->where('id', $id)->toSql();

            // $this->debugUpdateQuery($table,$id,$formData);
            // if ($updated) {
                return response()->json(['status' => 'success','message' => 'Daten erfolgreich aktualisiert!']);
            // } else {

            //     return response()->json(['error' => implode("|",$formData)], 507);
            // }
    }
    function debugUpdateQuery($table, $id, $formData)
    {
        DB::enableQueryLog();

        // Führe die Update-Anweisung aus
        DB::table($table)->where('id', $id)->update($formData);

        // Hole die Query-Log
        $queries = DB::getQueryLog();
        $lastQuery = end($queries);

        // Repliziere gebundene Werte in das SQL-Statement
        $sql = $lastQuery['query'];
        foreach ($lastQuery['bindings'] as $binding) {
            $value = is_numeric($binding) ? $binding : "'" . addslashes($binding) . "'";
            $sql = preg_replace('/\?/', $value, $sql, 1);
        }

        // \Log::info("SQL:".$sql);
    }


    function GetImageUrl(Request $request,$table,$id)
    {

        if($id == "create")
        {
            return response()->json([" "=>"009.jpg"]);
        }
        DB::enableQueryLog(); // Aktiviert das Query Logging

        $res = DB::table($table)
    ->where("id", $id)
    ->value("image_path");
    $queries = DB::getQueryLog();
    // \Log::info($queries);

        // \Log::info("res: ".json_encode($res));
        return response()->json($res);
    }
    function GetImageId($table,$id)
    {
        // DB::enableQueryLog();
        $res = DB::table('blogs')
            // ->leftJoin('blog_images', 'blogs.blog_images_iid', '=', 'blog_images.id') // LEFT JOIN
            ->where('blogs.id', $id)  // Füge die Bedingung hinzu, um nach der ID zu filtern
            ->select('blogs.image_path') // Wähle die benötigten Spalten aus
            ->first();
        // $res2 = DB::getQueryLog();

        // \Log::info("res: ".json_encode([$table,$id,$res2]));
        return response()->json($res);
    }
    public function GetCats($table,$id){
        $res = DB::table($table)->where("id",$id)->select("type_id","categorie_id")->first();
  // \Log::info("GC".json_encode($res));
        return response()->json($res);
    }
    public function DeleteTables(Request $request, $table, $id)
    {
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht']);
        }

        if (!CheckRights(Auth::id(), $table, "delete")) {
            \Log::warning("No rights to delete in table $table with UID " . Auth::id());
            return redirect()->back()->withErrors(['error' => 'Sie haben nicht die benötigten Rechte']);
        }

        if ($table === "admin_table") {
            // 1. Position des zu löschenden Eintrags ermitteln
            $tables = DB::table('admin_table')->orderBy('name')->get();
            $deletedRow = $tables->firstWhere('id', $id);
            $deletedPosition = null;

            foreach ($tables as $i => $row) {
                if ($row->id == $id) {
                    $deletedPosition = $i;
              // \Log::info("Treffer! Zu löschende Position für ID $id ist $i");
                    break;
                }
            }

            // 2. Rechte in users_rights aktualisieren (alle User)
            if ($deletedPosition !== null) {
                $columns = Schema::getColumnListing('users_rights');
                $tableColumns = array_filter($columns, fn($col) => str_ends_with($col, '_table'));

                $allUsers = DB::table('users_rights')->get();

                foreach ($allUsers as $user) {
                    $updates = [];

                    foreach ($tableColumns as $col) {
                        $current = (string)($user->{$col} ?? '');
                        $chars = str_split($current);

                        if ($deletedPosition < count($chars)) {
                            array_splice($chars, $deletedPosition, 1);
                            $new = implode('', $chars);
                            $updates[$col] = $new;
                      // \Log::info("User ID {$user->id} Update [$col] → $new (Position $deletedPosition entfernt)");
                        }
                    }

                    if (!empty($updates)) {
                        DB::table('users_rights')->where('id', $user->id)->update($updates);
                    }
                }
            } else {
                \Log::warning("Position für zu löschenden Eintrag nicht gefunden.");
            }

            // 3. Neue Positionierung vorbereiten → position_alt
            if (!Schema::hasColumn('admin_table', 'position_alt')) {
                Schema::table('admin_table', function (Blueprint $table) {
                    $table->unsignedInteger('position_alt')->nullable()->after('position');
                });
            }

            // 4. Alphabetisch sortieren und neue Positionen setzen (ohne den zu löschenden)
            $sorted = DB::table('admin_table')->where('id', '!=', $id)->orderBy('name')->get();
            foreach ($sorted as $i => $row) {
                DB::table('admin_table')->where('id', $row->id)->update([
                    'position_alt' => $i,
                ]);
            }

            // 5. Position überschreiben
            DB::table('admin_table')->where('id', '!=', $id)->update([
                'position' => DB::raw('position_alt'),
            ]);

            // 6. Temporäre Spalte entfernen
            Schema::table('admin_table', function (Blueprint $table) {
                $table->dropColumn('position_alt');
            });
        }

        // 7. Datensatz löschen
        DB::table($table)->where('id', $id)->delete();

        return response()->json(["status" => "success", "message" => "Eintrag erfolgreich gelöscht"]);
    }


    function GetSRights()
    {
        $userId = Auth::id();
        $xkisColumns = collect(Schema::getColumnListing('users_rights'))
    ->filter(fn($col) => Str::startsWith($col, 'xkis_'))
    ->values();

$user = DB::table('users')
    ->leftJoin('users_rights', 'users.users_rights_id', '=', 'users_rights.id')
    ->where('users.id', $userId)
    ->select('users.*', ...$xkisColumns->map(fn($col) => "users_rights.$col")->toArray())
    ->first();

// Optional: Rechte auslagern als assoziatives Array
$rights = [];
foreach ($xkisColumns as $col) {
    $rights[Str::after($col, 'xkis_')] = (bool) $user->$col;
}

// Entferne ggf. die xkis_-Spalten aus $user
foreach ($xkisColumns as $col) {
    unset($user->$col);
}
    // \Log::info("ur__".json_encode($rights));
// Füge Rechte als Objekt hinzu
$user->rights = $rights;

return response()->json($user);
    }
    // function GetSRights()
    // {
    //     // $res = DB::table("users")
    //     //     ->leftJoin("users_rights", "users.users_groups_id", "=", "users_rights.id")->pluck("xkis_".$right);
    //     //     return response()->json($res);
    //     $user = auth()->user();

    //     if (!$user) {
    //         return response()->json([]);
    //     }
    //     $columns = DB::getSchemaBuilder()->getColumnListing('users_rights');

    //     // Schritt 2: Nur Spalten mit "xkis" im Namen filtern
    //     $xkisColumns = array_filter($columns, fn($col) => str_contains($col, 'xkis_'));
    //     \Log::info("ur__".json_encode($xkisColumns));
    //     $rights = DB::table('users')
    //         ->leftJoin('users_rights', 'users.users_rights_id', '=', 'users_rights.id')
    //         ->where('users.id', $user->id)
    //         ->select(
    //                 $xkisColumns
    //         )
    //         ->first();

    // }
    // ArticleController.php
    public function togglePub(Request $request)
    {
        $request->validate([
            'table' => 'required|string',
            'id'    => 'required|integer',
            'pub'   => 'required|boolean',
        ]);

        $table = $request->input('table');
        $id    = $request->input('id');
        $pub   = $request->boolean('pub');

        \DB::table($table)->where('id', $id)->update(['pub' => $pub]);

        return response()->json(['success' => true, 'pub' => $pub]);
    }

    public function getTableColumns($tableName)
    {
        return response()->json(Schema::getColumnListing($tableName));
    }
    public function URights(Request $request)
    {
        if(!CheckZRights("UserRights"))
        {

            header("Location: /no-rights");
            exit;
        }
        $tables = AdminTable::orderBy("name","ASC")->select('name')->get(); // oder dein gewünschtes Sortierfeld

        // Beispiel: Aktuell eingeloggter Nutzer mit Rolle z. B. Moderator-ID = 1
        $urid  = $request->urid ? $request->urid : "1";
        $userRights = UsersRight::find($urid);
       // Schritt 1: Alle Spaltennamen der Tabelle holen
        $columns = DB::getSchemaBuilder()->getColumnListing('users_rights');

        // Schritt 2: Nur Spalten mit "xkis" im Namen filtern
        $xkisColumns = array_filter($columns, fn($col) => str_contains($col, 'xkis_'));

        // Schritt 3: Eintrag für diesen Benutzer holen, aber nur die gefilterten Spalten
        $data = DB::table('users_rights')
            ->select($xkisColumns)
            ->where('id', $urid)
            ->first();

        // Optional: als Array
        $func = (array) $data;

        // \Log::info("ass: ".json_Encode([$func]));
        return Inertia::render('Admin/urights', [
            'adminTables' => $tables,
            'userRights' => $userRights,
            "urid"=>$urid,
            "func"=>$func,
            "roles"=>$this->GetAdmins($urid),
        ]);
    }
    public function GetURights(Request $request)
    {
        $urid  = $_GET['urid'];
        // \Log::info($request->all());
        $userRights = UsersRight::find($urid);
        //\Log::info("UR: ".$userRights);
        return response()->json($userRights);
    }
    public function getRoles(Request $request)
    {
        $urid  = $request->urid ? $request->urid : "0";
        $columns = DB::getSchemaBuilder()->getColumnListing('users_rights');

        // Schritt 2: Nur Spalten mit "xkis" im Namen filtern
        $xkisColumns = array_filter($columns, fn($col) => str_contains($col, 'xkis_'));
        $data = DB::table('users_rights')
        ->select($xkisColumns)
        ->where('id', $urid)
        ->first();

    // Optional: als Array
    $func = (array) $data;
        // \Log::info($func);
        return response()->json($func);
    }
    public function SaveURights(Request $request)
    {

        $urid = $request->input('urid');

    // Nur die *_table Felder extrahieren
    $fields = [
        'view_table',
        'add_table',
        'edit_table',
        'publish_table',
        'date_table',
        'delete_table',
    ];
    foreach ($request->input() as $key => $value) {
        if (str_starts_with($key, 'xkis_')) {
            $fields[] = $key;
        }
    }
    // Hole das passende Model anhand der ID
    $userRight = UsersRight::find($urid);

    if (!$userRight) {
        return response()->json(['status' => 'error','message' => 'Benutzerrechte nicht gefunden.'], 404);
    }

    // Werte setzen
    foreach ($fields as $field) {
        if ($request->has($field)) {
            $userRight->$field = $request->input($field);
        }
        else
        {
            // \Log::info($field);
        }
    }

    $userRight->save();

    return response()->json(['status' => 'success','message' => 'Rechte erfolgreich gespeichert.']);
    }
    public function GetAdmins($urid)
    {
        $res = DB::table("users_rights")->select("id","name")->get();
        // \Log::info("res: ".json_encode($res));
        return $res;
    }
    // Funktion zum Löschen eines Eintrags
    public function destroy($table, $id)
    {
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht6']);
        }
        if($table == "admin_table")
        {
            $order = DB::table($table)->where('id',$id)->select('id','position')->first();
            //
            $rights = DB::table("users_rights")
                ->select('id', "view_table", "add_table", "edit_table", 'publish_table', "date_table", "delete_table")
                ->get();

            foreach ($rights as $right) {
                $nr = [
                    "view_table" => str_split($right->view_table),
                    "add_table" => str_split($right->add_table),
                    "edit_table" => str_split($right->edit_table),
                    "publish_table" => str_split($right->publish_table),
                    "delete_table" => str_split($right->delete_table),
                    "date_table" => str_split($right->date_table),
                ];

                // Annahme: $order->position ist bereits definiert.
                unset($nr['view_table'][$order->position]);
                unset($nr['add_table'][$order->position]);
                unset($nr['edit_table'][$order->position]);
                unset($nr['publish_table'][$order->position]);
                unset($nr['delete_table'][$order->position]);
                unset($nr['date_table'][$order->position]);


                $nr2 = [
                    "view_table" => implode('', $nr['view_table']),
                    "add_table" => implode('', $nr['add_table']),
                    "edit_table" => implode('', $nr['edit_table']),
                    "publish_table" => implode('', $nr['publish_table']),
                    "delete_table" => implode('', $nr['delete_table']),
                    "date_table" => implode('', $nr['date_table']),
                ];
                DB::table('users_rights')->where('id', $right->id)->update($nr2);
                DB::table('admin_table')
                    ->where('position', '>', -1)
                    ->update(['position' => DB::raw('position - 2')]);
                // vde($nr); // Debugging-Ausgabe
            }
        }
        $img = DB::table($table)->where('id',$id)->first();
         $columns = Schema::getColumnListing($table);
         if(in_array("image_path",$columns) && !empty($img->image_path))
         {
            $im = $img->image_path;
            // vde(getcwd()."/images/$table/".$im);
            @unlink(getcwd()."/images/$table/".$im);
            @unlink(getcwd()."/images/$table/big/".$im);
            @unlink(getcwd()."/images/$table/thumbs/".$im);
         }

        DB::table($table)->where('id', $id)->delete();
        $this->UP_POSI($table,"1");
         $edit = @$_GET['edit'];
    if($edit)
    {
        return redirect()->route($edit, ['table' => $table, 'adm_tab' => @$_SESSION['adm_tab'],"pic"=>@$_GET['pic']])
                     ->with('success', 'Eintrag erfolgreich gelöscht');
    }

        return redirect()->route('tables.index', ['table' => $table, 'adm_tab' => @$_SESSION['adm_tab']])->with('success', 'Eintrag erfolgreich gelöscht.');
    }
}

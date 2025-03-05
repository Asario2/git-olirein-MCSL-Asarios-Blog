<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Inertia\Inertia;
use Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Http\Controllers\IMULController;
use App\Http\Controllers\GlobalController;
use App\Models\Settings;
use App\Models\Table;
use App\Services\Inkrementierer;
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("created_at","DESC")->get();

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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("created_at","DESC")->get();
        $table = "comments";
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::excl_cols;
        $columns = array_diff($columns, $excl_cols);

        if ($table == "blog_posts" || $table == "mindblog" || $table == "images") {
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
        $excl_cols = Settings::excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blog_posts" || $table == "mindblog" || $table == "images") {
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
        $excl_cols = Settings::excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blog_posts" || $table == "mindblog" || $table == "images") {
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
        $excl_cols = Settings::excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blog_posts" || $table == "mindblog" || $table == "images") {
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
        $excl_cols = Settings::excl_cols;
        $excl_cols[] = "position";
        $ext_disabled = Settings::excl_disabled;
        $ext_date = Settings::excl_datefields;
        $exl = Settings::exl;
        $req = Settings::no_req;
        $columns = array_diff($columns, $excl_cols);

        // Find the specific record by its ID
        $entry = DB::table($table)->select($columns)->where('id', $id)->first();

        // Check if the entry exists
        if (!$entry) {
            return redirect()->back()->withErrors(['error' => 'Entry not found.']);
        }
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
    function EditTables(Request $request,$table){
        $tables = DB::table($table)->get();
        return Inertia::render('Admin/TableForm', [
            'filters' => Request()->all('search'),
            'datarows' => $tables,
            "rows" => $tables,
            "table" => $tables,
            "ItemName" => "Beiträge",
            "itemName_des" => "Beitrags",
            "formData"  => "test",
        ]);
    }
    public function ShowTable(Request $request,$table_alt="blogs")
    {   $table = $table_alt;
        $tablez = [];
        $tables = DB::table($table)->select($table.".*",$table.".".Settings::headline[$table]." as name")->filterdefault("name",$request->only('search'))
        ->orderby("created_at","DESC")
        ->paginate(20)
            ->withQueryString();
        $breadcrumbs = [
            'Home' => route('admin.dashboard'),
            'Liste der Tabellen' => route('admin.tables.index'),
            'Tabelle test' => null
        ];

        // Oder wie bei deinem Beispiel
        $breadcrumbs = collect($tablez)->mapWithKeys(function ($item) {
            return [$item->title => route('admin.tables.show', $item->id)];
        });

        $breadcrumbs = $breadcrumbs->put('Liste der Tabellen', route('admin.tables.index'));
        $dd = (array)$tables;

        $result = array_values($dd);

        // $result = stripslashes($result);
        // Ausgabe als JSON ohne Indizes
        // echo json_encode($result, JSON_PRETTY_PRINT);
        $qq = json_encode($result, JSON_PRETTY_PRINT);
        $qq = $this->stripslashes_recursive($qq);
        \Log::info("dprop:".$table.json_encode($tables, JSON_PRETTY_PRINT));

        return Inertia::render('Admin/TableShow', [
            'filters' => Request()->all('search'),
            'breadcrumbs'=>$breadcrumbs,
            'datarows' => $qq,
            "rows" => $tables,
            "table" => ucf($table),
            "table_alt" => $table,
            "ItemName" => "Beiträge",
            "itemName_des" => "Beitrags",
            "formData"  => "test",

        ]);
    }
    function stripslashes_recursive($data) {
        if (is_array($data)) {
            return array_map('stripslashes_recursive', $data); // Rekursive Anwendung
        } else {
            return stripcslashes($data); // Standardmäßige Anwendung von stripslashes auf den Wert
        }
    }
    public function ListTables(Request $request)
    {
        $tables = Table::select("admin_table.table_name as full_name","admin_table.table_name","admin_table.*")->filterBlog($request->only('search'))
            ->orderBy('table_name', 'ASC')
            ->paginate(20)
            ->withQueryString();

            $tables->getCollection()->transform(function ($table) {
                $table->table_name = ucf($table->table_name);
                return $table;
            });
        // \Log::info('tab:'.json_encode($tables, JSON_PRETTY_PRINT));
        return Inertia::render('Admin/TableList', [
            'filters' => Request()->all('search'),
            'datarows' => $tables,
            "rows" => $tables,
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
            \Log::info("prop:".json_encode($dd));
    return Inertia::render('Admin/TableList', [

        $qq
    ]);
}
public function GetTables()
        {
            // Hole die Daten aus der Tabelle adm_table
            $tables = Table::all()->keyBy('id');
            $tables = $tables->sortBy('position');
            $tab = ["rows" =>  array_values($tables)];
            return response()->json($tab);
        }

    // Funktion zum Auflisten aller Einträge der Tabelle
    public function index(Request $request, $table)
    {
        // Prüfen, ob die Tabelle existiert
        if(!CheckRights(Auth::id(),$table,"view"))
        {
            return redirect()->route('tables.noview');
            \Log::info("t:".$table);

        }
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht']);
        }

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $excl_cols = Settings::excl_cols;
        $columns = array_diff($columns, $excl_cols);

        // Bestimme die Sortierreihenfolge
        if ($table == "blog_posts" || $table == "mindblog") {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        elseif($table == "images")
        {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        elseif (Schema::hasColumn($table, "position")) {
            $ord[0] = 'position';
            $ord[1] = 'ASC';
        }  else {
            $ord[0] = "id";
            $ord[1] = "DESC";
        }
        $take = $table == "admin_table" ? 20  : 10;
        // Hole alle Einträge aus der Tabelle mit Paginierung
        $perPage = 10; // Anzahl der Einträge pro Seite
        //  $data = DB::table($table)->select($columns)->orderby($ord[0], $ord[1])->paginate($perPage);
        $posts = DB::table($table)->orderBy($ord[0], $ord[1])->take($take)->get();
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht']);
        }

        // Hole alle Spalten der Tabelle, außer `created_at`, `updated_at`, `published_at`
        $columns = Schema::getColumnListing($table);
        $ext_disabled = Settings::excl_disabled;
        $ext_date = Settings::excl_datefields;
        $exl = Settings::exl;
        $req = Settings::no_req;
        $excl_cols = Settings::excl_cols;
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();



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
            $excl_cols = Settings::excl_cols;
            $ext_disabled = Settings::excl_disabled;
            $ext_date = Settings::excl_datefields;
            $exl = Settings::exl;
            $req = Settings::no_req;
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
            $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
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
            $excl_cols = Settings::excl_cols;
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
            elseif(in_array('table_name',$columns))
            {
                $hcode = 'table_name';
            }
            elseif(in_array('queue',$columns))
            {
                $hcode = 'queue';
            }
            $excl_cols = Settings::excl_cols;
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
            if(!@is_array(Settings::image_sizes[$table])){
                $this->tab = "default";
            }
            else
            {
                $this->tab = $table;
            }
            if(is_dir(public_path("images/$table/big/")))
            {
                $bsize = Settings::image_sizes[$this->tab]['big'] ??  1200;
                $imageUploadResponse = $imul->upload($request,$bsize,"image_path","images/$table/big/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/sm/")))
            {
                $ssize = 128;
                $imageUploadResponse = $imul->upload($request,$ssize,"image_path","images/$table/sm/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/bthumbs/")))
            {
                $btsize = Settings::image_sizes[$this->tab]['bthumbs'] ??  490;
                $imageUploadResponse = $imul->upload($request,$btsize,"image_path","images/$table/bthumbs/",'image_path',$this->time);
            }
            if(is_dir(public_path("images/$table/thumbs/")))
            {
                $tsize = Settings::image_sizes[$this->tab]['thumbs'] ?? 350;
                $imageUploadResponse = $imul->upload($request,$tsize,"image_path","images/$table/thumbs/",'image_path',$this->time);
            }
            $dsize = Settings::image_sizes[$this->tab]['default'] ?? 700;
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


        $excl_cols = Settings::excl_cols;
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
        $data['created_at'] = strtotime($data['created_at']);
            // $colss = DB::select(DB::raw('SHOW COLUMNS FROM $table')); // Ersetzt 'users' durch deine Tabelle
            // $colss = Schema::getColumnListing($table);
            $colss =  DB::select("SHOW COLUMNS FROM $table");

            foreach ($colss as $columna)
            {

                if (substr_count($columna->Field,'_at'))
                {
                    $ints = Settings::int_date_tables;
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

            \Log::info("uuni:" . json_encode($hcode . $request->input($hcode)));
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

                \Log::info("uuni:".json_encode($hcode.$request->input($hcode)));
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
        // ->where('created_at', '>',Carbon::now()->subSeconds(10)) // UNIX-Zeitstempel verwenden
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
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht']);
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


        $excl_cols = Settings::excl_cols;
        $excl_cols[] = "image_path";

        $columns = array_diff($columns, $excl_cols);


        $data = $request->only($columns); // Nur erlaubte Felder speichern
        $data['created_at'] = $data['created_at'];
        if(@$data['birthday'])
        {
            $data['birthday'] = $data['birthday'];
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
                if ($table == "blog_posts" || $table == "mindblog" || $table == "images") {
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
        $tables = DB::table('admin_table')->select('table_name', 'description')->orderby("position","ASC")->get();
        return view("tables.noview",compact('table','tables'));
    }
    public function GetTitle($table,$title,$id)
    {
        return DB::table($table)->where('title', $title)->whereNot("id",$id)->value('id');
    }
    public function UpdateTable(Request $request, $table, $id)
    {
        // Zugriff auf die übergebenen Daten
        $formData = $request->input('formData');  // Formulardaten

        if (!Schema::hasTable($table)) {
            return response()->json(['error' => 'Tabelle nicht gefunden'], 404);
        }
        $record = DB::table($table)->where('id', $id)->first();
            if (!$record) {
                return response()->json(['error' => 'Eintrag nicht gefunden'], 404);
            }
        // Beispiel: Dynamische Tabelle anhand des Parameters "table"
        // if (in_array($table, ['valid_table_1', 'valid_table_2'])) {  // Überprüfe, ob die Tabelle gültig ist
            $updated = DB::table($table)->where('id', $id)->update($request);

            if ($updated) {
                return response()->json(['message' => 'Daten erfolgreich aktualisiert!']);
            } else {
                return response()->json(['message' => 'Fehler beim Aktualisieren der Daten.'], 500);
            }

    }
    public function def_updateTable(Request $request)
    {
        $table = $request->table;  // Die Tabelle, die bearbeitet wird
        $id = $request->id;        // Die ID der Zeile
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

       return response()->json(['success' => false, 'message' => 'Ungültige Tabelle oder Spalte'], 404);
    }

    function update_entry(Request $request)
    {

    }

    // Funktion zum Löschen eines Eintrags
    public function destroy($table, $id)
    {
        if (!Schema::hasTable($table)) {
            return redirect()->back()->withErrors(['error' => 'Tabelle existiert nicht']);
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

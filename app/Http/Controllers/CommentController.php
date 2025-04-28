<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Settings;
use App\Models\Comment;
use App\Models\Post;
use Auth;
use App\Helpers\MailHelper;
use Illuminate\Support\Facades\DB;
use App\Models\Rating;
class CommentController extends Controller
{
    public $ofst;
    function __construct()
    {
        $this->processedIds = session()->get('processedIds', []);
    }


    /**
     * Speichert einen neuen Kommentar.
     */
    public function store_rating(Request $request)
    {
        // Validierung der eingehenden Daten
        $validated = $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'id' => 'required|integer',          // Image ID
            'table' => 'required|string' // Optional: um sicherzustellen, dass es sich um eine Bildbewertung handelt
        ]);

        // Optional: Nutzer ID (z.B. wenn Nutzer angemeldet sind)
        $userId = auth()->id();
        // Bewertung speichern
        if(!$userId)
        {
            return response()->json([
            'status' => 'error',
            'message' => 'Bitte Loggen sie sich ein.'
            ]);
        }
        $rating = DB::table('ratings')
            ->where('table', $validated['table'])
            ->where('users_id', $userId)
            ->where('image_id', $request->id)
            ->update([
                'users_id' => $userId,
                'image_id' => $request->id,
                'table' => $validated['table'],
                'rating' => $validated['rating'],
            ]);



        $alreadyPosted = DB::table("ratings")->where('table',$validated['table'])->where("users_id",$userId)->where('image_id',$request->id)->first();
        if(!$alreadyPosted)
        {
        DB::table("ratings")->insert([
            'users_id' => $userId,
            'image_id' => $request->id,
            'table' => $request->table,
            'rating' => $request->rating,
        ]);
        }
        $upd = ["created_at"=>now()];
        $updu = ["updated_at"=>now()];
        DB::table("ratings")->where("users_id",$userId)->where("image_id",$request->id)->where("table",$request->table)->where("created_at",NULL)->update($upd);
        DB::table("ratings")->where("users_id",$userId)->where("image_id",$request->id)->where("table",$request->table)->update($updu);

        return response()->json([
            'status' => 'success',
            'message' => 'Bewertung erfolgreich gespeichert',
            'rating' => $rating
        ]);
    }

     public function store_alt(Request $request,$table='')
    {
        // Validierung des Eingabewerts
        // $request->validate([
        //     'comment' => 'required|string|max:4000',
        //     'comment2' => 'string|max:4000' // Maximale Länge kann angepasst werden
        // ]);
        $user = DB::table("users")->where("id",Auth()->id())->select("email","nick_name")->first();
        // Kommentar erstellen und in der Datenbank speichern
        // \Log::info("USAH".json_encode($user));
        if (!auth()->check()) {
            return response()->json(['redirect' => route('login')]);
        }
        $comment = new Comment();
        $comment->content = $request->input('comment2') ?? $request->comment;
        $comment->users_id = auth()->id(); // Beispiel für Benutzer-ID
        $comment->created_at = now();
        $comment->updated_at = now();
        $comment->email = @$user->email;
        $comment->admin_table_id = $this->GetTid($table);
        $comment->post_id = $request->post_id;
        $comment->save();


        // return redirect(url()->previous() . '#comment_' . $request->postid)
        //     ->with('success', 'Kommentar erfolgreich gepostet!');
        $url = url()->previous() . "#comment_{$request->post_id}";

        return response()->json([
            'status' => 'success',
            'message' => 'Kommentar erfolgreich gespeichert',
        ]);

    }
     public function store(Request $request,$table='')
    {
        // Validierung des Eingabewerts
        $request->validate([
            'comment' => 'required|string|max:1000', // Maximale Länge kann angepasst werden

        ]);


        $user = DB::table("users")->where("id",Auth()->id())->select("email",'name')->first();
        // Kommentar erstellen und in der Datenbank speichern
        $comment = new Comment();
        $comment->content = $request->input('comment2') ?? $request->comment;
        $comment->users_id = auth()->id(); // Beispiel für Benutzer-ID
        $comment->created_at = now();
        $comment->updated_at = now();
        $comment->email = $user->email;
        $comment->tablename = $table;
        $comment->post_id = $request->post_id;
        $comment->save();
        $nick = $user->name;
        $comment = $comment->content;
        $MailHelper = NEW MailHelper();
        $MailHelper->SendMailer("parie@gmx.de","Neuer Kommentar auf www.asario.net","",'','','','newcomment',["name"=>$nick,"table"=>$table,"comment"=>$comment]);
        return redirect()->back()->with('success', 'Kommentar erfolgreich gepostet!');
    }
    public function fetchComments(Request $request,$table,$postId='')
    {

        $table = $request->table;
        $path = request()->path(); // Gibt "home/show/images/search/Fasermaler"
                $parts = explode("/", $path);
                $table_alt = $table;
                // $sa = Settings::$searchable;
                // \Log::info($parts);
                // foreach($sa as $ta)
                // {
                //     if(in_array($ta,$parts))
                //     {
                //         $table = $ta;
                //         $table_alt  = $ta;
                //         $_GET['table'] = $ta;
                //         \Log::info("ssadddddddddddddd".$table);
                //     }
                //     else
                //     {
                //         continue;
                //     }

                // }

        DB::enableQueryLog();
            $comments = Comment::where('post_id', $postId)
            ->leftJoin('users', 'comments.users_id', '=', 'users.id')
            ->select("comments.*", "users.profile_photo_path", "users.name as author")
            ->where("admin_table_id",$this->GetTid($table_alt))
            ->orderBy("id","DESC")->latest()->get();
            // \Log::info(DB::getQueryLog());
            //  \Log::info("TABLE:".$table);
             if(!$comments){
                //return [];
             }
        return response($comments);
    }
    public function GetTid($tab)
    {
        return DB::table("admin_table")->where("name",strtolower($tab))->pluck("id")->first();
    }
    public static function ComForm($table,$comments,$post)
    {

               // \Log::info("TABLE:".$table);
                $offset = request()->get('offset', -10);
                // $offset = @$_GET['offset'] ?? $offset;

                $limit = 10;
                //$offset = $offset-10;

                $comments[$post->id] = DB::table('comments')
                    ->join('users', 'comments.users_id', '=', 'users.id')
                    ->where('comments.post_id', '=', $post->id)
                    ->orderBy('comments.id', 'DESC')
                    ->select('users.name', 'users.image_path', 'comments.*')
                    ->take($limit)
                    ->offset($offset)
                    ->get();
        return view('posts.partials.comment_form', [
        'table'=> $table,
        'post' => $post,
        'comments' => $comments
    ])->render();
    }
    public function fetchComments_alt_old(Request $request)
    {
        $postId = $request->post_id;
        $offset = $request->offset ?? 0; // Startpunkt für das Paging
        $limit = 10; // Anzahl der Kommentare pro Anfrage

        // Kommentare abrufen
        $comments = DB::table('comments')
            ->join('users', 'comments.users_id', '=', 'users.id') // Join mit der Tabelle users
            ->where('comments.post_id', $postId)
            ->where('comments.tablename', 'images')
            ->orderBy('comments.created_at', 'desc')
            ->select('comments.*', 'users.name','users.image_path') // Auswahl von Feldern aus beiden Tabellen
            ->skip($offset)
            ->take($limit)
            ->get();
        return response()->json([
            'comments' => $comments,
        ]);
    }
public function fetchComments_alt(Request $request)
{
    $postId = $request->query('post_id');
    $offset = (int)$request->query('offset', 0); // Standardwert für Offset
    $limit = 10; // Anzahl der Kommentare pro Anfrage
    $processedIds = session()->get('comment_ids', []);

    // Hole die Kommentare und verbinde sie mit den Benutzerdaten
    $comments = DB::table('comments')
        ->join('users', 'comments.users_id', '=', 'users.id')
        ->where('comments.post_id', $postId)
        ->whereNotIn('comments.id', $processedIds)
        ->select(
            'comments.id',
            'users.name',
            'users.image_path',
            'comments.content',
            'comments.created_at'
        )
        ->orderBy('comments.id', 'desc') // Neuester Kommentar zuerst
        ->offset($offset)
        ->limit($limit)
        ->get();
        $processedIds = session()->get('comment_ids', []);
        $newIds = $comments->pluck('id')->toArray();
        session()->put('comment_ids', array_merge($processedIds, $newIds));
        // return response()->json(["comments"=>session()->get('comment_ids')]);
        foreach($newIds AS $nid)
        {
            if(!in_array($nid->id,$processedIds))
            {

            }

        }
        return response()->json(['comments' => $comments]);



}

public function fetchComments_alt2(Request $request)
{
    // Initialisierung der Variablen
    $em = 0;


    // Eingabewerte
    $postId = $request->query('post_id');
    $offset = (int)$request->query('offset', 0); // Standardwert für Offset
    $limit = 10; // Anzahl der Kommentare pro Anfrage

    // Hole die Kommentare und verbinde sie mit den Benutzerdaten
    $comments = DB::table('comments')
        ->join('users', 'comments.users_id', '=', 'users.id')
        ->where('comments.post_id', $postId)
        ->select(
            'users.name',
            'users.image_path',
            'comments.content',
            'comments.id'
        )
        ->orderBy('comments.created_at', 'desc') // Neuester Kommentar zuerst
        ->offset($offset)
        ->limit($limit)
        ->get();

    // Überprüfe, ob der Offset bereits verarbeitet wurde
    if (!in_array($offset, $this->ofst) || !is_array($this->ofst)) {
        $this->ofst[] = $offset; // Offset speichern, wenn noch nicht vorhanden
        session()->put('offsets', $ofst); // Speichere das Offset-Array in der Session
    } else {
        $em++; // Zähler erhöhen, wenn der Offset schon verarbeitet wurde
    }



    // Überprüfe, ob Kommentare vorhanden sind oder ob wir bereits alle Kommentare geladen haben
    if ($comments->isEmpty() || $em > 0) {

        return response()->json(['comments' => []]); // Keine weiteren Kommentare
    } else {
        return response()->json(['comments' => $comments]); // Gebe die geladenen Kommentare zurück
    }
}
public function SetOffset(Request $request)
{

}
public function com_loadMore(Request $request,$tid='')
    {
       // \Log::info("req:".json_encode($tid));
        $offset = $request->input('offset',0);
        $limit = 10;
        $id = $tid;
        $offset = (int) $offset;
        //$offset = $offset > 0 ? ($offset-10) : $offset;
        // \Log::info($offset);
        $limit = $request->get('limit', 10);
        // Weitere Beiträge laden
        $posts = DB::table('comments')
            ->select('comments.*', 'users.name','users.image_path','blog_posts.*') // Wähle Spalten aus comments und users
            ->join('users', 'comments.users_id', '=', 'users.id') // Join mit users
            ->join('blog_posts', function ($join) {
              $join->on('comments.tablename', '=', DB::raw("'blog_posts'")); // Text "Blog_posts"
})
            ->joinSub(
                DB::table('comments')
                    ->select('post_id', DB::raw('MAX(created_at) as latest_created_at')) // max(created_at)
                    ->where('post_id', $tid) // Filter für den Post
                    ->where('pub', 1) // Nur veröffentlichte Kommentare
                    ->groupBy('post_id'), // Gruppiere nach post_id
                'subquery', // Subquery Alias
                function ($join) {
                    $join->on('comments.post_id', '=', 'subquery.post_id') // Verbinde mit comments
                        ->on('comments.created_at', '=', 'subquery.latest_created_at'); // Nur die neuesten
                }
            )
            ->orderBy('subquery.latest_created_at', 'desc') // Sortiere nach neuesten Kommentaren
            ->skip($offset) // Pagination: Offset
            ->take($limit) // Pagination: Limit
            ->get();



        // $postIds = DB::table('comments')->pluck('post_id')->first(); // Pluck gibt ein Array mit den IDs zurück
        $postIds = DB::table('comments')
            ->groupBy('post_id')
            ->pluck('post_id');
        $data = $posts;
        // foreach ($postIds as $id) {
        // $comments[$id => []]; // Initialisiere das Array
        $ratings[$id] = DB::table('ratings')
            ->where('image_id', $id) // Ersetze $id mit der gewünschten image_id
            ->selectRaw('COALESCE(AVG(rating), 0) as a_rating')
            ->pluck('a_rating');
    // $newIds = DB::table('comments')
    //     ->join('users', 'comments.users_id', '=', 'users.id')
    //     ->where('comments.post_id', '=', $id)
    //     ->pluck('comments.id'); // Hol nur die `id`-Spalte


    // $processedIds = array_merge($newIds,$processedIds);  // Füge die neue ID zu den verarbeiteten IDs hinzu

    // session()->put('processedIds', $processedIds);
    // $commentsQuery[$id] = DB::table('comments')
    //     ->join('users', 'comments.users_id', '=', 'users.id')
    //     ->where('comments.post_id', '=', $id)
    //     ->whereNotIn('comments.id', $this->processedIds)
    //     ->orderBy("comments.created_at", "desc")
    //     ->select('users.name', "users.image_path", 'comments.*')
    //     ->get();
    // $comments = [
    //     $id => $commentsQuery[$id]->unique('comments.id')
    // ]; // Filtere eindeutige Einträge basierend auf der Kommentar-ID
    DB::enableQueryLog();
    $comments = [
        $id => DB::table('comments')
            ->join('users', 'comments.users_id', '=', 'users.id')
            ->where('comments.post_id', '=', $id)
            ///->whereNotIn('comments.id', $this->processedIds) // IDs aus processedIds ausschließen
            ->orderBy("comments.id", "desc") // Sortierung nach Erstellungsdatum
            ->select('users.name', 'users.image_path', 'comments.*') // Gewünschte Spalten auswählen
            ->take($limit)
            ->offset($offset)
            ->get() // Daten abrufen
    ];
    // \Log::info(DB::getQueryLog());
// \Log::info("com_$id:".$comments[$id]);
// }
    return response()->json(compact('comments'));

}
    public function destroy($postid,$id,$table,$pic='')
    {
        if(!CheckRights(Auth::id(),"comments","delete"))
        {
            return redirect()->route('tables.noview');
        }

        // $post = DB::table('comments')->where("id",$id)->first();
        // $post->delete();
        $post = Comment::find($id);

        if ($post) {
            $post->delete();
        }
    //     $tab = $table ?? "images";
    //     \Log::info("pic:".$pic);
    //     $pic = "acryl";
    //     $redir = $tab == "images" ? "pictures" : "blgoposts.index";
    //     return redirect()->route($tab, ['open_comments' => $postid,'pic'=>$pic])
    // ->with('success_'.$postid, 'Kommentar erfolgreich gelöscht!')
    // ->header('Location', redirect()->route($redir, ['pic'=>$pic,'open_comments' => $postid])->getTargetUrl() . "#cmtbtn-$postid");
    $tab = $table ?? "images";
    // \Log::info("pic:". $pic. "tab:".$tab);

    // $pic = "acryl"; // Sicherstellen, dass $pic definiert ist
    $redir = $tab == "images" || $tab == 'pictures' ? "pictures" : "blogposts.index";

    return redirect()->route($tab, [
            'open_comments' => $postid,
            'pic' => $pic // pic hier explizit setzen
        ])
        ->with('success_' . $postid, 'Kommentar erfolgreich gelöscht!')
        ->header('Location', route($redir, [
            'pic' => $pic, // pic auch hier setzen
            'open_comments' => $postid
        ]) . "#cmtbtn-$postid");

    }
    public function destroy_comments($comments_id)
    {
        if(!CheckRights(Auth::id(),"comments","delete"))
        {
            return redirect()->route('tables.noview');
        }

        // $post = DB::table('comments')->where("id",$id)->first();
        // $post->delete();
        $post = Comment::find($comments_id);

        if ($post) {
            $post->delete();
        }
    //     $tab = $table ?? "images";
    //     \Log::info("pic:".$pic);
    //     $pic = "acryl";
    //     $redir = $tab == "images" ? "pictures" : "blgoposts.index";
    //     return redirect()->route($tab, ['open_comments' => $postid,'pic'=>$pic])
    // ->with('success_'.$postid, 'Kommentar erfolgreich gelöscht!')
    // ->header('Location', redirect()->route($redir, ['pic'=>$pic,'open_comments' => $postid])->getTargetUrl() . "#cmtbtn-$postid");
    $tab = $table ?? "images";
    // \Log::info("pic:". $pic. "tab:".$tab);

    // $pic = "acryl"; // Sicherstellen, dass $pic definiert ist
    $redir = $tab == "images" || $tab == 'pictures' ? "pictures" : "blogposts.index";

    // return redirect()->route($tab, [
    //         'open_comments' => $postid,
    //         'pic' => $pic // pic hier explizit setzen
    //     ])
    //     ->with('success_' . $postid, 'Kommentar erfolgreich gelöscht!')
    //     ->header('Location', route($redir, [
    //         'pic' => $pic, // pic auch hier setzen
    //         'open_comments' => $postid
    //     ]) . "#cmtbtn-$postid");

    }
public function loadComments(Request $request, $postId)
{
    $take = $request->get('take', 10); // Anzahl der zu ladenden Kommentare
    $limit = 10;
    $offset = $request->get('offset', 0);
    $processedIds = session()->get('processedIds', []); // Falls nicht vorhanden, ein leeres Array zurückgeben

    // Neue ID, die verarbeitet wurde
    $newId = $postId;

    // Wenn die neue ID noch nicht in den verarbeiteten IDs ist, füge sie hinzu
    if (!in_array($newId, $processedIds)) {
        $processedIds[] = $newId;  // Füge die neue ID zu den verarbeiteten IDs hinzu
    }

    // Speichern der aktualisierten 'processedIds' in der Session
    session()->put('processedIds', $processedIds);

    // Hole Kommentare und schließe diejenigen aus, deren IDs in $processedIds enthalten sind
    $comments = Comment::join('users', 'comments.users_id', '=', 'users.id')
        ->where('comments.post_id', '=', $postId)
        ->whereNotIn('comments.id', $processedIds) // Exkludiere Kommentare mit IDs in $processedIds
        ->orderBy('comments.created_at', 'desc')
        // ->select('users.name','users.image_path', 'comments.*')
        ->take($limit)
        ->offset($offset)
        ->get(); // Abfrage ausführen und Ergebnisse holen

    // Lade den Post
    $posts = Post::find($postId);
    $hasMore = Comment::where('post_id', $postId)
        ->count() > ($offset + $take);

    return response()->json([
        'comments' => $comments,
        'hasMore' => $hasMore,
    ]);
}
public function loadComments_oldd(Request $request)
{
    $request->validate([
        'post_ids' => 'required|array',
        'post_ids.*' => 'integer',
        'page' => 'nullable|integer|min:1',
    ]);

    $postIds = $request->post_ids;
    // $comments = Comment::whereIn('post_id', $postIds)
    //     ->orderBy('created_at', 'desc')
    //     ->paginate(10); // 10 Kommentare pro Seite
    $comments = Comment::whereIn('post_id', $postIds)->get()->groupBy('post_id');

    return response()->json([
        'comments' => $comments->items(),
        'next_page' => $comments->nextPageUrl(),
    ]);
}







}

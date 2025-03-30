<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Blog;
use Inertia\Inertia;
use Illuminate\Support\Str;
use Laravel\Jetstream\Jetstream;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Session;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use League\CommonMark\CommonMarkConverter;
if(!session_id())
{
    session_start();
}
class HomeController extends Controller
{
    //
    public function home_index()
    {
        //
        $success = 'Herzlichen Willkommen im Laravel-Template Starter Eleven';
        Session::flash('toast.info', $success);
        //
        return Inertia::render('Homepage/Home');
    }
    public function home_AI()
    {
        $data = DB::table("texts")->select('texts.*','blog_authors.name as author_name')->leftJoin('blog_authors', 'blog_authors.id', '=', 'texts.author_id')->where("texts.id","9")->first();
        $data->text = Str::markdown($data->text);
        return Inertia::render('Homepage/AiContent', ["data" => [$data]]); // <-- in Array umwandeln
    }
    //
    public function home_blog_index()
    {
        $zeitpunkt = Carbon::now();
        //
        $blogs = Blog::select(
            'blogs.id as id',
            'blogs.blog_date as blog_date',
            'blogs.title as title',
            'blogs.title as name',
            'blogs.slug as slug',
            'blogs.summary as summary',
            'blogs.reading_time as reading_time',
            'blog_authors.name as author_name',
            'blogs.image_path as url',
            'blog_categories.name as category_name',
            "blogs.xis_aiImage as madewithai",
            )
            ->join('blog_authors', 'blog_authors.id', '=', 'blogs.blog_authors_id')
            ->join('blog_categories', 'blog_categories.id', '=', 'blogs.blog_categories_id')
            //
            ->whereDate('blog_date', '<=', $zeitpunkt)
            //
            ->filterBlog(Request::only('search'))
            ->orderBy('blogs.blog_date', 'desc')
            ->orderBy('blogs.id', 'desc')
            ->paginate(100)
            ->withQueryString();
        //
        $blogs->getCollection()->transform(function ($blog) {
            $blog->summary = KILLMD($blog->summary);
            return $blog;
        });
        $blogs->getCollection()->transform(function ($blog) {
            $blog->title = html_entity_decode($blog->title);
            return $blog;
        });

        $table = "blogs";
        $blogs->aiOverlayImage = "ai-".@$_SESSION['dm'].".png";
        foreach ($blogs as $blog) {
            $blog->editRights = CheckRights(Auth::id(), $table, "edit");
            $blog->viewRights = CheckRights(Auth::id(), $table, "view");
            $blog->deleteRights = CheckRights(Auth::id(), $table, "delete");
            $blog->addRights = CheckRights(Auth::id(), $table, "add");
            $blog->date_tableRights = CheckRights(Auth::id(), $table, "date_table");
        }
            // \Log::info(json_encode($blogs, JSON_PRETTY_PRINT));
            // \Log::info("Test-Log-Eintrag");

        return Inertia::render('Homepage/BlogList', [
            'filters' => Request::all('search'),
            'blogs' => $blogs,
        ]);
    }
    public function home_images_index()
    {
        $table = "image_categories";
        $data = DB::table($table)->orderBy("shortname","ASC")->get();
        return Inertia::render('Homepage/PicturesCat', [
           'data'=>$data,
        ]);
    }
    public function home_images(Request $request,$slug)
    {
        if($slug != "Alphabet")
        {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        else{
            $ord[0] = "position";
            $ord[1] = "ASC";
        }
        $entries = DB::table("images")
        ->leftJoin("camera", "images.camera_id", "=", "camera.id")
        ->leftJoin("image_categories", "image_categories.id", "=", "images.image_categories_id")
        ->where(function($query) {
            $query->where("images.pub", 1)->orWhere("images.pub", 2);
        })
        ->where("image_categories.slug", $slug)
        ->select("images.*", "camera.name as camera", "image_categories.slug as slug")
        ->when(request("search"), function ($query) {
            $query->filterdefault(['search' => request('search')]);
        })
        ->orderBy($ord[0], $ord[1])
        ->get();
        // \Log::info([$entries->toSql(), $entries->getBindings()]);

        $ocont = DB::table("image_categories")->where("slug",$slug)->first();
        return Inertia::render('Homepage/Pictures', [
            'entries' => $entries,
            'ocont' => $ocont,
            'filters' => Request()->all('search')
        ]);
    }
    //
    public function home_images_search(Request $request,$slug)
    {
        if($slug != "Alphabet")
        {
            $ord[0] = "created_at";
            $ord[1] = "DESC";
        }
        else{
            $ord[0] = "position";
            $ord[1] = "ASC";
        }

        DB::enableQueryLog();
        $entries = DB::table("images")
        ->leftJoin("camera", "images.camera_id", "=", "camera.id")
        ->leftJoin("image_categories", "image_categories.id", "=", "images.image_categories_id")
        ->select("images.*", "camera.name as camera", "image_categories.slug as category_slug")
        ->where("image_categories.slug", "$slug") // 🔹 Begrenzung auf die Kategorie
        ->where(function ($query) {
            $query->where("images.pub", 1)
                  ->orWhere("images.pub", 2);
        })->when(request("search"), function ($query) use ($slug) {
            $query->where(function ($subquery) {
                $subquery->filterdefault(['search' => request('search')]);
            });
        })
        ->orderBy($ord[0], $ord[1])
        ->get();

        $queries = DB::getQueryLog();
        //\Log::info  ("QQ:".json_encode($queries));
        $ocont = DB::table("image_categories")->where("slug",$slug)->first();
        return Inertia::render('Homepage/Pictures', [
            'entries' => $entries,
            'ocont' => $ocont,
            'filters' => Request()->all('search')
        ]);
    }
    //
    public function home_blog_show($slug)
    {
        $blog = Blog::where('slug', $slug)->first();
        //
        $blog->blog_author;
        // $blog->blog_images;
        $blog->url = $blog->image_path;
        $blog->blog_category;
        $blog->editRights = CheckRights(Auth::id(),"blogs","edit");
        $blog->deleteRights = CheckRights(Auth::id(),"blogs","delete");
        $blogarticle = null;
        //
        if ($blog->markdown_on) {

             $blogarticle = renderText($blog->content);
            //  \Log::info("md:".json_encode($blogarticle));
            $blog->content = renderText($blog->content);
            // $filePathName = 'blogs/blog_' . $blog->id . '.md';
            // $blogarticleFile = Jetstream::localizedMarkdownPath($filePathName);
            // $blogarticle = Str::markdown(file_get_contents($blogarticleFile));
        }
        //
        // \Log::info("bl: ".json_encode($blog));
        return Inertia::render('Homepage/BlogShow', [
            'blog' => $blog,
            'blogarticle' => $blogarticle
        ]);
    }
    //
    public function renderMarkdown(CommonMarkConverter $converter,$markdown)
    {

        $html = $converter->convert($markdown);

        return response()->json(['html' => $html]);
    }
    public function home_get_started()
    {
        $getStartedFile = Jetstream::localizedMarkdownPath('get_started.md');
        $getStarted = Str::markdown(file_get_contents($getStartedFile));
        //
        return Inertia::render('Homepage/GetStarted', [
            'get_started' => $getStarted,
        ]);
    }
    //
    public function home_pricing()
    {
        return Inertia::render('Homepage/Pricing');
    }
    //
    public function home_imprint()
    {
        $imprintFile = Jetstream::localizedMarkdownPath('imprint.md');
        $imprint = Str::markdown(file_get_contents($imprintFile));
        //
        return Inertia::render('Homepage/Imprint', [
            'imprint' => $imprint,
        ]);
    }
    //
    public function home_privacy()
    {
        $privacyFile = Jetstream::localizedMarkdownPath('privacy.md');
        $privacy = Str::markdown(file_get_contents($privacyFile));
        //
        return Inertia::render('Homepage/Privacy', [
            'privacy' => $privacy,
        ]);
    }

    public function home_terms()
    {
        $termsFile = Jetstream::localizedMarkdownPath('terms.md');
        $terms = Str::markdown(file_get_contents($termsFile));
        //
        return Inertia::render('Homepage/Terms', [
            'terms' => $terms,
        ]);
    }

    public function home_no_application_found()
    {
        return Inertia::render('Homepage/Home');
    }

    public function home_user_is_no_admin()
    {
        return Inertia::render('Homepage/UserIsNoAdmin');
    }

    public function home_user_is_no_employee()
    {
        return Inertia::render('Homepage/UserIsNoEmployee');
    }

    public function home_user_is_no_customer()
    {
        return Inertia::render('Homepage/UserIsNoCustomer');
    }

    public function home_invalid_signature()
    {
        return Inertia::render('Homepage/InvalidSignature');
    }


}

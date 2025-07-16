<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\PersonalController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\BlogPostController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\DarkModeController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\NameBindingsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\HomeController_mfx;
use App\Http\Controllers\HandbookController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\TwoFactorController;
use App\Http\Controllers\GlobalController;
use App\Http\Controllers\DashboardAdminController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\DashboardCentralController;
use App\Http\Controllers\DashboardCustomerController;
use App\Http\Controllers\DashboardEmployeeController;
use App\Http\Controllers\ImageUploadController;
use League\CommonMark\CommonMarkConverter;
use Illuminate\Http\Request;
use App\Http\Controllers\TablesController;
use Laravel\Fortify\TwoFactorAuthenticatable;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CookieController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\RightsController;
use App\Helpers\Settings;
use App\Mail\CommentMail;
use App\Mail\ContactMail;
use Whitecube\LaravelCookieConsent\CookiesManager;
use Whitecube\LaravelCookieConsent\Http\Controllers\AcceptAllController;
use Whitecube\LaravelCookieConsent\Http\Controllers\AcceptEssentialsController;
use Whitecube\LaravelCookieConsent\Http\Controllers\ConfigureController;

GlobalController::SetDomain();
// include __DIR__."/extraroutes.php";
Route::get('/test-admin', function () {
    return '✅ Middleware is_admin funktioniert';
})->middleware(['auth', 'is_admin']);
Route::get('/copyleft/images', [ImageUploadController::class, 'CopyLeft'])->name('images.copyleft');
Route::get('/db-check', function () {
    $tenant = App\Models\Tenant::first(); // oder aus Subdomain ermitteln
    $connection = $tenant->getConnectionName(); // "mariadb_mfx"

    // Optional DB Name auslesen
    $dbName = $tenant->getConnection()->getDatabaseName();

    return response()->json([
        'connection' => $connection,
        'db' => $dbName,
        'host' => request()->getHost(),
    ]);
});
Route::post("/cookie_acceptall",[AcceptAllController::class,'__invoke'])->name("cookieconsent.accept.all2");
Route::post("/cookie_acceptess",[AcceptEssentialsController::class,'__invoke'])->name("cookieconsent.accept.essentials2");
Route::post("/cookie_config",[ConfigureController::class,'__invoke'])->name("cookieconsent.accept.configuration2");

# === MFX === #
foreach (['mfx.localhost.de', 'www.marblefx.de'] as $domain) {
    Route::domain($domain)->group(function () {
    Route::get('/', [HomeController_mfx::class,"home"])->name("home.mfx");
    Route::get('/changelog', [HomeController_mfx::class,"mcsl_changelog"])->name("mfx.changelog");
    Route::get('/home/users', function () {
        return redirect("NoPageFound");
    })->name('home.userlist2');
    Route::get('/home/users/show/{user}/{id}', function () {
        return redirect("NoPageFound");
    })->name('user.show');
    Route::get('/home/projects',  [HomeController_mfx::class,"projects"])->name("home.projects.mfx");
    Route::get('/home/images',  [HomeController_mfx::class,"images"])->name("home.images.mfx");
    Route::get('/home/people',  [HomeController_mfx::class,"people"])->name("home.people.mfx");
    Route::get('/home/impressum',  [HomeController_mfx::class,"imprint"])->name("home.imprint.mfx");
    Route::get('/home/infos/',  [HomeController_mfx::class,"infos_index"])->name("home.infos.mfx");
    Route::get('/home/infos/show/{id}',  [HomeController_mfx::class,"infos_show"])->name("home.infos.show.mfx");
    Route::get('/home/powered-by-mcs',  [HomeController_mfx::class,"infos_pow"])->name("home.powered.show.mfx");

});
}
Route::get('/api/tailwind-colors/{subdomain}', [HomeController_mfx::class,"getStyles"])->name("mfx.getstyles");
Route::get('/api/getVotez', [HomeController_mfx::class,"getVotez"])->name("mfx.getvotez");
// MAILFORM SUBMIT
Route::post('/contact/send',[CommentController::class,"sendmc"]);

Route::post('/mail-test',[CommentController::class,"sendm"]);
// Route::get('/mail-test', function () {
    // Mail::to('parie@gmx.de')->send(new CommentMail('Asario.de', 'http://localhost:8081/admin/tables/comments/show',auth()->user()->name,$comment->content));
    // return 'Mail gesendet!';
// });
Route::get("/api/user/rights/des/{table}/{right}",[RightsController::class,"GetRights"])->name("GetRights");
Route::get('/api/chkcom/{id?}', [CommentController::class, 'checkComment'])->name("comments.check");

Route::post('/api/getCheckedBatch', [CommentController::class, 'CheckCommentsDone'])->name("comments.check.done");

Route::get("/api/user/rights",[RightsController::class,"GetRights_all"])->name("GetRights_all");
Route::get('/no-rights', [HomeController::class, 'no_rights'])->name('tables.noview');


Route::get('/api/settings', [SettingsController::class, 'all']);
Route::get('/api/GetLastAct', function (){

    return response($_SERVER['HTTP_REFERER']);
});
Route::get('/GetAuth', function () {
    if (Auth::check()) {
        // \Log::info("✅ Eingeloggt, User-ID: " . Auth::id());
        return response()->json("true");
    }

    // \Log::i  nfo("🚨 Nicht eingeloggt");
    return response()->json("false");
})->name("GetAuth");
Route::get("/GETUserID", function (){
    return response()->json(Auth::id());
});
Route::get('/get-total-rating/{table}', [RatingController::class, 'getTotalRating']);

Route::get('api/admin_table_positions', [RightsController::class,"GetTables_posi"])->name("GetTablesPosi");
Route::get('/api/roles/{urid}', [TablesController::class, 'getRoles']);
Route::get("/admin/user-rights/get",[TablesController::class,'GetURights'])->name("admin.users_rights.get");
Route::middleware(['auth'])->group(function () {
    Route::post('/two-factor/setup', [TwoFactorController::class, 'setup'])->name('two-factor.setup');
    Route::post('/two-factor/confirm', [TwoFactorController::class, 'confirm'])->name('two-factor.confirm_alt');
    Route::get("/admin/User_Rights",[TablesController::class,'URights'])->name("admin.users_rights");
    Route::get("/api/GetSRights/",[TablesController::class,'GetSRights'])->name("admin.GetSRights");
    Route::post("/api/admin/user-rights/save",[TablesController::class,'SaveURights'])->name("admin.users_rights.save");



    Route::get("api/getSlug/{table}/{id?}", [TablesController::class, "getSlug"])->name("getSlug");
});

Route::get('/namebindings', [NameBindingsController::class, 'RefreshFields'])->name("ColumnFetcher");
Route::post('/upload-image/{table}/{isw?}', [ImageUploadController::class, 'upload'])->name('upload.image');
Route::post('/upload-image_alt/{table}/{isw?}/{oripath?}', [ImageUploadController::class, 'upload_ori'])->name('upload.gen');
Route::get('/GetUserNull', [TablesController::class, 'GetUserNull'])->name('GetUserNull');

Route::post('/save-image/{table}', [ImageUploadController::class, 'save'])->name('save.image');
Route::get('/comments/{table}/{postId}', [CommentController::class, 'fetchComments'])->name('comments.fetch');
Route::post('/save-rating', [RatingController::class, 'saveRating']);
Route::get('/get-rating/{table}/{postId}', [RatingController::class, 'getStars']);
Route::get('/get-average-rating/{table}/{postId}', [RatingController::class, 'getAverageRating']);
Route::get('/tables/form-data/{table}/{id}', [TablesController::class, 'ExportFields'])
->name("GetTableForm");
Route::get('/pb', [RatingController::class, 'pb'])
->name("pb");
// ========
// Homepage
// ========
// Startseite
Route::get('/', function () {
    return redirect('/blogs');
})->name('home.index');
// Get Started
Route::get('/home/get_started', [HomeController::class, 'home_get_started'])->name('home.get_started');
// Pricing
Route::get('/home/pricing', [HomeController::class, 'home_pricing'])->name('home.pricing');
// Imprint
Route::get('/home/imprint', [HomeController::class, 'home_imprint'])->name('home.imprint');
// Privacy
Route::get('/home/privacy', [HomeController::class, 'home_privacy'])->name('home.privacy');
// Terms
Route::get('/home/terms', [HomeController::class, 'home_terms'])->name('home.terms');
// Ai Content
Route::get('/home/ai', [HomeController::class, 'home_AI'])->name('home.ai');
// Picures show gallery
Route::get('/home/show/pictures/{slug}', [HomeController::class, 'home_images'])->name('home.images.gallery');
Route::get('/home/search/pictures/{slug}', [HomeController::class, 'home_images_search'])->name('home.images.gallery.search');
// SEARCH from PicturesCat
Route::get('/home/search_cat/pictures/', [HomeController::class, 'home_images_search_cat'])->name('home.images.search.cat');
// Pictures Overview
Route::get('/home/pictures', [HomeController::class, 'home_images_index'])->name('home.images.index');

// Shortpoems
Route::get('/home/shortpoems', [HomeController::class, 'home_shortpoems'])->name('home.shortpoems');
// DidYouKnow
Route::get('/home/didyouknow', [HomeController::class, 'home_didyouknow'])->name('home.didyouknow');
// Liste der Blogartikel
Route::get('/blogs', [HomeController::class, 'home_blog_index'])->name('home.blog.index')->middleware('remember');
// Display Blogartikel
Route::get('/blogs/show/{autoslug}', [HomeController::class, 'home_blog_show'])->name('home.blog.show');

// Anwendung konnte nicht gefunden werden
Route::get('/home/no_application_found', [HomeController::class, 'home_no_application_found'])
    ->name('home.no_application_found');
    Route::get("/api/GetCat/{table}/{id}",[TablesController::class,'GetCats'])->name("GetCats");
// Anwender ist kein Administrator
Route::get('/home/user_is_no_admin', [HomeController::class, 'home_user_is_no_admin'])->name('home.user_is_no_admin');
// Anwender ist kein Mitarbeiter
Route::get('/home/user_is_no_employee', [HomeController::class, 'home_user_is_no_employee'])->name('home.user_is_no_employee');
// Anwender ist kein Kunde
Route::get('/home/user_is_no_customer', [HomeController::class, 'home_user_is_no_customer'])->name('home.user_is_no_customer');

// Mail-Verifizierungs-Signatur ist abgelaufen
Route::get('/home/invalid_signature', [HomeController::class, 'home_invalid_signature'])->name('home.invalid_signature');
// User Liste
Route::get('/home/users', [HomeController::class, 'home_userlist'])->name('home.userlist');
// User Liste
Route::get('/home/users/show/{user}/{id}', [HomeController::class, 'home_usershow'])->name('home.user.show');

// PICTURES
Route::get('/pictures', [App\Http\Controllers\PagesController::class, 'ab_images'])->name('images');
Route::get('/pictures/{pic}/',[App\Http\Controllers\PagesController::class, 'ab_images_cat'])->name('pictures');
// Route::get('/blogposts', [BlogPostController::class, 'index'])->name('blogposts.index');
Route::get('/devmod', function () {
    // ShowRepo();
    //IMULController::smpix();
    //  DevMod();
    // ConvertTypes();
    return date("Y-m-d H:i:s",'1501344360');
    //  small_images(public_path()."/images/_ab/users");
     // Hauptprogramm
    // $viewsPath = resource_path('views/layouts'); // Pfad zu den Blade-Dateien
    // $publicJsPath = public_path('js');          // Zielordner für JavaScript-Dateien
    // $publicCssPath = public_path('css');        // Zielordner für CSS-Dateien
    // updateBladeFiles($viewsPath, $publicJsPath, $publicCssPath);


    })->name('devmod');
    Route::get('/get-nick-from-comments', function (Request $request) {
        return DB::table('comments')
            ->where('comments.id', $request->id)
            ->select('comments.nick')
            ->first(); // nur ein Eintrag
    })->name('getnickfromcomments');
    // Route::post('/toggle-darkmode', [App\Http\Controllers\DarkModeController::class, 'toggle'])->name('toggle.darkmode');
    Route::get('tables/{table}/create', [TablesController::class, 'createEntryForm'])->name('tables.create-table');
    Route::post('/comments/store/{table}/{postId}', [CommentController::class, 'store_alt'])->name('comments.store_alt');
    Route::post('/comments/{table}/{id}', [CommentController::class, 'store'])->name('comments.store');
    // Route::get('/{table}/{cat?}#headline_{id}', [PostController::class, 'show'])->name('posts.show');


// ===============================
// Routen für angemeldete Anwender
// ===============================
Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    // =================
    // APPLICATIONSWITCH
    // =================
    Route::get('/applicationswitch', [ApplicationController::class, 'index'])->name('applicationswitch');

    // =================
    // CENTRAL DASHBOARD
    // =================
    // Central-Dashboard
    Route::get(
        '/central/dashboard',
        [DashboardCentralController::class, 'central_index']
    )->name('central.dashboard');

    // =================
    // APPLICATION ADMIN
    // =================
    Route::middleware(['is_admin'])->group(function () {
        // Dashboard
        Route::get(
            '/admin/dashboard',
            [DashboardAdminController::class, 'admin_index']
        )->name('admin.dashboard');
        Route::post("/personal_update", [PersonalController::class, 'update'])->name("personal.update");
        Route::get('/api/created-at', [TablesController::class, 'getCreatedAt'])->name("created.at");
        // Route::get("/api/created-at", [TablesController::class],'GetCreatedAt')->name("created.at");









        // =================
        // Laravel-Log-Datei
        // =================
        // Display Log-Datei
        Route::get('/admin/laravel_log', [\Rap2hpoutre\LaravelLogViewer\LogViewerController::class, 'index'])->name('admin.laravel_log');
        // ========
        // Handbook
        // ========
        Route::get('/admin/handbook', [HandbookController::class, 'admin_handbook'])->name('admin.handbook');
        // =====
        // Blogs
        // =====
        // Liste der Blogartikel (blogs)
        Route::get('/admin/blogs/index', [BlogController::class, 'admin_blog_index'])
            ->name('admin.blog.index')->middleware('remember');
        // Create a new Blogartikel
        Route::get('/admin/blogs/create', [BlogController::class, 'admin_blog_create'])
            ->name('admin.blog.create');
        // Store Blogartikel
        Route::post('/admin/blogs/store', [BlogController::class, 'admin_blog_store'])
            ->name('admin.blog.store');
        // Edit des Blogartikels
        Route::get('/admin/blogs/{blog}/edit', [BlogController::class, 'admin_blog_edit'])
            ->name('admin.blog.edit');
        // Update des Blogartikels
        Route::put('/admin/blogs/{blog}', [BlogController::class, 'admin_blog_update'])
            ->name('admin.blog.update');
        // ====
        // Tables
        // ====
        // Store Table Entry
        Route::post('/admin/tables/store/{table}', [TablesController::class, 'StoreTable'])
            ->name('admin.tables.store');
        // Delete table
        // Route::post('/admin/tables/{table}/delete', [TablesController::class, 'DeleteTable'])
        //     ->name('admin.tables.delete');
        // Tables Create
        Route::get('/admin/tables/copy/{table}/{id}', [TablesController::class, 'CopyTable'])
            ->name('admin.tables.copy');
        Route::get('/admin/tables/create/{table}', [TablesController::class, 'CreateTable'])
            ->name('admin.tables.create');
        // Tables Index
        Route::get('/admin/tables/', [TablesController::class, 'ListTables'])
            ->name('admin.tables.index');
        // Tables Show
        Route::get("admin/tables/{table}/show",[TablesController::class,"ShowTable"])
            ->name("admin.tables.show");
        Route::get('/tables/sort-data/{name}', [TablesController::class, 'getOptionz'])
            ->name("GetTableOpt");
        // Tables Edit table
        Route::get("/admin/tables/edit/{id}/{table}",[TablesController::class,"EditTables"])
            ->name("admin.tables.edit");
        // Tables Delete
        Route::delete("/admin/tables/delete/{table}/{id}",[TablesController::class,"DeleteTables"])
        ->name("admin.tables.delete");
        // Tables UPDATE
        Route::post("/admin/tables/update/{table}/{id?}",[TablesController::class,"UpdateTable"])
            ->name("admin.table.update");
        // Blogartikel Delete
        Route::delete('/admin/blogs/{blog}', [BlogController::class, 'admin_blog_delete'])
            ->name('admin.blog.delete');

        Route::get("api/get-image-id/{table}/{id}",[TablesController::class,"GetImageId"])
            ->name("api-get-image-id");
        Route::get('/admin', function () {
            return Redirect::route('admin.dashboard');
        })->name('admin.redirect.route');
        Route::get('/hasCreated/{table}',[RightsController::class,"HasCreated"])->name('hasCreated');


        // =======
        // Profile
        // =======
        Route::get('/admin/profile', [DashboardAdminController::class, 'admin_profile'])
            ->name('admin.profile');
        // ==========
        // Api-Tokens
        // ==========
        Route::get('/admin/api_tokens', [DashboardAdminController::class, 'admin_api_tokens_index'])
            ->name('admin.api_tokens.index');


        });


        Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');
        //Route::get('logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout_sfa');
    // ====================
    // APPLICATION EMPLOYEE
    // ====================
    Route::middleware(['is_employee'])->group(function () {
        // Dashboard
        Route::get('/employee/dashboard', [DashboardEmployeeController::class, 'employee_index'])
            ->name('employee.dashboard');
    });

    // ====================
    // APPLICATION CUSTOMER
    // ====================
    Route::middleware(['is_customer'])->group(function () {
        // Dashboard
        Route::get('/customer/dashboard', [DashboardCustomerController::class, 'customer_index'])
            ->name('customer.dashboard');

        });

});
// Comments
Route::delete('/comments/delete/{comment_id}', [CommentController::class,'destroy_comments'])->name("destroy.comments");


// Darkmode Route
Route::post('/toggle-dark-mode', [DarkModeController::class, 'toggle'])->name('toggle-dark-mode');
// Route::post('/get-dark-mode', [ApplicationController::class, 'session_dm'])->name('get-dark-mode');
// Route::get('/api/dark-mode-status', function (Request $request) {
//     return response()->json(['dark_mode' => Session::get('dark_mode', false)]);
// });
Route::get('/api/dark-mode', function () {

    return response()->json(['darkMode' => session('dark_mode', 'dark')]);
});
//
// ==============
// Fallback-Route
// ==============
Route::get('/tables/sort-enum/{table}/{name}', [TablesController::class, 'getOptionz_sel'])
        ->name("GetTableEnum");
Route::get('/act-category/{table}/{id?}', [CategoryController::class, 'index'])
    ->name("ArtAct");
Route::get('/tables/sort-enumis/{table}/{name}', [TablesController::class, 'getOptionz_itemscope'])
        ->name("GetTableItemScope");
Route::fallback(function () {
    return Inertia::render('Homepage/NoPageFound');
});
Route::get("/api/images/{table}/{id}",[TablesController::class,"GetImageUrl"])
            ->name("api-get-image-url");


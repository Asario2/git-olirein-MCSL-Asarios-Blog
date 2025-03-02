<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\NameBindingsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\HandbookController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\GlobalController;
use App\Http\Controllers\DashboardAdminController;
use App\Http\Controllers\DashboardCentralController;
use App\Http\Controllers\DashboardCustomerController;
use App\Http\Controllers\DashboardEmployeeController;
use App\Http\Controllers\ImageUploadController;
use League\CommonMark\CommonMarkConverter;
use App\Http\Controllers\TablesController;
use Laravel\Fortify\TwoFactorAuthenticatable;


GlobalController::SetDomain();
// include __DIR__."/extraroutes.php";
Route::get('/db-check', function () {
    try {
        DB::connection()->getPdo();
        return 'Verbindung erfolgreich! Aktuelle Datenbank: ' . DB::connection()->getDatabaseName();
    } catch (\Exception $e) {
        return 'Fehler: ' . $e->getMessage();
    }
});
Route::get('/namebindings', [NameBindingsController::class, 'RefreshFields'])->name("ColumnFetcher");
Route::post('/upload-image', [ImageUploadController::class, 'upload'])->name('upload.image');


Route::get('/tables/form-data/{table}/{id}', [TablesController::class, 'ExportFields'])
->name("GetTableForm");
// ========
// Homepage
// ========
// Startseite
Route::get('/', [HomeController::class, 'home_index'])->name('home.index');
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
// Liste der Blogartikel
Route::get('/blogs', [HomeController::class, 'home_blog_index'])->name('home.blog.index')->middleware('remember');
// Display Blogartikel
Route::get('/blogs/show/{slug}', [HomeController::class, 'home_blog_show'])->name('home.blog.show');

// Anwendung konnte nicht gefunden werden
Route::get('/home/no_application_found', [HomeController::class, 'home_no_application_found'])
    ->name('home.no_application_found');

// Anwender ist kein Administrator
Route::get('/home/user_is_no_admin', [HomeController::class, 'home_user_is_no_admin'])->name('home.user_is_no_admin');
// Anwender ist kein Mitarbeiter
Route::get('/home/user_is_no_employee', [HomeController::class, 'home_user_is_no_employee'])->name('home.user_is_no_employee');
// Anwender ist kein Kunde
Route::get('/home/user_is_no_customer', [HomeController::class, 'home_user_is_no_customer'])->name('home.user_is_no_customer');

// Mail-Verifizierungs-Signatur ist abgelaufen
Route::get('/home/invalid_signature', [HomeController::class, 'home_invalid_signature'])->name('home.invalid_signature');

Route::get('/pictures', [App\Http\Controllers\PagesController::class, 'ab_images'])->name('images');
Route::get('/pictures/{pic}/',[App\Http\Controllers\PagesController::class, 'ab_images_cat'])->name('pictures');
Route::get('/blogposts', [BlogPostController::class, 'index'])->name('blogposts.index');
Route::get('/devmod', function () {
    // ShowRepo();
    //IMULController::smpix();
     DevMod();
    //  small_images(public_path()."/images/_ab/users");
     // Hauptprogramm
    // $viewsPath = resource_path('views/layouts'); // Pfad zu den Blade-Dateien
    // $publicJsPath = public_path('js');          // Zielordner für JavaScript-Dateien
    // $publicCssPath = public_path('css');        // Zielordner für CSS-Dateien
    // updateBladeFiles($viewsPath, $publicJsPath, $publicCssPath);


    })->name('devmod');
    Route::post('/toggle-darkmode', [App\Http\Controllers\DarkModeController::class, 'toggle'])->name('toggle.darkmode');
    Route::get('tables/{table}/create', [TablesController::class, 'createEntryForm'])->name('tables.create-table');
    Route::post('/comments/store/{table}', [CommentController::class, 'store_alt'])->name('comments.store_alt');
    Route::post('/comments/{table}/{id}', [CommentController::class, 'store'])->name('comments.store');
    Route::get('/{table}/{cat?}#headline_{id}', [PostController::class, 'show'])->name('posts.show');


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
        // Store Table Entry
        Route::post('/admin/tables/store/{table}', [TablesController::class, 'StoreTable'])
            ->name('admin.tables.store');
        // Delete table
        Route::post('/admin/tables/{table}/delete', [TablesController::class, 'DeleteTable'])
            ->name('admin.tables.delete');
        // Tables Create
        Route::get('/admin/tables/create/{table}', [TablesController::class, 'CreateTable'])
            ->name('admin.tables.create');
        // Tables Index
        Route::get('/admin/tables/', [TablesController::class, 'ListTables'])
            ->name('admin.tables.index');
        // Tables Show
        Route::get("admin/tables/show/{table}",[TablesController::class,"ShowTable"])
            ->name("admin.tables.show");
        Route::get('/tables/sort-data/{name}', [TablesController::class, 'getOptionz'])
            ->name("GetTableOpt");
        // Tables Edit table
        Route::get("admin/tables/edit/{id}/{table}",[TablesController::class,"EditTables"])
            ->name("admin.tables.edit");
        // Tables Delete
        Route::delete("admin/tables/delete/{table}/{id}",[TablesController::class,"DeleteTables"])
            ->name("admin.tables.delete");
        // Tables UPDATE
        Route::patch("admin/tables/update/{table}/{id}",[TablesController::class,"UpdateTable"])
            ->name("admin.table.update");
        // Blogartikel Delete
        Route::delete('/admin/blogs/{blog}', [BlogController::class, 'admin_blog_delete'])
            ->name('admin.blog.delete');

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
            Route::get('/admin', function () {
                return Redirect::route('admin.dashboard');
            })->name('admin.redirect');

        });



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
Route::get('/tables/form_data/{table}/{id?}', [TablesController::class, 'ExportFields'])->name("GetTableForm");
// Darkmode Route
Route::post('/toggle-dark-mode', [ApplicationController::class, 'toggleDarkMode'])->name('toggle-dark-mode');
Route::post('/get-dark-mode', [ApplicationController::class, 'session_dm'])->name('get-dark-mode');
Route::get('/api/dark-mode-status', function (Request $request) {
    return response()->json(['dark_mode' => Session::get('dark_mode', false)]);
});
Route::get('/api/dark-mode', function () {
    if($_COOKIE['darkMode'])
    {
        return response()->json(['darkMode' => $_COOKIE['darkMode']]);
    }
    return response()->json(['darkMode' => session('dark_mode', 'dark')]);
});
//
// ==============
// Fallback-Route
// ==============
Route::get("api/images/{table}/{id}",[TablesController::class,"GetImageUrl"])
        ->name("api-get-image-url");
        Route::get("api/get-image-id/{table}/{id}",[TablesController::class,"GetImageId"])
        ->name("api-get-image-id");
Route::fallback(function () {
    return Inertia::render('Homepage/NoPageFound');
});

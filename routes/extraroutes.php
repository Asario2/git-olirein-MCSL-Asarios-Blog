<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\BlogPostController;
use App\Http\Controllers\SecurityController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\GlobalController;
use App\Http\Controllers\WebAuthnController;
use App\Mail\YourMailable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Filesystem\FilesystemServiceProvider;
use App\Http\Controllers\SomeController;
use App\Helpers\MailHelper;
use App\Http\Controllers\PasswordHasherController;
use App\Http\Controllers\IMULController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TablesController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\PrivacyController;
use App\Http\Controllers\CommentController;
// use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\NeuesController;
use App\Http\Controllers\PostController;
// use App\Http\src\PublicKeyCredentialCreationOptions;

// dd(class_exists(PublicKeyCredentialCreationOptions::class));
Route::middleware('auth')->group(function () {
    Route::get('/webauthn/start-registration', [WebAuthnController::class, 'startRegistration']);
    Route::post('/webauthn/complete-registration', [WebAuthnController::class, 'completeRegistration']);
    Route::get('/webauthn/start-authentication', [WebAuthnController::class, 'startAuthentication']);
    Route::post('/webauthn/complete-authentication', [WebAuthnController::class, 'completeAuthentication']);
});
Route::get('/send-test-email', [AdminController::class,'mixed'])->name('mixed');
Route::post('/imul/upload', [IMULController::class, 'upload'])->name('imul.upload');
Route::post('/imul/uploadtable', [IMULController::class, 'ul'])->name('imul.uploadtable');
Route::post('tables/imul/uploadcreate/{id?}', [IMULController::class, 'ul_store'])->name('imul.uploadcreate_alt');
Route::get('/password-hasher', [PasswordHasherController::class, 'index']);
Route::post('/password-hasher', [PasswordHasherController::class, 'index'])->name("pwh");
// Route::get('/verify-email', EmailVerificationPromptController::class)
//      ->middleware('auth')
//      ->name('verification.notice');


Route::post('/imul/uploadcreate/{id?}', [IMULController::class, 'ul_store'])->name('imul.uploadcreate');
// GlobalController::SetDomain();
// Login
Route::middleware(['web'])->group(function () {
//    Route::post('/login', [LoginController::class, 'login']);
});

// Route::post('login', [LoginController::class, 'login']);

// Route::get('/dashboard', function () {
//     \Log::info('Request received on root');
//     return 'Request successful';
// });

// Route::get('/',[App\Http\Controllers\HomeController::class, 'welcome'])->name("welcome");

// require __DIR__.'/auth.php';
// Auth::routes();
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
Route::get('/upd_blog', function () {
// Import_Dump();

// Merge_Tables();
})->name('upd_blog');
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/profil/{id?}', [App\Http\Controllers\ProfileController::class, 'index'])->name('profile.index');
Route::get('/users', [App\Http\Controllers\ProfileController::class, 'userlist'])->name('profile.users');
Route::middleware('auth')->group(function () {
    Route::get('/profile', [App\Http\Controllers\ProfileController::class, 'edit'])->name('profile.edit');

    Route::patch('/profile', [App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
    Route::post('/profile', [App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
    Route::post('/update-im',[App\Http\Controllers\TablesController::class, 'update'])->name('profile.update-im');
    Route::delete('/profile', [App\Http\Controllers\ProfileController::class, 'destroy'])->name('profile.destroy');
    //Route::patch('/profile/updayd', [App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');

    // Route::get('/security/settings', [App\Http\Controllers\SecurityController::class, 'settings'])->name('security.settings');
});
/************
 *
 *
 * subdomain test
 *
 */
// Route::domain('{subdomain}.localhost.de')->group(function () {
//     Route::get('/', function ($subdomain) {
//         \Log::info('Subdomain Route Accessed'); // Test-Log

//         $viewName = $subdomain . '.' . request()->route()->getName();
//         \Log::info($viewName); // Test-Log

//         // Prüfen, ob die View existiert
//         if (view()->exists($viewName)) {
//             return view($viewName);
//         } else {
//             return view("welcome"); // Rückfall, falls die View nicht existiert
//         }
//     })->name('index');
// });

Route::domain('hm.localhost.de')->group(function () {
    Route::get('/admin',  [App\Http\Controllers\AdminController::class, 'start_hm'])->name('admin.index_hm');
    Route::get('/bio',  [App\Http\Controllers\PagesController::class, 'bio_hm'])->name('bio.index');
    Route::get('/kontakt',  [App\Http\Controllers\PagesController::class, 'kontakt_hm'])->name('kontakt.index');
    Route::post('kontakt/senden',  [App\Http\Controllers\PagesController::class, 'kontakt_send'])->name('kontakt.sendmail');
    Route::get('/neues', [App\Http\Controllers\NeuesController::class, 'index'])->name('neues.index');
    Route::get('/start', [App\Http\Controllers\PagesController::class, 'hm_start'])->name("hm.start");
    Route::get('/privacy', [PrivacyController::class, 'showPrivacyPolicy'])->name('privacy.policy');
    Route::get('admin/dashboard', [AdminController::class, 'adminDashboard'])->name('admin.dashboard');
    Route::get('/music', [PagesController::class, 'music_hm'])->name('music');
    Route::get('/',  [App\Http\Controllers\HomeController::class, 'index'])->name('index_hm');
});
Route::get('/',  [App\Http\Controllers\HomeController::class, 'index'])->name('index');

Route::get('/ai', [App\Http\Controllers\PagesController::class, 'ai_ab'])->name('ai.index');
Route::post('/toggle-darkmode', [App\Http\Controllers\DarkModeController::class, 'toggle'])->name('toggle.darkmode');
Route::domain('ab.localhost.de')->group(function () {
    Route::get('/didyouknow', [App\Http\Controllers\PagesController::class, 'DYK'])->name('didyouknow');
    Route::get('/shortpoems', [App\Http\Controllers\PagesController::class, 'ab_sp'])->name('shortpoems');
    Route::get('/pictures', [App\Http\Controllers\PagesController::class, 'ab_images'])->name('images');
    Route::get('/mindblog', [App\Http\Controllers\PagesController::class, 'mb_ab'])->name('mindblog');
    Route::get('/devlog', [App\Http\Controllers\PagesController::class, 'dl_ab'])->name('devlog');
    Route::get('/blogposts', [BlogPostController::class, 'index'])->name('blogposts.index');

    Route::get('/{table}/{cat?}#headline_{id}', [PostController::class, 'show'])->name('posts.show');

});

    Route::get('/posts/load-more', [BlogPostController::class, 'loadMore'])->name('posts.loadMore');
    Route::get('/tables/load-more/{table}', [TablesController::class, 'loadMore'])->name('tables.loadMore');
    Route::get('/comments/load-more/comments', [TablesController::class, 'loadMoreCC'])->name('tables.loadMoreCC');
    Route::get('/posts/load-more/{table}', [TablesController::class, 'com_loadMore'])->name('comments.loadMore');
    Route::get('/pictures/load-more/{tid}', [PagesController::class, 'im_loadMore'])->name('images.loadMore');
// routes/web.php
Route::get('/shariff-backend', function () {
    // Diese Route holt sich die Share-Daten für eine gegebene URL (in diesem Fall für den Post)
    $url = request('url'); // Holen der URL aus der Anfrage

    // Hier werden die Klickzahlen simuliert – du kannst sie aber von deinem Backend oder einer API holen
    $shares = [
        'twitter' => rand(50, 500),  // Zufällige Zahlen für das Beispiel
        'facebook' => rand(50, 500),
        'telegram' => rand(50, 500),
        'xing' => rand(50, 500),
        "info" => rand(50,500),

    ];

    return response()->json($shares);
});
Route::post('/update-status/{table}/{name}/{id}/{value}', [FormController::class, 'updateStatus'])->name('update.status');
Route::post('/update-selectable', [FormController::class, 'updateSelectable'])->name('update.select');


    Route::get('/pictures/{pic}/',[App\Http\Controllers\PagesController::class, 'ab_images_cat'])->name('pictures');
// Andere Subdomain- oder Standardrouten
// Route::domain('{subdomain}.localhost.de')->group(function () {
//     // Route::get('/admin', [App\Http\Controllers\AdminController::class, 'start'])->name('admin.index');
// });
// Route::domain('{subdomain}.localhost.de')->group(function () {
//     Route::get('/admin', [AdminController::class, 'admin_domain'])->name('admin.index');
// });
// Route::domain('{subdomain}.localhost.de')->group(function () {
//     Route::get('/admin', function ($subdomain) {
//         // Prüfen, ob die Subdomain 'ab' ist oder nicht 'hm'
//         if ($subdomain === 'ab' || $subdomain !== 'hm') {
//             $AdminController = NEW AdminController();
//             return $AdminController->start($subdomain);
//         } else {
//         Route::domain('{subdomain}.localhost.de')->group(function () {
//         Route::get('/admin', [AdminController::class, 'admins_domain'])->name('admin.index_alt');
//         });
//         }
//     })->name('admin.index');
// });
// Route::domain('{subdomain}.localhost.de')->group(function () {
//     Route::get('/admin', [AdminController::class, 'index3']);
// });


Route::post('/tables/update-order', [AdminController::class, 'updateOrder'])->name('tables.updateOrder');
Route::get('log-viewer', [LogViewerController::class, 'index'])->name('log-viewer');
Route::get('/privacy', [PrivacyController::class, 'showPrivacyPolicy'])->name('privacy.policy');
Route::prefix('admin')->group(function() {

    // Route::get('tables', [AdminController::class, 'manageTables'])->name('admin.context.index');
    Route::get('tables', [AdminController::class, 'manageTables'])->name('admin.tables.index');
    Route::get('/CommentsCenter', [TablesController::class, 'CCindex'])->name('tables.CC');
    Route::get('tables/create', [AdminController::class, 'createTable'])->name('admin.tables.create');
    Route::post('tables', [AdminController::class, 'storeTable'])->name('admin.tables.store');
    Route::get('tables/{id}/edit', [AdminController::class, 'editTable'])->name('admin.tables.edit');
    Route::put('tables/{id}', [AdminController::class, 'updateTable'])->name('admin.tables.update');
    Route::delete('tables/{id}', [AdminController::class, 'deleteTable'])->name('admin.tables.delete');
    Route::get('/rights/{id?}', [AdminController::class, 'showRightsTable'])->name('admin.rightsTable');
    Route::get('/', [AdminController::class, 'start_hm'])->name('admin.index');
    Route::post('/update-rights/{id}', [AdminController::class, 'updateRights'])->name('admin.updateRights');
    Route::delete('/store-rights', [AdminController::class, 'storeRights'])->name('admin.storeRights');
    Route::post('/remove-right', [AdminController::class, 'removeRight'])->name('admin.removeRight');
    Route::post('/add-right', [AdminController::class, 'addCustomRight'])->name('admin.addCustomRight');
    Route::get('/add-right', [AdminController::class, 'addCustomRightForm'])->name('admin.addCustomRightForm');


});
Route::get('/no-rights', [TablesController::class, 'no_view'])->name('tables.noview');
Route::get('admin/dashboard', [AdminController::class, 'adminDashboard_ab'])->name('admin.dashboard_ab');

Route::get('/comments/{post_id}', [CommentController::class, 'fetchComments'])->name('comments.fetch');

Route::middleware('auth')->group(function () {
    /**
     *
     * Tables Routes
     *
     */
    Route::post('save-ugroups/', [FormController::class, 'save_ugroup'])->name('save.ugroup');
    Route::post('/tables/subpub/{id}', [AdminController::class, 'refresh_pub'])->name('admin.refresh_pub');
    Route::post('/comments/{table}/{id}', [CommentController::class, 'store'])->name('comments.store');
    // Route::get('tables_con', [TablesController::class, 'index'])->name('tables.index');
    // Route::get('tables_con/{id}/edit', [TableController::class, 'edit'])->name('tables.edit');
    Route::get('tables/', [TablesController::class, 'index2'])->name('tables.index2');
    // Route::get('tables/create_alt', [TablesController::class, 'createEntry'])->name('tables.create-table');
    Route::post('/change-date', [FormController::class, 'changeDate'])->name('change_date');
    Route::post('store_table', [TablesController::class, 'store'])->name('tables.store');
    Route::post('/update-table', [TablesController::class, 'updateTable'])->name('table.updatez');
    Route::post('/admin_table/update-positions', [FormController::class, 'updatePositionsFC'])->name("upda_posi");
    Route::post('/updayd_position', [FormController::class, 'updateOrderFC'])->name("update_posi");
    Route::get('/tables/xiupdate/{table}/{name}/{id}/{value}', [TablesController::class, 'xiupdate'])->name("xiupdate");
    Route::post('/update-text', [FormController::class, 'updateText'])->name('update.text');
    Route::post('/update-age', [FormController::class, 'updateAge'])->name('update.age');
    Route::post('/update-datetime', [FormController::class, 'updateDatetime'])->name('update.datetime');
    Route::post('/comments/store/{table}', [CommentController::class, 'store_alt'])->name('comments.store_alt');
    Route::post("/imageratings", [CommentController::class, 'store_rating'])->name('comments.ratings');

    Route::delete('/comments/delete/{postid}/{comment_id}/{table?}/{pic?}', [App\Http\Controllers\CommentController::class, 'destroy'])->name('comment.delete');
    Route::get('tables/{table}/create', [TablesController::class, 'createEntryForm'])->name('tables.create-table');


    Route::post ('tables/{table}/store', [TablesController::class, 'store'])->name('tables.store');

    Route::get('/tables/{table}', [TablesController::class, 'index'])->name('tables.index');
    Route::get('/tables/{table}/edit/{id}', [TablesController::class, 'edit'])->name('tables.edit');
    Route::post('/tables/{table}/edit/{id}', [TablesController::class, 'update'])->name('tables.update');
    Route::delete('/table/{table}/delete/{id}', [TablesController::class, 'destroy'])->name('tables.destroy');
    Route::put('/blogposts/{id}/updayd', [App\Http\Controllers\BlogPostController::class, 'update'])->name('blogposts.updayd');
    Route::post('/table/sel_update', [TablesController::class, 'sel_update'])->name('table.sel_update');



    // Route::get('/security', [App\Http\Controllers\SecurityController::class, 'index'])->name('security.settings');
    // Route::post('/security/toggle-2fa', [App\Http\Controllers\SecurityController::class, 'toggle2FA'])->name('security.toggle2fa');
    // Route::post('/security/update-password', [App\Http\Controllers\SecurityController::class, 'updatePassword'])->name('security.update.password');
    // Route::post('/security/update-email', [App\Http\Controllers\SecurityController::class, 'updateEmail'])->name('security.update.email');
    // Route::get('/security/confirm-email-change/{token}', [App\Http\Controllers\SecurityController::class, 'confirmEmailChange'])->name('confirm.email.change');
    // Route::get('/security/settings', [App\Http\Controllers\SecurityController::class, 'index'])->name('security.settings');
    // Route::post('/security/enable2FA', [App\Http\Controllers\SecurityController::class, 'enable2FA'])->name('security.enable2FA');
    // Route::post('/security/verify2FA', [App\Http\Controllers\SecurityController::class, 'verify2FA'])->name('security.verify2FA');
    // Route::post('/security/disable2fa', [App\Http\Controllers\SecurityController::class, 'disablef2a'])->name('security.disable2fa');
    // Route::post('/security/toggle-2fa', [App\Http\Controllers\SecurityController::class, 'toggle2FA'])->name('security.toggle2fa');
    Route::get('/security', [App\Http\Controllers\SecurityController::class, 'index'])->name('security.settings');

    Route::post('/security/update-password', [App\Http\Controllers\SecurityController::class, 'updatePassword'])->name('security.update.password');
    Route::post('/security/update-email', [App\Http\Controllers\SecurityController::class, 'updateEmail'])->name('security.update.email');
    Route::get('/security/confirm-email-change/{token}', [App\Http\Controllers\SecurityController::class, 'confirmEmailChange'])->name('confirm.email.change');

    Route::get('/security/confirm-email-change/', [App\Http\Controllers\SecurityController::class, 'confirmEmailChange'])->name('confirm.email.change');
    Route::get('/security/settings', [App\Http\Controllers\SecurityController::class, 'index'])->name('security.settings');
    Route::post('/security/enable2FA', [App\Http\Controllers\SecurityController::class, 'enable2FA'])->name('security.enable2FA');
    Route::post('/security/verify2FA', [App\Http\Controllers\SecurityController::class, 'verify2FA'])->name('security.verify2FA');
    Route::post('/security/disable2fa', [App\Http\Controllers\SecurityController::class, 'disable2FA'])->name('security.disable2fa');
    /**
    * routes for blogpost update
    */
    Route::get('/blogposts/{id}/edit', [BlogPostController::class, 'edit'])->name('blogposts.edit');

    // Route für das Aktualisieren eines Blogposts

    Route::put('/blogposts/{id}', [BlogPostController::class, 'update'])->name('blogposts.update');
    Route::delete('/blogposts/{id}', [BlogPostController::class, 'destroy'])->name('blogposts.destroy');


});


Route::get('/comments/fetch/{table}', [CommentController::class, 'fetchComments_alt'])->name('comments.fetch_alt');
Route::get('/comments/load/{postId}', [CommentController::class, 'com_loadMore'])->name('comments.loader');
Route::get('/hallo-welt/{name?}',[App\Http\Controllers\HalloWeltController::class, 'Hallo'])->name('hallo-welt');



Route::middleware(['auth'])->group(function () {
    Route::get('/blogposts/create', [App\Http\Controllers\BlogPostController::class, 'create'])->name('blogposts.create');
    Route::post('/blogposts', [App\Http\Controllers\BlogPostController::class, 'store'])->name('blogposts.store');
    Route::get('/webauthn/register/start', [WebAuthnController::class, 'startRegistration']);
    Route::post('/webauthn/register/finish', [WebAuthnController::class, 'finishRegistration']);

    // Authentifizierung
    Route::get('/webauthn/authenticate/start', [WebAuthnController::class, 'startAuthentication']);
    Route::post('/webauthn/authenticate/finish', [WebAuthnController::class, 'finishAuthentication']);

    // Schlüssel-Management
    Route::get('/webauthn/keys', [WebAuthnController::class, 'listKeys']);
    Route::delete('/webauthn/keys/{key}', [WebAuthnController::class, 'deleteKey']);
});

 Route::get('/blogposts', [App\Http\Controllers\BlogPostController::class, 'index'])->name('blogposts.index');
 Route::get('/blog_posts', [App\Http\Controllers\BlogPostController::class, 'index'])->name('blog_posts');
 Route::get('/newhallo', function(){
    return view('newhallo'); })->name('newhallo.index');

Route::get('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');



//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');





Route::fallback(function (){
    return view("posts.404");})->name('404');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/two-factor', [App\Http\Controllers\Auth\LoginController::class, 'showTwoFactorForm'])->name('auth.two-factor');
Route::post('/two-factor', [App\Http\Controllers\Auth\LoginController::class, 'verifyTwoFactor'])->name('auth.verify.two-factor');


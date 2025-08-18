    <?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    use App\Helpers;

    $subdomain = SD(); // z.B. "foo", "bar"
    $pagen = SD("pn");
    $favicon = "/images/_{$subdomain}/web/alogo.png";
    $ahost = $_SERVER['HTTP_HOST'];

    // Fallback, falls Datei nicht existiert
    if (!file_exists(public_path($favicon))) {
        $favicon = "/images/favicon_default.png";
    }
    // $sd_alt = SD('ASd');
    ?>
    <!DOCTYPE html>
    <html lang="{{ str_replace('_', '-', app()->getLocale()) }}">



    <head>
        <meta charset="utf-8">
        <script>
            if (typeof global === 'undefined') {
                window.global = window;
            }
           window.Laravel = {
                    userId: {{ auth()->id() ?? 'null' }},
                };
                window.subdomain = "{{ $subdomain }}";
                window.subdomain_alt = "{{ $sd_alt }}";
                window.pagename = "{{ $pagen }}";
                window.ahost = "{{ $ahost }}";
                </script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title inertia>{{ config('app.name', 'MCSL') }}</title>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <script src="/js/users.js"></script>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link href="/css/app.css" rel="stylesheet">
        <link href="/css/tailw/extra.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
                    
        {{-- <script src="/js/app.js"></script> --}}
        {{-- <script src="/js/users.js"></script> --}}
        <link rel="icon" type="image/png" href="{{ $favicon }}">

        <link href="/css/app.css?time={{time()}}" rel="stylesheet">

        {{-- <link href="{{ mix('resources/css/app.css') }}" rel="stylesheet"> --}}





        <!-- Shariff JavaScript (über CDN) -->
        {{-- <script src="/js/shariff.min.js"></script> --}}
        <link rel="stylesheet" href="/Shariff/shariff.complete.css">
        <script src="/Shariff/shariff.min.js"></script>
        @routes
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        <link href="/css/tailw/{{$sd_alt}}.css?time={{time()}}" rel="stylesheet">
        @inertiaHead
        <!-- additional Scripts -->
        {{-- <script src="{{ mix('resources/js/user.js') }}"></script> --}}
        <!-- https://github.com/whitecube/laravel-cookie-consent -->
        @cookieconsentscripts
    </head>

    <body class="font-sans antialiased">
        <input type="hidden" id="token" value="{{ csrf_token() }}">

        @routes
        @inertia

        <!-- https://github.com/whitecube/laravel-cookie-consent -->
        @cookieconsentview
    </body>

    </html>



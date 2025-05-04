    <?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    ?>
    <!DOCTYPE html>
    <html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title inertia>{{ config('app.name', 'Laravel') }}</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link href="/css/shariff-complete.css" rel="stylesheet">
        <link href="/css/app.css" rel="stylesheet">
        <script src="/js/jquery-3.6.0.min.js"></script>

        <!-- Shariff JavaScript (über CDN) -->
        <script src="/js/shariff.min.js"></script>
        <script>
        if (typeof global === 'undefined') {
    window.global = window;
    }

        </script>

        @routes
        @vite('resources/js/app.js')
        @inertiaHead
        <!-- additional Scripts -->
        <script src="{{ mix('resources/js/user.js') }}"></script>
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



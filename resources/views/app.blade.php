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

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @routes
    @vite(['resources/js/app.js', "resources/js/Application/{$page['component']}.vue"])
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

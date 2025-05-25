<!DOCTYPE html>
<html>
<head>
    <title>{{ $subject ?? 'Default Subject' }}</title>
</head>
<body>
    <div style="padding: 20px; font-family: Arial, sans-serif;">
        <header style="border-bottom: 1px solid #ddd; padding-bottom: 10px;">
            <h1>{{ config('app.name') }}</h1>
        </header>

        @yield('content')

        <footer style="margin-top: 20px; font-size: 12px; color: #777;">
            <p>&copy; {{ date('Y') }} {{ config('app.name') }}</p>
        </footer>
    </div>
</body>
</html>

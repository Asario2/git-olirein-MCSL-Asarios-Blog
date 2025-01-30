<?php

use Illuminate\Http\Request;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Routing\Exceptions\InvalidSignatureException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->web(append: [
            \App\Http\Middleware\HandleInertiaRequests::class,
            \Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets::class,
        ]);
        //
        $middleware->alias([
            'remember' => \Reinink\RememberQueryStrings::class,
            'is_admin' => \App\Http\Middleware\UserIsAdmin::class,
            'is_employee' => \App\Http\Middleware\UserIsEmployee::class,
            'is_customer' => \App\Http\Middleware\UserIsCustomer::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
        $exceptions->render(function (InvalidSignatureException $e, Request $request) {
            return redirect()->intended(route('home.invalid_signature'));
        });
    })->create();

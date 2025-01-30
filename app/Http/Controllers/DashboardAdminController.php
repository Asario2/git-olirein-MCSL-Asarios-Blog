<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Illuminate\Http\Request;
use Laravel\Jetstream\Jetstream;

class DashboardAdminController extends Controller
{
    public function admin_index()
    {
        return Inertia::render('Admin/Dashboard');
    }

    public function admin_profile(Request $request)
    {
        return Inertia::render('Admin/Profile', [
            'confirmsTwoFactorAuthentication' => auth()->user()->confirmsTwoFactorAuthentication,
            'sessions' => ApplicationController::sessions($request)->all(),
        ]);
    }
    //
    public function admin_api_tokens_index(Request $request)
    {
        return Jetstream::inertia()->render($request, 'Admin/ApiTokenManager', [
            'tokens' => $request->user()->tokens->map(function ($token) {
                return $token->toArray() + [
                    'last_used_ago' => optional($token->last_used_at)->diffForHumans(),
                ];
            }),
            'availablePermissions' => Jetstream::$permissions,
            'defaultPermissions' => Jetstream::$defaultPermissions,
        ]);
    }
}

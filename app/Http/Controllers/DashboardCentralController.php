<?php

namespace App\Http\Controllers;

use Inertia\Inertia;


class DashboardCentralController extends Controller
{
    public function central_index()
    {
        //
        return Inertia::render('Home/CentralDashboard');
    }
}

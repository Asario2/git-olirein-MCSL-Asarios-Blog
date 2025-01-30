<?php

namespace App\Http\Controllers;

use Inertia\Inertia;


class DashboardEmployeeController extends Controller
{
    public function employee_index()
    {
        return Inertia::render('Employee/Dashboard');
    }
}

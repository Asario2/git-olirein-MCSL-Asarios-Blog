<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class DashboardCustomerController extends Controller
{
    public function customer_index()
    {
        return Inertia::render('Customer/Dashboard');
    }
}

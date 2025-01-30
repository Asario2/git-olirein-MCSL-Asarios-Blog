<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;


class HandbookController extends Controller
{
    public function admin_handbook(Request $request)
    {
        //
        return File::get(public_path() . '/handbook_admin/index.html');
    }

}

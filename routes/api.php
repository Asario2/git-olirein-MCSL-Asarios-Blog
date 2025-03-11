<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormController;
use App\Http\Controllers\TablesController;




Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


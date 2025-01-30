<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FormController;
use App\Http\Controllers\TablesController;

Route::get('/tables/form-data/{table}/{id?}', [TablesController::class, 'ExportFields'])->name("GetTableForm");
Route::get('/tables/form_data/{table}/{id?}', [TablesController::class, 'ExportFields'])->name("GetTableForm");
Route::get("api/table-rows", [TablesController::class, 'GetTables'])->name("Api.Get.Tables");

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::get("api/table-rows", [TablesController::class, 'GetTables'])->name("Api.Get.Tables");

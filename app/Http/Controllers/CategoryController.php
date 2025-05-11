<?php
namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class CategoryController extends Controller {
    public function index($table,$id='0') {
        $res = DB::table($table)->where("id",$id)->select("categorie_id","type_id")->first();
        if($res)
        {
            $selectedCategoryId = $res->categorie_id;
            $selectedMediumId = $res->type_id;
        }

        return response()->json([
            'categories' => Category::with('types')->get(),
            'selected_categorie_id' => @$selectedCategoryId ?? null,
            'selected_medium_id' => @$selectedMediumId ?? null,
        ]);
    }
}

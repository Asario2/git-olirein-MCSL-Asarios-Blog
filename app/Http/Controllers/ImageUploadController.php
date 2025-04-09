<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Settings;
use Illuminate\Http\Request;
use Storage;

class ImageUploadController extends Controller
{
    public function upload(Request $request,$table)
    {
        // Validierung der Eingabedaten
        // $validated = $request->validate([
        //     'image' => 'image|mimes:jpeg,png,jpg,gif',
        //     'table' => 'string',
        //     'column' => 'string',
        //     'path' => 'string',
        //     'name' => "string"
        // ]);

        // Das hochgeladene Bild holen
        $image = $request->file('image');

        if (!$request->hasFile('image')) {
           // \Log::info('Keine Datei empfangen!');
            return response()->json(['error' => 'Keine Datei empfangen!'], 400);
        }
        else{
             //\Log::info("Table: ".json_encode($request->table));
        }
        //\Log::info('Datei-Info:', [
       //     'original_name' => $image->getClientOriginalName(),
         //   'mime_type' => $image->getMimeType(),
           // 'size' => $image->getSize()
       // ]);
        $image = $request->file('image') ?? [];
        $path = $request->path;
//$table_dir = Settings::image_paths[$request->table];
        $table = $request->table;
        $column = $request->column;
        $Message = @$request->Message;

        // Den Dateinamen generieren und Bild speichern
        $imageName = md5($image->getClientOriginalName()."_".Auth::id()).".".$image->getClientOriginalExtension();
        //$imagePath = $image->storeAs($path, $imageName, 'public');

        $filename = $imageName;
        // Speicherpfad definieren
        $sizes = [1200];
        $tmpname = $_FILES['image']['tmp_name'];
       if(!$Message){
        $IMOpath =  public_path("images/{$table}/orig/{$filename}");

        copy($tmpname,$IMOpath);

        $sizes = [350, 800, 1400];
        }

        else{
            $table = "messages";
            // $prepath = "/images/messages/";
        }
        list($oldsize,$oldheight) = getimagesize($tmpname);

        // Bildgrößen anpassen und speichern
          // Beispiel für 3 verschiedene Auflösungen
        $big = ["350"=>"/thumbs/","1200"=>'/',"800"=>'/',"1400"=>"/big/"];
        foreach ($sizes as $size) {
            if($size > $oldsize)
            {
                $size2 = $oldsize;
            }
            else{
                $size2 = $size;
            }
            // Neues Imagick-Objekt erstellen
            $imagick = new \Imagick();
            $imagick->readImage($image->getPathname());

            // Bildgröße anpassen
            $imagick->resizeImage($size2, 0, \Imagick::FILTER_LANCZOS, 1); // 0 für automatische Höhe

            // Speicherpfad für jede Version
            $resizedPath = "images/{$table}{$big[$size]}{$imageName}";

            // Bild speichern
            $imagick->writeImage($resizedPath);
            if($size == 1400 || $Message)
            {
                list($width,$height) = getimagesize($resizedPath);
                $imageName = "/".$resizedPath;
            }

            // Speicher freigeben
            $imagick->clear();
            $imagick->destroy();
            $url = "/".str_replace("/big/","/",$resizedPath);
            $name = $request->name;


        }
        \Log::info($imageName);
        // $iid = DB::table($table_dir)->insertGetId([
        //     'name' => $name,
        //     'url' => $url,
        //     'created_at' => now(),
        //     'updated_at' => now(),
        // ]);
        \Log::info(json_encode(['message' => $imageName]));
        return response()->json([
            'message' => 'Bild erfolgreich hochgeladen.',
            'image_url' => $imageName,
            "img_x" => $width,
            "img_y" => $height,
        ]);
    }
    public function save(Request $request,$table)
    {
        \Log::info("resa:".$table);

    }
}

<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Settings;
use Illuminate\Http\Request;
use Storage;

class ImageUploadController extends Controller
{
    public function upload_ori(Request $request,$table,$iswatermark="1")
    {
        return $this->upload($request,$table,$iswatermark,1);
    }
    public function upload(Request $request,$table,$iswatermark='1',$oripath='0')
    {
        // Validierung der Eingabedaten
        // $validated = $request->validate([
        //     'image' => 'image|mimes:jpeg,png,jpg,gif',
        //     'table' => 'string',
        //     'column' => 'string',
        //     'path' => 'string',
        //     'name' => "string"
        // ]);
            // \Log::info($request->all());
        // Das hochgeladene Bild holen
        $image = $request->file('image');
        $Message = $request->Message === "true" ? true : false;
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
//$table_dir = Settings::$image_paths[$request->table];
        $watermarkfile = $request->copyleft;
        // \Log::info("WMF: ".$watermarkfile);
        $table = $table_ori = $request->table;
        $column = $request->column;

            // \Log::info(($Message));

        // Den Dateinamen generieren und Bild speichern
        $imageName = md5($image->getClientOriginalName()."_".Auth::id()).".".$image->getClientOriginalExtension();
        //$imagePath = $image->storeAs($path, $imageName, 'public');

        $filename = $imageName;
        // Speicherpfad definieren
        $sizes = [1200];
        $tmpname = $_FILES['image']['tmp_name'];
       if(!$Message && !array_key_exists($table, Settings::$impath)){
        $IMOpath =  public_path("images/{$table}/orig/{$filename}");

        copy($tmpname,$IMOpath);

        $sizes = [350, 800, 1400];
        }
        elseif($Message)
        {
            $table = "messages";
            // $prepath = "/images/messages/";
        }
        if(array_key_exists($table_ori, Settings::$impath)){
            $sizes = ["500"];
            $table = 'profile-photos';
        }
        list($oldsize,$oldheight) = getimagesize($tmpname);

        // Bildgrößen anpassen und speichern
          // Beispiel für 3 verschiedene Auflösungen
        $big = ["350"=>"/thumbs/","1200"=>'/','500'=>"/","800"=>'/',"1400"=>"/big/"];
        foreach ($sizes as $size) {

            if($size > $oldsize)
            {
                $size2 = $oldsize;
            }
            else{

                $size2 = $size;
            }
            $resizedPath = "images/{$request->table}{$big[$size]}{$imageName}";
            if(!$oripath)
            {
                $subdomain = SD();
                $resizedPath = "images/{$subdomain}/{$table}{$big[$size]}{$imageName}";
            }

            // \Log::info("RP:".$resizedPath);
            // Neues Imagick-Objekt erstellen
            $imagick = new \Imagick();
            $imagick->readImage($image->getPathname());

            // Bildgröße anpassen
            $imagick->resizeImage($size2, 0, \Imagick::FILTER_LANCZOS, 1); // 0 für automatische Höhe

            // Speicherpfad für jede Version
            if($iswatermark && $big[$size] != "/thumbs/" && !empty($watermarkfile) && !$Message)
            {
                $imagePath = $tmpname;
                $watermarkPath = public_path("images/copyleft/".$watermarkfile.".png");

                // Neues ImageMagick-Objekt erstellen
                $imagick = new \Imagick($imagePath);
                $imagick->resizeImage($size2, 0, \Imagick::FILTER_LANCZOS, 1); // 0 für automatische Höhe
                // Wasserzeichenbild laden
                $watermark = new \Imagick($watermarkPath);

                // Berechne die Position des Wasserzeichens: rechte untere Ecke
                $xPosition = $imagick->getImageWidth() - $watermark->getImageWidth() - 10; // 10px Abstand vom Rand
                $yPosition = $imagick->getImageHeight() - $watermark->getImageHeight() - 10; // 10px Abstand vom Rand

                // Setze das Wasserzeichen auf das Bild
                $imagick->compositeImage($watermark, \Imagick::COMPOSITE_OVER, $xPosition, $yPosition);

                // Speichern des neuen Bildes mit Wasserzeichen
                $imagick->writeImage($resizedPath);
            }
            else{
                $imagick->writeImage($resizedPath);
            }
            // Bild speichern

            if($size == 1400 || $Message || $size == "500")
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
        if($Message){
            $imageName = ($imageName);
            // \Log::info($Message);
        }

        // $iid = DB::table($table_dir)->insertGetId([
        //     'name' => $name,
        //     'url' => $url,
        //     'created_at' => now(),
        //     'updated_at' => now(),
        // ]);
        //\Log::info(json_encode(['message' => $imageName]));
        return response()->json([
            'message' => 'Bild erfolgreich hochgeladen.',
            'image_url' => $imageName,
            "img_x" => $width,
            "img_y" => $height,
        ]);
    }
    public function save(Request $request,$table)
    {
        // \Log::info("resa:".$table);

    }
    public function CopyLeft()
    {
        $cl = DB::table('copyleft')->select('tag', 'name')->get();
        return response()->json([
            'message' => 'Copyleft Success',
            'copyleft' => $cl,
        ]);

    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{
    // Definiere hier deine Konstanten oder statischen Variablen
    const excl_cols = ['updated_at', 'published_at','password','remember_token','email_verified_at','google2fa_secret','is_two_factor_authenticated','two_factor_authenticated',
                       'two_factor_enabled','reserved_at','available_at','is_two_factor_enabled','temp_google2fa_secret','new_email','email_change_token','email_verification_token','two_factor_token',"author_name","users_rights_id","chg_date","xico_doms",'xkis_IsFeed','xis_mailed'];
    const excl_heads = ["date_begin"];
    const excl_disabled = ['id'];
    const excl_datefields  = ['birthday','created_at'];
    const exl = ["title"=>"Titel","content_en"=>"Text Englisch","blog_categories_id"=>"Kategorie",'title_en'=>"Titel Englisch",'users_id'=>"Autor","moderator_id"=>"Moderator","images_categories_id"=>"Bildergruppe","to_address"=>'Empfängeradresse','subject'=>'Betreff','pub'=>"Öffentlich",
                 'view_table'=>'Sichtbar','add_table'=>'Hinzufügen','publish_table'=>'Veröffentlichen','date_table'=>"Datum Ändern",'delete_table'=>"Löschen",'edit_table'=>"Editieren","content"=>"Text","xis_ai"=>"KI Bild","summary"=>"Zusammenfassung",
                 "blog_authors_id"=>"Autor",'date_end'=>"Online Von/Bis",'post_id'=>"Post ID",'categories_id'=>"Kategorie",'xis_IsSaleable'=>"Verkäuflich",'xkis_Ticker'=>"Ticker Aktivieren","created_at"=>'Erstellt am:','headline'=>'Überschrift','headline_en'=>'Überschrift Englisch',
                 "answer"=>"Antwort","date"=>"Datum",'birthday' => 'Alter','occupation'=>'Beschäftigung',"interests"=>"Hobbys","music"=>'Musik','prename'=>"Vorname",'id'=>'ID','image_path'=>"Bild","email"=>'Email',
                 'name'=>"Name",'xis_aiImage'=>"Bild mit KI erstellt","blog_date" => "Öffentlich ab:","slug" => "URL","reading_time" => "Lesezeit","markdown_on" => "Markdown verwendet","blog_images_iid" => "Bildupload","updated_at" => "Letzte Änderung","first_name" => "Vorname","nick_name" => "Nickame","email_verified_at" => "Email bestätigt","password" =>
"Passwort","users_rights_id" => "Benutzergruppe","profile_photo_path" => "Profilbild","is_admin" => "Administrator","is_employee" => "Mitarbeiter","is_customer" => "Kunde","admin_id" => "Admin ID","company_id" => "Firmen ID","customer_id" => "Kunden ID","last_login_at" =>
"Letzter Login","two_factor_secret" => "2fa Secret","two_factor_recovery_codes" => "2fa Recovery Codes","two_factor_confirmed_at" => "2fa bestätigt am","remember_token" => "Login merken","position" => "Position","shortname" => "Kurzname","xkis_AdminPanel" => "AdminPanel Zugriff","xkis_UserRights" =>
"Benutzergruppen Zugriff","xkis_SendMail" => "Email Senden","xkis_SandMail" => "Email Senden","xkis_CommentsCenter" => "Commentscenter","author_id" => "Autor","chg_date" => "Geändert am:","table_name" => "Tabellenname","description" => "Beschreibung","modul" => "Modul","published_at" => "Veröffentlicht am:","name_en" =>
"Name Englisch","heading_alt" => "Überschrift","heading_alt_en" => "Überschrift Englisch","img_icon" => "Icon","AscName" => "Name","AscName_en" => "Name","description_en" => "Beschreibung Englisch","itemscope" => "ItemScope","xis_shopable" => "Verkäuflich","images_categories_id" => "Bilder Kategorie","status" =>
"Status","message" => "Text","message_en" => "Text","camera_id" => "Kamera","link" => "Link","Format" => "Format","Format_en" => "Format Englisch","preis" => "Preis","tablename" => "Tabelle","xis_checked" => "checked","ordering" => "Position","Longname" => "Langer Name","Mpixel" =>
"Megapixel","short_tag" => "Tag","exif_copyright" => "Exif copy","exif_comp" => "exif Comp","exif_model" => "Exif Model"];

    const no_req = ['modul','image_path','link','format','preis','format_en','music','interests','occupation','birthday','prename','xis_ai','id_new','exif_comp','exif_model'];
    const big_thumb = ["users","blog_posts","images"];
    const int_date_tables = ["didyouknow"];
    const textfield = "Mdown"; // Mdown / HTML
    const image_sizes =
    [
        'blog_posts' => [
            'big' => 1205,
            'thumbs' => 350,
            'default' => 700
        ],
        'default' => [
            'big' => 1205,
            'thumbs' => 350,
            'default' => 700
        ],
        'images' => [
            'big' => 5200,
            'thumbs' => 450,
            'default' => 2440
        ]
    ];
    const image_paths = ["blogs"=>"blog_images"];
    const copyright_tables = ["images"];
    const copyright_marker =
    [
        "asario"=>[
            "images"=>"image_path",

        ],
        "liri"=>[
            "images"=>"image_path"
        ],
        "rob"=>
        [
            "images"=>"image_path"
        ],
        "iano"=>
        [
            "images"=>"image_path"
        ],
        "nitro"=>
        [
            "images"=>"image_path"
        ],
        "mazi"=>
        [
            "images"=>"image_path"
        ]

    ];
    const headline =
    [
        "admin_table" => 'table_name',
        "blogs" => 'title',
        "blog_authors" => 'name',
        "blog_categories" => 'name',
        "blog_images" => 'name',
        "images"=>'headline',
        "comments" => 'content',
        "didyouknow" => 'headline',
        "users" => 'name',
        "users_rights" => 'name',
        "camera"=>"name",
        "testfield"=>"title",

];
const searchFields =
    [
        "admin_table" => ['table_name'],
        "blogs" => ['title','content'/*'content_en','title_en'*/],
        "blog_authors" => ['name'],
        "blog_categories" => ['name',"summary"],
        "blog_images" => ['name'],
        "images"=> ['headline',"message"],
        "comments" => ['content'],
        "didyouknow" => ['headline'],
        "users" => ['name'],
        "users_rights" => ['name'],
        "camera" => ['name'],
        "testfield" => ['title'.'content'],

];
const othafieldz = [
    // "blogs"=>
];
const otherField = [
'admin_table'=> "description",
'blog_images'=> 'url',
'blogs'=> 'summary',
"blog_categories" => "summary",
"images"=> "message",
"camera"=> "Longname",
'testfield' => "content"
];
}

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
    const exl = ["title"=>"Titel","content_en"=>"Text Englisch","blog_category_id"=>"Kategorie",'title_en'=>"Titel Englisch",'users_id'=>"Autor","moderator_id"=>"Moderator","images_cat_id"=>"Bildergruppe","to_address"=>'Empfängeradresse','subject'=>'Betreff','pub'=>"Öffentlich",
                 'view_table'=>'Sichtbar','add_table'=>'Hinzufügen','publish_table'=>'Veröffentlichen','date_table'=>"Datum Ändern",'delete_table'=>"Löschen",'edit_table'=>"Editieren","content"=>"Text","xis_ai"=>"KI Bild",
                 "blog_author_id"=>"Autor","summary"=>"Kurzfassung",'date_end'=>"Online Von/Bis",'post_id'=>"Post ID",'categories_id'=>"Kategorie",'xis_IsSaleable'=>"Verkäuflich",'xkis_Ticker'=>"Ticker Aktivieren","created_at"=>'Erstellt am:','headline'=>'Überschrift','headline_en'=>'Überschrift Englisch',"answer"=>"Antwort","date"=>"Datum",'birthday' => 'Alter','occupation'=>'Beschäftigung',"interests"=>"Hobbys","music"=>'Musik','prename'=>"Vorname",'id'=>'ID','image_path'=>"Bild","email"=>'Email','name'=>"Name"];
    const no_req = ['modul','image_path','link','format','preis','format_en','music','interests','occupation','birthday','prename','xis_ai','id_new'];
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
        "camera"=>"name"

];
const searchFields =
    [
        "admin_table" => ['table_name'],
        "blogs" => ['title','content'/*'content_en','title_en'*/],
        "blog_authors" => ['name'],
        "blog_categories" => ['name'],
        "blog_images" => ['name'],
        "images"=> ['headline',"message"],
        "comments" => ['content'],
        "didyouknow" => ['headline'],
        "users" => ['name'],
        "users_rights" => ['name'],
        "camera" => ['name'],

];
const otherField = [
'admin_table'=> "description",
'blog_images'=> 'url',
'blogs'=> 'summary',
"images"=> "message",
"camera"=> "Longname",
];
}

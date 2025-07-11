<?php

namespace App\Helper;

use App\Models\BlogImage;
use App\Models\BlogAuthor;
use App\Models\BlogCategory;
use Stevebauman\Purify\Facades\Purify;

class CustomHelpers
{
    public static function sanitizeHtmlInput(string $input = null)
    {
        $cleanHtml = null;
        //
        $config = ['HTML.Allowed' => 'br,div,p,h1,h2,h3,h4,h5,h5,strong,em,b,i,img[src],img[class],img,img[style],code,a[href],a[target],a[rel],ul,ol,li'];
        //
        if ($input) {
            $cleanHtml = Purify::config($config)->clean($input);
        }
        //
        return $cleanHtml;
    }
    //
    public static function determinePluckBlogAuthors()
    {
        return BlogAuthor::select('id', 'name')
            ->orderBy('name')
            ->pluck('name', 'id');
    }
    //
    public static function determinePluckBlogCategories()
    {
        return BlogCategory::select('id', 'name')
            ->orderBy('name')
            ->pluck('name', 'id');
    }
    //
    public static function determinePluckBlogImages()
    {
        return BlogImage::select('id', 'name', 'url')
            ->orderBy('name')
            ->get();
    }
}

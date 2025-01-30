<?php
use League\CommonMark\CommonMarkConverter;
use League\CommonMark\Environment\Environment;
use League\CommonMark\Extension\CommonMark\CommonMarkCoreExtension;
    if(!function_exists("ucf"))
    {
        function ucf($str)
        {
            $arr = explode("_",$str);

            if(!is_array($arr))
            {
                return ucfirst($str);
            }
            foreach($arr as $val)
            {
                $na[] = ucfirst($val);
            }
            return implode(" ",$na);

        }
    }
    if (!function_exists('KILLMD')) {
    function KILLMD($text,$count='45') {
        // Entferne Markdown (z. B. durch reguläre Ausdrücke)
        $text = preg_replace('/\*\*(.*?)\*\*/', '$1', $text); // Entfernt **bold**
        $text = preg_replace('/\*(.*?)\*/', '$1', $text); // Entfernt *italic*
        $text = preg_replace('/\#\s?(.*)/', '$1', $text); // Entfernt # Überschriften
        $text = preg_replace('/\[(.*?)\]\((.*?)\)/', '$1', $text); // Entfernt Links
        $text = strip_tags($text); // Entfernt HTML-Tags
        return shorter($text,$count);
    }
}
if(!function_exists("shorter"))
{
    function shorter($str,$count)
    {
        $string = iconv('UTF-8', 'ISO-8859-1//TRANSLIT', $str);
        $string = iconv('ISO-8859-1','UTF-8', $string);
        $string = str_replace(array("---","Ã","Ã¶",'Ã"Y','Ã¼','Ã¤',"âEUR¦"),array("<hr>","&szlig;","&ouml;","&szlig;","&uuml;","&auml;",''),$string);
        $str2 = wordwrap($string,$count,"<br />");
        $str3 = explode("<br />",$str2);
        if(@$str3[5 ])
        {
            $hl = "&hellip;";
        }
        $str4 = $str3[0]." ".@$str3[1]." ".@$str3[2]." ".@$str3[3]." ".@$str3[4]." ".@$hl;
        return $str4;
    }
}
if(!function_exists("renderText"))
{
    function renderText($txt)
    {
        return html_entity_decode(html_entity_decode(smi(htmlentities(nl2br($txt)))));
    }
}

use Illuminate\Database\Query\Builder;
use App\Models\Settings;
if (!Builder::hasMacro('filterdefault')) {
    Builder::macro('filterdefault', function ($filters) {
        if (!empty($filters['search'])) {
            $whvals = @Settings::searchFields[$_GET['table_alt']] ?? []; // Rufe `whvals` korrekt auf
            foreach ($whvals as $whn) {
                $this->orWhere($whn, 'like', '%' . $filters['search'] . '%');
            }
            $this->orWhere("created_at", 'like', '%'.$filters['search']. '%');
        }

        return $this;
    });
}


if(!function_exists("renderMarkdown"))
{
    function renderMarkdown($markdown)
    {
        $markdown_alt = str_replace(array("<br />#") , "<br /> #",$markdown);
        $a = strlen($markdown_alt);
        $b = strlen($markdown);
        // var_dump($a,$b);
        // exit;
        $markdown2 = $markdown_alt;
        $markdown3 = preg_replace_callback('/^(#{1,6})\s+(.*)$/mU', function ($matches) {
            $level = strlen($matches[1]); // Anzahl der # bestimmt die Ebene
            return "<h{$level}>{$matches[2]}</h{$level}>";
        }, $markdown2);
        //$environment->addExtension(new CommonMarkCoreExtension());

        // $converter = new CommonMarkConverter([], $environment);

        $converter = new CommonMarkConverter([
            'html_input' => 'escape', // Option: HTML im Markdown wird behandelt
            'allow_unsafe_links' => false,
        ]);

        return $converter->convertToHtml($markdown3);
    }
}
if(!function_exists("smi"))
{
    function smi($string)
    {
        $string = iconv('UTF-8', 'ISO-8859-1//TRANSLIT', $string);
        $string = iconv('ISO-8859-1','UTF-8', $string);


        // $string = stripslashes($string);

        $string = str_replace("\n", " ", $string);
        $string = str_replace(" #","#",$string);
        $string = renderMarkdown($string);
        $string = str_replace(array("---","Ã","Ã¶",'Ã"Y','Ã¼','Ã¤',"âEUR¦"),array("<hr>","&szlig;","&ouml;","&szlig;","&uuml;","&auml;",''),$string);
        return $string;
    }
}


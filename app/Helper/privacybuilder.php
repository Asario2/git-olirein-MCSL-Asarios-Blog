<?php
use Illuminate\Support\Facades\DB;
define("_frutel_new",null);
if (!function_exists('buildPrivacyText')) {
    function buildPrivacyText()
    {
        include __DIR__."/inc/rinfo_code.php";
        $priv = DB::table("privacy")->orderBy("ordering","DESC")->Where("xico_doms","mfx_mcsl")->get();
            foreach($priv as  $key=>$val)
            {
                $msg = rinfo_code($val->message);
                $head = "<h2>".$val->headline."</h2>";
                $txt[] = $head.$msg;
            }
        echo implode("",$txt);
    }
}





<?php

define("_frutel_new",null);
include "./rinfo_code.php";
use Illuminate\Support\Facades\DB;
$priv = DB::table("pivacy")->Where("xico_doms","ab_mcsl");
foreach($priv as  $key=>$val)
{
    $msg = rinfo_code($val['message']);
    $head = "<h2>".$val['headline']."</h2>";
    $txt[] = $head.$msg;
}
echo implode("",$txt);

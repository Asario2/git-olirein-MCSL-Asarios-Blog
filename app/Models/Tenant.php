<?php
// app/Models/Tenant.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tenant extends Model {
    protected $table = "tenant";
    protected $fillable = ['subdomain', 'database'];
}


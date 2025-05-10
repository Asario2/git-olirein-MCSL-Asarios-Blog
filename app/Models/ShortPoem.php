<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShortPoem extends Model
{
    protected $table = 'shortpoems';

    protected $fillable = [
        'headline',
        'story',
        'pub',
        'created_at',
        'updated_at',
    ];

    public $timestamps = true;

    // Optional: Scope für die Veröffentlichung
    public function scopePublished($query)
    {
        return $query->whereIn('pub', [1, 2]);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DidYouKnow extends Model
{
    protected $table = 'didyouknow';

    protected $fillable = [
        'headline',
        'answer',
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

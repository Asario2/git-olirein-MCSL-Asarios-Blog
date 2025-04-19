<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Settings;
class Eloquent extends Model
{
    use HasFactory;

    /**
     * Die zuweisbaren Attribute.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'content',
        'author_id',
    ];

    /**
     * Beziehung: Ein Post gehört zu einem Autor (Benutzer).
     */
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }

    /**
     * Beziehung: Ein Post kann mehrere Kommentare haben.
     */
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
    public function scopeFilterDefault($query, $filters)
    {
        if (!empty($filters['search'])) {
            $whvals = Settings::$whvals(); // Dynamische Felder
            foreach ($whvals as $whn) {
                $query->orWhere($whn, 'like', '%' . $filters['search'] . '%');
            }
        }


        return $query;
    }
}

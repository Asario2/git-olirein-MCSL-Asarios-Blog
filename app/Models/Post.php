<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $dates = ['published_at'];

    // Beziehung: Ein Post gehört zu einem User
    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
    protected $fillable = ['title', 'content', 'author_id', 'published_at',"author_name"];

}

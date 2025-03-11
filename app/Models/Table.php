<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Table extends Model
{
    use HasFactory;
    public function scopeFilterBlog(Builder $query, $filters)
    {
        if (!empty($filters['search'])) {
            $query->where('name', 'like', '%' . $filters['search'] . '%')
            ->orWhere('description', 'like', '%' . $filters['search'] . '%');
        }

        return $query;

    }
    protected $table = 'admin_table';
}


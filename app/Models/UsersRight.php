<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersRight extends Model
{
    protected $table = 'users_rights'; // wichtig, falls Laravel "user_rights" erwarten würde

    protected $fillable = [
        'user_id',
        'view_table',
        'add_table',
        'edit_table',
        'publish_table',
        'date_table',
        'delete_table',
        // ggf. weitere Rechte wie xkis_AdminPanel, xkis_UserRights ...
    ];

    public $timestamps = false;

    // Beziehung zum User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function rights()
    {
        // return $this->hasOne(UsersRight::class, 'users_id');
    }

}

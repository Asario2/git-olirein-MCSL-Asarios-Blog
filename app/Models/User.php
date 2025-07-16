<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    protected $fillable = [
        'first_name',
        'name',
        'birthday',
        'music',
        'interests',
        'occupation',
        'email',
        'password',
        'email_verified_at',
        'two_factor_confirmed_at',
        'is_employee',
        'is_admin',
        'is_customer',
        'admin_id',
        'employee_id',
        'customer_id',
        'about',
        "updated_at",
    ];

    protected $hidden = [
        'password',
        "old_password",
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    protected $appends = [
        'profile_photo_url',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'two_factor_confirmed_at' => 'datetime',
            'password' => 'hashed',
            'last_login_at' => 'datetime',
            'is_admin' => 'boolean',
            'is_employee' => 'boolean',
            'is_customer' => 'boolean',
        ];
    }
    public function hasConfirmedTwoFactorAuthentication(): bool
    {
        return !is_null($this->two_factor_secret) && $this->two_factor_confirmed_at;
    }
    public function getFullNameAttribute()
    {
        $name = $this->first_name;

        if (!empty($this->name)) {
            if (!empty($name)) {
                $name .= ' ' . $this->name;
            }
            //
            if (empty($name)) {
                $name = $this->name;
            }
        }
        return $name;
    }

    protected function defaultProfilePhotoUrl()
    {
        $name = trim(collect(explode(' ', $this->full_name))->map(function ($segment) {
            return mb_substr($segment, 0, 1);
        })->join(' '));

        return 'https://ui-avatars.com/api/?name=' . urlencode($name) . '&color=FFFFFF&background=0EA5E9';
    }
    public function rights()
    {
        return $this->belongsTo(UsersRight::class, 'users_rights_id');
    }

}

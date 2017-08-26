<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'type', 'company','status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function setPasswordAttribute($value){
        $this->attributes['password'] = Hash::make($value);
    }

    public function offers() {
        return $this->hasMany(Offer::class);
    }

    public function resumes() {
        return $this->hasMany(Resume::class);
    }

    public function comments() {
        return $this->hasMany(Comment::class);
    }

    public function newsList() {
        return $this->hasMany(News::class);
    }

    public function favourResumes() {
        return $this->belongsToMany(Resume::class,'user_resume_favour');
    }

    public function favourOffers() {
        return $this->belongsToMany(Offer::class, 'user_offer_favour');
    }
}

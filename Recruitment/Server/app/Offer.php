<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    protected $table = 'offers';
    protected $fillable = [
        'title', 'pay', 'education', 'detail', 'user_id', 'sort'
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function comments() {
        return $this->hasMany(Comment::class);
    }

    public function resumes() {
        return $this->belongsToMany(Resume::class,'offer_resume','offer_id','resume_id')->withTimestamps();
    }
}

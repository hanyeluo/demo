<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = 'comments';
    protected $fillable = [
        'user_id', 'offer_id', 'content'
    ];
    public function user() {
        return $this->belongsTo(User::class);
    }
    public function offer() {
        return $this->belongsTo(Offer::class);
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OfferFavour extends Model
{
    protected $table = 'user_offer_favour';

    protected $fillable = ['user_id','offer_id'];



}


<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ResumeFavour extends Model
{
    protected $table = 'user_resume_favour';

    protected $fillable = ['user_id','resume_id'];
}

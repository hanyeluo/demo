<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Resume extends Model
{
    protected $table='resumes';
    protected $fillable = [
        'title', 'desc','detail', 'name', 'sex', 'school'
    ];
}

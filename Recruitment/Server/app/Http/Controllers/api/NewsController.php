<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;

class NewsController extends Controller
{
    public function index(User $user) {
        $news = $user->newsList()->get();
        return response()->json(['data'=>$news]);
    }

}

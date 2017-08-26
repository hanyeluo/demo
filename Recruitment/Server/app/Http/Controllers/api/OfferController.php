<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Offer;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OfferController extends Controller{

    public function index() {
        $offers = Offer::with('user')->where('status','1')->orderBy('created_at','desc')->orderBy('created_at','desc')->get();
        return response()->json(['data'=>$offers]);
    }





}

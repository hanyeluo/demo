<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Offer;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller{

    public function index(Offer $offer) {

        $comments = $offer->comments()->with('user')->get();
        return response()->json(['data'=>$comments]);

    }

    public function store(Request $request, Offer $offer) {
        $payload = $request->all();
        $payload['offer_id']=$offer->id;
        $user = Auth::user();
        try {
            $user->comments()->create($payload);
        }catch (Exception $exception) {
            return response()->json(['error'=>'回复失败','detail'=>$exception->getMessage()],500);
        }
        return response()->json(['success'=>true],200);

    }



}

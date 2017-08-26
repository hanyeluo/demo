<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Offer;
use App\OfferFavour;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserFavourOfferController extends Controller
{
    private $user;

    public function __construct()
    {
        $this->user = Auth::guard('api')->user();
    }

    public function index()
    {
        $offers = $this->user->favourOffers()->with('user')->get();
        return response()->json(['data'=>$offers]);
    }

    public function toggle(Offer $offer) {
        $favour = OfferFavour::where('user_id',$this->user->id)->where('offer_id',$offer->id)->first();
        if ($favour) {
            //取消
            $favour->delete();
            return response()->json(['message'=>'取消收藏成功']);
        }else {
            //添加
            $payload = [
                'user_id'=>$this->user->id,
                'offer_id'=>$offer->id
            ];
            try {
                OfferFavour::create($payload);
            } catch (\Exception $exception) {
                return response()->json(['error'=>'收藏失败']);
            }
            return response()->json(['message'=>'添加收藏成功']);
        }
    }
}

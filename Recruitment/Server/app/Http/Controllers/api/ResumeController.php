<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Offer;
use App\OfferResume;
use App\Resume;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ResumeController extends Controller{

    public function index() {
        $user = Auth::user();
        $resumes = $user->resumes;
        return response()->json(['data'=>$resumes]);
    }


    public function store(Request $request) {
        $payload = $request->all();
        $user = Auth::user();
        try {
            $user->resumes()->create($payload);
        }catch (Exception $exception) {
            return response()->json(['error'=>'创建简历失败'],500);
        }

        return response()->json(['success'=>true],200);
    }

    public function destroy(Resume $resume) {
        try {
            $resume->delete();
        }catch (Exception $exception) {
            return response()->json(['error'=>'删除简历失败, 该简历被企业使用中'],400);
        }
        return response()->json(['success'=>true],200);
    }

    public function update(Request $request, Resume $resume ) {
        $payload = $request->all();
        try {
            $resume->update($payload);
        }catch (Exception $exception) {
            return response()->json(['error'=>'更新简历失败'],500);
        }

        return response()->json(['success'=>true],200);
    }

    public function send(Offer $offer, Resume $resume) {

        $isExist = OfferResume::where('offer_id',$offer->id)->where('resume_id',$resume->id)->first();

        if ($isExist) {
            return response()->json(['error'=>'已经投递过简历了'],400);
        }
        $offer->resumes()->attach($resume->id);

        return response()->json(['success'=>true]);
    }

}

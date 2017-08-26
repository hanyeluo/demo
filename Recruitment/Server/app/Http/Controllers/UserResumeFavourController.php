<?php

namespace App\Http\Controllers;

use App\Resume;
use App\ResumeFavour;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vinkla\Alert\Facades\Alert;

class UserResumeFavourController extends Controller
{
    public function __construct()
    {
    }

    public function index() {
        $user = Auth::user();
        $resumes = $user->favourResumes;
        return view('favour.index')->with(compact('resumes'));
    }

    public function toggle(Resume $resume) {
        $user = Auth::user();
        $favour = ResumeFavour::where('user_id',$user->id)->where('resume_id',$resume->id)->first();
        if ($favour) {
            //取消
            $favour->delete();
            Alert::success('取消收藏成功');
            return redirect()->back();
        }else {
            //添加
            $payload = [
                'user_id'=>$user->id,
                'resume_id'=>$resume->id
            ];
            try {
                ResumeFavour::create($payload);
            } catch (\Exception $exception) {
                Alert::danger('操作失败');
                return redirect()->back();
            }
            Alert::success('收藏成功');
            return redirect()->back();
        }
    }
}

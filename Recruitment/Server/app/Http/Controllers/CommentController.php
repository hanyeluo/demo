<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Offer;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Vinkla\Alert\Facades\Alert;

class CommentController extends Controller
{
    public function index(Offer $offer) {
        $comments = $offer->comments;
        return view('comment.index')->with(compact(['comments','offer']));
    }

    public function store(Offer $offer, Request $request) {
        $payload = $request->all();
        if (!isset($payload['content'])) {
            Alert::danger('创建失败,内容不能为空');
            return redirect()->back();
        }

        $payload['offer_id']=$offer->id;
        $user = Auth::user();
        try {
            $user->comments()->create($payload);
        }catch (Exception $exception) {
            Alert::danger('创建失败,服务器错误');
            return redirect()->back();
        }
        Alert::success('创建成功');
        return redirect()->back();
    }
    public function delete(Comment $comment) {
        try {
            $comment->delete();
        }catch (Exception $exception) {
            Alert::danger('删除失败');
            return redirect()->back();
        }
        Alert::success('删除成功');
        return redirect()->back();
    }
}

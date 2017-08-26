<?php

namespace App\Http\Controllers;

use App\News;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Vinkla\Alert\Facades\Alert;

class NewsController extends Controller
{
    public function index() {
        $user = Auth::user();
        $news = $user->newsList;
        return view('news.index')->with(compact('news'));
    }

    public function create() {
        return view('news.create');
    }

    public function show(News $news) {
        return view('news.show')->with(compact('news'));
    }

    public function store(Request $request) {
        $payload = $request->all();
        $user = Auth::user();
        //图片处理
        if (isset($payload['image'])) {
            $path = $request->file('image')->storeAs('/',date('Y-m-d-h-i-s',time()).'-'.rand(1000,9999).'.jpg',[
                'disk'=>'public'
            ]);

            $payload['image'] = $path;
        }

        try {
            $user->newsList()->create($payload);
        }catch (Exception $exception) {
            Alert::danger('创建新闻失败,'.$exception->getMessage());
            return redirect()->back();
        }
        return redirect('/');
    }

    public function destroy(News $news) {
        try {
            $news->delete();
        }catch (Exception $exception) {
            Alert::danger('删除新闻失败');
            return redirect()->back();
        }
        return redirect('/');
    }

    public function edit(News $news) {
        return view('news.edit')->with(compact('news'));
    }

    public function update(Request $request, News $news) {
        $payload = $request->all();
        //图片处理
        if (isset($payload['image'])) {
            $path = $request->file('image')->storeAs('/',date('Y-m-d-h-i-s',time()).'-'.rand(1000,9999).'.jpg',[
                'disk'=>'public'
            ]);
            $payload['image'] = $path;
        }

        try {
            $news->update($payload);
        }catch (Exception $exception) {
            Alert::danger('更新新闻失败,'.$exception->getMessage());
            return redirect()->back();
        }
        Alert::success('更新新闻成功');
        return redirect()->back();
    }
}

<?php

namespace App\Http\Controllers;

use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Vinkla\Alert\Facades\Alert;

class UserController extends Controller{

    public function login(Request $request) {
        $payload['type'] = 3;
        $payload['email'] = $request->get('email');
        $payload['password'] = $request->get('password');


        if (Auth::attempt($payload)) {
            return redirect()->intended('/');
        }

        Alert::danger('用户认证失败');
        return redirect()->back();
    }

    public function enable(User $user) {
        $user->status = 1;
        try {
            $user->save();
        }catch (Exception $exception) {
            Alert::danger('启用失败');
            return redirect()->back();
        }

        Alert::success('启用成功');
        return redirect()->back();
    }

    public function disable(User $user) {
        $user->status = 0;
        try {
            $user->save();
        }catch (Exception $exception) {
            Alert::danger('禁用失败');
            return redirect()->back();
        }

        Alert::success('禁用成功');
        return redirect()->back();
    }


    public function logout() {
        Auth::logout();
        return redirect('/login');
    }

    public function index(Request $request) {
        $type = $request->get('type');
        if (!$type) {
            $type = 1;
        }
        $users = User::where('type',$type)->paginate(10);
        return view('user.index')->with(compact('users'));
    }

}

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
        $payload['type'] = 2;
        $payload['email'] = $request->get('email');
        $payload['password'] = $request->get('password');
        $payload['status'] = 1;

        if (Auth::attempt($payload)) {
            return redirect()->intended('/');
        }

        Alert::danger('用户认证失败');
        return redirect()->back();
    }

    public function regist(Request $request) {
        $payload = $request->all();

        $validator = Validator::make($payload, [
            'email' => 'required|unique:users',
            'password' => 'required',
            'company'=> 'required'
        ]);

        if ($validator->fails()) {
            Alert::danger('邮箱已经存在');
            return redirect()->back();
        }

        try {
            $user = User::create([
                'email'=>$payload['email'],
                'password'=>$payload['password'],
                'type'=>2,
                'company'=>$payload['company']
            ]);

            Auth::login($user);
        }catch (Exception $e) {
            Alert::danger($e->getMessage());
            return redirect()->back();
        }

        return redirect('/');
    }

    public function logout() {
        Auth::logout();
        return redirect('/login');
    }

}

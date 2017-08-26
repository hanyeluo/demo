<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateRequest;
use App\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller{

    public function store(CreateRequest $request) {
        $payload = $request->all();

        $userArray = ['email'=>$payload['email'],'password'=>$payload['password'],'type'=>1,'status'=>1];


        try {
            User::create($userArray);
        }catch (Exception $exception) {
            return response()->json(['error'=>'注册用户失败'],500);
        }

        return response()->json(['success'=>true]);
    }



}

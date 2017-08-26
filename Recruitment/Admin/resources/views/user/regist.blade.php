@extends('layout.app')

@section('title', '商家注册')

@section('css')
    <link type="text/css" rel="stylesheet" href="/css/login.css" />
@endsection

@section('body')
    <form class="form-signin" method="post" action="regist">
        {{ csrf_field() }}
        <h2 class="form-signin-heading">请填写注册信息</h2>
        <label for="inputEmail" class="sr-only">邮箱地址</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="请输入邮箱" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="请输入密码" required>
        <label for="company" class="sr-only">公司</label>
        <input type="text" name="company" id="company" class="form-control" placeholder="请输入公司名称" required>

        <button style="margin-top: 40px" class="btn btn-lg btn-success btn-block" type="submit">注册</button>

        <a class="regist-btn" href="/login">返回登录</a>
    </form>
@endsection
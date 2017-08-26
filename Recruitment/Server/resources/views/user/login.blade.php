@extends('layout.app')

@section('title', '商家登录')

@section('css')
    <link type="text/css" rel="stylesheet" href="/css/login.css" />
@endsection

@section('body')
    <form class="form-signin" method="post" action="login">
        {{ csrf_field() }}
        <h2 class="form-signin-heading">请登录</h2>
        <label for="inputEmail" class="sr-only">邮箱地址</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="请输入邮箱" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="请输入密码" required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>

        <a class="regist-btn" href="/regist">没有账号？</a>
    </form>
@endsection
@extends('layout.app')

@section('title','创建新闻')
@section('body')
    @include('layout.nav')

    <h3 class="text-center" style="margin-bottom: 40px">添加新闻</h3>

    <form class="form-horizontal" enctype="multipart/form-data" action="/news" method="post">
        @include('news.form')
    </form>

@endsection

@extends('layout.app')

@section('title','编辑新闻')
@section('body')
    @include('layout.nav')

    <h3 class="text-center" style="margin-bottom: 40px">编辑新闻</h3>

    <form class="form-horizontal" action="/news/{{$news->id}}/update" enctype="multipart/form-data" method="post">
        @include('news.form')
    </form>

@endsection

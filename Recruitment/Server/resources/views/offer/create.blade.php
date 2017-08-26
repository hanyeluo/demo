@extends('layout.app')

@section('title','创建招聘信息')
@section('body')
    @include('layout.nav')

    <h3 class="text-center" style="margin-bottom: 40px">创建招聘信息</h3>

    <form class="form-horizontal" action="/offers" method="post">
        @include('offer.form')
    </form>

@endsection

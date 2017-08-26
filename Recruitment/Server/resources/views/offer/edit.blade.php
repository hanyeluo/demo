@extends('layout.app')

@section('title','编辑招聘信息')
@section('body')
    @include('layout.nav')

    <h3 class="text-center" style="margin-bottom: 40px">编辑招聘信息</h3>

    <form class="form-horizontal" action="/offers/{{$offer->id}}/update" method="post">
        @include('offer.form')
    </form>

@endsection

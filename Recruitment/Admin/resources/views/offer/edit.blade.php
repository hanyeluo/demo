@extends('layout.app')

@section('title','编辑招聘信息')
@section('body')
    @include('layout.nav')

    <h3 class="text-center" style="margin-bottom: 40px">编辑招聘信息</h3>

    <form class="form-horizontal" action="/offers/{{$offer->id}}/update" method="post">
        {{ csrf_field() }}
        <div class="form-group">
            <label for="sort" class="col-sm-2 control-label">置顶</label>
            <div class="col-sm-10">
                <input name="sort" id="sort" class="form-control" value="{{ $offer->sort or '0' }}" placeholder="置顶（置顶参数越大越靠上）">
            </div>


        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">保存</button>
            </div>
        </div>
    </form>

@endsection

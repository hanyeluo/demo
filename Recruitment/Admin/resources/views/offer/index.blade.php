@extends('layout.app')

@section('title','招聘信息列表')
@section('body')
    @include('layout.nav')

    <h3 style="margin-bottom: 40px">招聘信息列表</h3>

    <table class="table table-striped">
        <tr>
            <th>#ID</th>
            <th>职位</th>
            <th>待遇</th>
            <th>学历</th>

            <th>操作</th>
        </tr>
        @foreach($offers as $offer)
            <tr>
                <td>{{ $offer->id }}</td>
                <td>{{ $offer->title }}</td>
                <td>{{ $offer->pay }}</td>
                <td>{{ $offer->education }}</td>

                <td>
                    <a href="/offers/{{ $offer->id }}/top">置顶</a> |
                    @if($offer->status == 1)
                        <a href="/offers/{{ $offer->id }}/disable">禁用</a>
                    @else
                        <a href="/offers/{{ $offer->id }}/enable">启用</a>
                    @endif


                </td>
            </tr>
        @endforeach
    </table>

@endsection

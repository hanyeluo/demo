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
            <th>状态</th>
            <th>操作</th>
        </tr>
        @foreach($offers as $offer)
            <tr>
                <td>{{ $offer->id }}</td>
                <td>{{ $offer->title }}</td>
                <td>{{ $offer->pay }}</td>
                <td>{{ $offer->education }}</td>
                @if($offer->status == 1)
                    <td>正常</td>
                @else
                    <td>被封</td>
                @endif
                <td>
                    <a href="/offers/{{ $offer->id }}/comments">留言</a> |
                    <a href="/offers/{{ $offer->id }}/resumes">简历</a> |
                    <a href="/offers/{{ $offer->id }}/edit">编辑</a> |
                    <a href="/offers/{{ $offer->id }}/delete">删除</a>
                </td>
            </tr>
        @endforeach
    </table>

@endsection

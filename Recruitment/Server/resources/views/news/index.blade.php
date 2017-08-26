@extends('layout.app')

@section('title','新闻管理')
@section('body')
    @include('layout.nav')

    <h3 style="margin-bottom: 40px">新闻列表</h3>

    <table class="table table-striped">
        <tr>
            <th>#ID</th>
            <th>标题</th>
            <th>简介</th>
            <th>创建日期</th>
            <th>操作</th>
        </tr>
        @foreach($news as $item)
            <tr>
                <td>{{ $item->id }}</td>
                <td>{{ $item->title }}</td>
                <td>{{ $item->desc }}</td>
                <td>{{ $item->created_at }}</td>
                <td>
                    <a href="/news/{{ $item->id }}/edit">编辑</a> |
                    <a href="/news/{{ $item->id }}/delete">删除</a>
                </td>
            </tr>
        @endforeach
    </table>


@endsection

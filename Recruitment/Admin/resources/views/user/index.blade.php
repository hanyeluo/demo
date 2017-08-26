@extends('layout.app')

@section('title','用户列表')
@section('body')
    @include('layout.nav')

    <h3 style="margin-bottom: 40px">用户列表</h3>

    <table class="table table-striped">
        <tr>
            <th>#ID</th>
            <th>邮箱</th>
            <th>公司</th>
            <th>注册时间</th>
            <th>操作</th>
        </tr>
        @foreach($users as $item)
            <tr>
                <td>{{ $item->id }}</td>
                <td>{{ $item->email }}</td>
                <td>{{ $item->company }}</td>
                <td>{{ $item->created_at }}</td>
                @if($item->status == 1)
                    <td><a href="/users/{{ $item->id }}/disable">禁用</a> </td>
                @elseif($item->status == 0)
                    <td><a href="/users/{{ $item->id }}/enable">启用</a> </td>
                @endif

            </tr>
        @endforeach
    </table>


@endsection

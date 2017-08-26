@extends('layout.app')

@section('title','留言列表')
@section('body')
    @include('layout.nav')

    <h3 style="margin-bottom: 40px">留言列表</h3>

    <a data-toggle="modal" data-target="#createCommentModel" href="" style="margin-bottom: 20px"
       class="btn btn-primary">添加回复</a>
    <table class="table table-striped">
        <tr>
            <th>#ID</th>
            <th>用户邮箱</th>
            <th>内容</th>
            <th>创建日期</th>
            <th>操作</th>
        </tr>
        @if ($comments)
            @foreach($comments as $comment)
                <tr>
                    <td>{{ $comment->id }}</td>
                    <td>{{ $comment->user->email }}</td>
                    <td>{{ $comment->content }}</td>
                    <td>{{ $comment->created_at }}</td>
                    <td><a href="/comments/{{ $comment->id }}/delete">删除</a></td>
                </tr>
            @endforeach
        @endif
    </table>


    <!-- Modal -->
    <div class="modal fade" id="createCommentModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <form action="/offers/{{ $offer->id }}/comments" method="post">
            {{ csrf_field() }}
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加回复</h4>
                    </div>
                    <div class="modal-body" style="height: 80px">

                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10">
                                <input name="content" class="form-control" placeholder="请输入内容">
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">保存</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
        </form>
    </div>

@endsection

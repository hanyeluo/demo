@extends('layout.app')

@section('title','我的收藏')
@section('body')
    @include('layout.nav')

    <h3 style="margin-bottom: 40px">收藏的简历列表</h3>

    <table class="table table-striped">
        <tr>
            <th>#ID</th>
            <th>标题</th>
            <th>简介</th>
            <th>操作</th>
        </tr>
        @foreach($resumes as $resume)
            <tr>
                <td>{{ $resume->id }}</td>
                <td>{{ $resume->title }}</td>
                <td>{{ $resume->desc }}</td>
                <td>
                    <a href="javascript:loadDetail({{$resume->id}})" >详细</a> |
                    <a href="/resumes/{{ $resume->id }}/favour">取消收藏</a>
                </td>
            </tr>
        @endforeach
    </table>


    <!-- Modal -->
    <div class="modal fade" id="detailModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

            </div>
        </div>
    </div>



@endsection


@section('js')
    <script type="text/javascript">
        function loadDetail(id) {
            console.log(id)
            $.ajax({
                type:'get',
                url:'/resumes/'+id,
                dataType:'html'
            }).done(function(html){
                $('#detailModel').find('.modal-content').html(html)
                $('#detailModel').modal('show')
            })
        }
    </script>
@endsection
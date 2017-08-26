<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">简历详细</h4>
</div>
<div class="modal-body">

    <table class="table table-hover">
        <tr>
            <td>姓名</td>
            <td>{{ $resume->name }}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                @if ($resume->sex == 1)
                    男
                @elseif ($resume->sex == 2)
                    女
                @else 
                    保密
                @endif
            </td>
        </tr>
        <tr>
            <td>学校</td>
            <td>{{ $resume->school }}</td>
        </tr>
        <tr>
            <td>详细</td>
            <td>{{ $resume->detail }}</td>
        </tr>

    </table>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>




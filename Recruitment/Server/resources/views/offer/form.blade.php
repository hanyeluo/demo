{{ csrf_field() }}
<div class="form-group">
    <label for="title" class="col-sm-2 control-label">职位</label>
    <div class="col-sm-10">
        <input name="title" type="text" value="{{ $offer->title or ''}}" class="form-control" id="title" placeholder="请填写职位">
    </div>
</div>
<div class="form-group">
    <label for="pay" class="col-sm-2 control-label">工资待遇</label>
    <div class="col-sm-10">
        <input name="pay" type="text" value="{{ $offer->pay or ''}}" class="form-control" id="desc" placeholder="请输入工资待遇">
    </div>
</div>

<div class="form-group">
    <label for="education" class="col-sm-2 control-label">要求学历</label>
    <div class="col-sm-10">
        <input name="education" id="education" class="form-control" value="{{ $offer->education or '' }}" placeholder="要求学历">
    </div>
</div>
<div class="form-group">
    <label for="detail" class="col-sm-2 control-label">详细</label>
    <div class="col-sm-10">
        <textarea name="detail" class="form-control">{{ $offer->detail or '' }}</textarea>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">保存</button>
    </div>
</div>
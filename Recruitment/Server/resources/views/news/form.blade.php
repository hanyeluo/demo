{{ csrf_field() }}
<div class="form-group">
    <label for="title" class="col-sm-2 control-label">标题</label>
    <div class="col-sm-10">
        <input name="title" type="text" value="{{ $news->title or ''}}" class="form-control" id="title" placeholder="请填写标题">
    </div>
</div>
<div class="form-group">
    <label for="desc" class="col-sm-2 control-label">描述</label>
    <div class="col-sm-10">
        <input name="desc" type="text" value="{{ $news->desc or ''}}" class="form-control" id="desc" placeholder="请输入描述">
    </div>
</div>
<div class="form-group">
    <label for="image" class="col-sm-2 control-label">图片</label>
    <div class="col-sm-10">
        <input type="file" name="image" class="form-control" id="image" placeholder="请上传图片">
    </div>
</div>

<div class="form-group">
    <label for="desc" class="col-sm-2 control-label">内容</label>
    <div class="col-sm-10">
        <textarea name="content" class="form-control">{{ $news->content or '' }}</textarea>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">保存</button>
    </div>
</div>
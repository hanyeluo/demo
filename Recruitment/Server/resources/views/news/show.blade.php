<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>{{ $news->title }}</title>
    <link type="text/css" rel="stylesheet" href="/css/reset.css">

    <style>
        h1 {
            font-size: 18px;
            padding: 6px 10px;
            margin-top: 30px;
            margin-left: 20px;
            border-left: 5px solid #1ca7d2;
        }
        .desc {
            color: #c3c3c3;
            font-size: 12px;
            font-weight:normal;
            line-height: 20px;
            margin-left: 20px;
            padding: 0;
            margin-top: 20px;
        }
        .thumb {
            width: 100%;
            margin-top: 20px;
        }
        .content {
            padding: 20px;
        }
        p {
            font-size: 14px;
            line-height: 22px;
            letter-spacing: 1px;
            text-indent: 2em;
            margin-top: 20px;
        }
    </style>

</head>
<body>
<h1>{{ $news->title }}</h1>
<div class="desc">
    {{ $news->desc }}
    {{ $news->created_at }}
</div>

<img class="thumb" src="{{ Storage::disk('public')->url($news->image) }}" />
<div class="content">
    {!! $news->content !!}
</div>
</body>
</html>
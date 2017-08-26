<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <meta charset="utf-8">
    <link href="/css/reset.css" rel="stylesheet" type="text/css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/app.css">
    @yield('css')
</head>
<body>

    <div class="container">
        @include('alert::alert')
        @yield('body')
    </div>



    <script src="/vendor/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    @yield('js')

</body>
</html>
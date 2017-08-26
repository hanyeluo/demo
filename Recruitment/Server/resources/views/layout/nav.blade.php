<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">商家后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">新闻管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/">新闻列表</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">添加新闻</li>
                        <li><a href="/news/create">添加一条新闻</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">招聘信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/offers">招聘信息列表</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">添加信息</li>
                        <li><a href="/offers/create">添加一条招聘信息</a></li>
                    </ul>
                </li>

                <li>
                    <a href="/favours">我的收藏</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎 {{ Auth::user()->company}}</a></li>
                <li><a href="/logout">退出</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<style>
    body {
        padding-top: 70px;
    }
</style>
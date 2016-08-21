<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doing</title>

    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Floral Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>

    <!-- 前台模板CSS样式 -->
    <link href="${pageContext.request.contextPath}/resources/front-end/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/resources/front-end/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/resources/front-end/css/fonts-userso/font-useso-Open+Sans.css" rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/resources/front-end/css/fonts-userso/font-useso-Lato.css" rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/resources/front-end/css/fonts-userso/font-useso-Playfair+Display.css" rel='stylesheet' type='text/css'>

    <!-- 因为导航栏要用到后台模板的CSS样式，在此引入 -->
    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- js -->
    <script src="${pageContext.request.contextPath}/resources/front-end/js/jquery.min.js"></script>
    <!-- //js -->

    <!-- 后台模板的 Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

</head>
<body>
<!-- header -->
<div class="header">
    <div class="container">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                            class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="" class="navbar-brand">首页</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a aria-expanded="false" role="button" href="#" class="dropdown-toggle"
                               data-toggle="dropdown"> 用户管理 <span class="caret"></span></a>
                            <ul role="menu" class="dropdown-menu">
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a aria-expanded="false" role="button" href="#" class="dropdown-toggle"
                               data-toggle="dropdown"> 博文管理 <span class="caret"></span></a>
                            <ul role="menu" class="dropdown-menu">
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                                <li><a href="">菜单列表</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-top-links navbar-right">
                        <c:if test="${sessionScope.loginUser == null}">
                            <li><a href=""><i class="fa fa-sign-in"></i> 登陆</a></li>
                            <li><a href=""><i class="fa fa-reply"></i> 注册</a></li>
                        </c:if>
                        <c:if test="${sessionScope.loginUser != null}">
                            <li><span>尊敬的：<a href="">${sessionScope.loginUser.username}</a></span></li>
                            <li>
                                <a href="">
                                    <i class="fa fa-sign-out"></i> 退出
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- header -->

<!-- content -->
<div class="content">
    <div class="container">
        <div class="content-text">
            <div class="title">
                <div class="some-title">
                    <h3><a href="">博客标题</a></h3>
                </div>
                <div class="john">
                    <p>博客作者<span>创建博客时间</span></p>
                </div>
                <div class="clearfix"></div>
                <div class="tilte-grid">
                    <p class="Sed">
					<span>博客内容</span></p>
                </div>
                <div class="border">
                    <p>a</p>
                </div>
                <div class="some-title">
                    <h3><a href="">博客标题</a></h3>
                </div>
                <div class="john">
                    <p><a href="#">博客作者</a><span>创建博客时间</span></p>
                </div>
                <div class="clearfix"></div>
                <div class="tilte-grid">
                    <a href=""><img src="${pageContext.request.contextPath}/resources/front-end/images/2.jpg" alt=" "/></a>
                    <p class="Sed"><span>博客内容</span></p>
                </div>
                <div class="read">
                    <a href="">Read More</a>
                </div>
                <div class="border1">
                    <div class="pre">
                        <a href="#">pre</a>
                    </div>
                    <div class="number">
                        <ul>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                        </ul>
                    </div>
                    <div class="next">
                        <a href="#">next</a>
                    </div>
                </div>
            </div>
            <div class="categories">
                <div class="categ">
                    <div class="cat">
                        <h3>导航栏</h3>
                        <ul>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">4</a></li>
                        </ul>
                    </div>
                    <div class="recent-com">
                        <h3>补充导航</h3>
                        <ul>
                            <li><a href="">Donec consequat</a></li>
                            <li><a href="">Aliquam erat ipsum,</a></li>
                            <li><a href="">Etiam aliquet convallis enim ut
                                <span>Donec at pretium dui</span></a></li>
                            <li><a href="">Nulla sed massa sagittis</a></li>
                        </ul>
                    </div>
                    <div class="view">
                        <a href="">View More</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //content -->

<!-- footer -->
<div class="footer-bottom">
    <div class="container">
        <p>Copyright &copy; 2016 Doing's blog</p>
    </div>
</div>
<!-- //footer -->

</body>
</html>

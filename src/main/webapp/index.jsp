<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a href="${pageContext.request.contextPath}/admin/user/index" class="navbar-brand">首页</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-top-links navbar-right">
                        <c:if test="${sessionScope.loginUser == null}">
                            <li><a href="${pageContext.request.contextPath}/admin/user/loginUI"><i class="fa fa-sign-in"></i> 登陆</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/user/register"><i class="fa fa-reply"></i> 注册</a></li>
                        </c:if>
                        <c:if test="${sessionScope.loginUser != null}">
                            <li><span>尊敬的：<a href="${pageContext.request.contextPath}/admin/user/show/${sessionScope.loginUser.uId}">${sessionScope.loginUser.username}</a></span></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/user/logout">
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
                <c:if test="${articleList != null}">
                    <c:forEach items="${articleList}" var="article">
                        <div class="some-title">
                            <h3><a href="${pageContext.request.contextPath}/admin/user/articleShow?articleId=${article.articleId}">${article.title}</a></h3>
                        </div>
                        <div class="john">
                            <p><a href="#">${article.admin.username}</a><span><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
                        </div>
                        <div class="clearfix"></div>
                        <div class="tilte-grid">
                            <p class="Sed"><span>${article.content}</span></p>
                        </div>
                        <div class="read">
                        </div>
                        <div class="border">
                            <p>a</p>
                        </div>
                    </c:forEach>
                </c:if>

                <div class="border1">
                    共<strong>&nbsp;&nbsp;${page.total}&nbsp;&nbsp;</strong>条博客文章&nbsp;&nbsp;&nbsp;
                    <c:if test="${page.prePage == 0}">
                        <span>首页</span>&nbsp;&nbsp;
                        <span style="font-size: larger">上一页</span>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${page.prePage != 0}">
                        <a href="${pageContext.request.contextPath}/admin/user/index?page=${page.firstPage}">首页</a>&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/admin/user/index?page=${page.prePage}" style="font-size: larger">上一页</a>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${page.nextPage == 0}">
                        <span style="font-size: larger">下一页</span>&nbsp;&nbsp;
                        <span>尾页</span>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${page.nextPage != 0}">
                        <a href="${pageContext.request.contextPath}/admin/user/index?page=${page.nextPage}" style="font-size: larger">下一页</a>&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/admin/user/index?page=${page.lastPage}">尾页</a>&nbsp;&nbsp;
                    </c:if>
                    第&nbsp;<span style="font-size: large;color: red">${page.pageNum}</span>&nbsp;页
                    共&nbsp;<span style="font-size: large;color: red">${page.pages}</span>&nbsp;页
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

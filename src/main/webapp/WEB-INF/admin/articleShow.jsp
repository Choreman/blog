<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>查看博文</title>

    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- datatable插件的css文件 -->
    <link href="${pageContext.request.contextPath}/resources/lib/DataTables-1.10.12/media/css/jquery.dataTables.min.css" rel="stylesheet">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- datatable插件的js文件 -->
    <script src="${pageContext.request.contextPath}/resources/lib/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>

</head>
<body class="top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                            class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/admin/list" class="navbar-brand">后台管理首页</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a aria-expanded="false" role="button" href="${pageContext.request.contextPath}/index.jsp">返回前台首页</a>
                        </li>
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
                                <li><a href="${pageContext.request.contextPath}/admin/admin/article">发表博客</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/admin/admin/showArticle">查看博文</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span>尊敬的：<a href="${pageContext.request.contextPath}/admin/admin/show/${sessionScope.loginAdmin.aId}">${sessionScope.loginAdmin.username}</a></span>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/admin/logout">
                                <i class="fa fa-sign-out"></i> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget-container fluid-height clearfix">
                        <div class="heading">
                            <h2>博文管理</h2>
                        </div>
                        <br><hr><br>
                        <c:if test="${article != null}">
                            <div class="article-title">
                                <strong style="font-size: 25px">${article.title}</strong>
                                <center>
                                    <div class="article-inf">
                                        <strong style="font-size: 15px">${article.admin.username}</strong>&nbsp;&nbsp;&nbsp;
                                        <strong style="font-size: 15px"><fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></strong>
                                    </div>
                                </center>
                            </div>
                            <div class="article-content">
                                <div class="text-center">
                                    <p>${article.content}</p>
                                </div>
                            </div>
                        </c:if>

                        <hr><br><br>
                        <div class="heading">
                            <h2>用户评论</h2>
                        </div>
                        <hr>
                        <c:if test="${userCommentList != null}">
                            <c:forEach items="${userCommentList}" var="userComment">
                                <div class="userComment">
                                    ${userComment.content}
                                    <div class="userCommnet-inf" style="float: right;">
                                        ${userComment.user.username}<br>
                                            <fmt:formatDate value="${userComment.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                    </div>
                                </div>
                                <br><hr>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>

        </div>

        <div class="footer">
            <div class="pull-right">
                By：Doing's blog
            </div>
            <div>
                <strong>Copyright</strong> H+ &copy; 2016
            </div>
        </div>
    </div>
</div>
</body>
</html>

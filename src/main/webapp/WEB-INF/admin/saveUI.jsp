<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>修改个人信息</title>

    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- laydate -->
    <script src="${pageContext.request.contextPath}/resources/lib/laydate/laydate.js"></script>

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
                                <a aria-expanded="false" role="button" href="">返回前台首页</a>
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
                            <li>
                                <span>尊敬的：<a href="${pageContext.request.contextPath}/admin/admin/show/${sessionScope.loginAdmin.aId}">${admin.username}</a></span>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                                    <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                                </a>
                                <ul class="dropdown-menu dropdown-messages">
                                    <li>
                                        <div class="dropdown-messages-box">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle"
                                                     src="${pageContext.request.contextPath}/resources/admin/img/a7.jpg">
                                            </a>
                                            <div class="media-body">
                                                <small class="pull-right">46小时前</small>
                                                <strong>小四</strong> 项目已处理完结
                                                <br>
                                                <small class="text-muted">3天前 2014.11.8</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="dropdown-messages-box">
                                            <a href="profile.html" class="pull-left">
                                                <img alt="image" class="img-circle"
                                                     src="${pageContext.request.contextPath}/resources/admin/img/a4.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right text-navy">25小时前</small>
                                                <strong>国民岳父</strong> 这是一条测试信息
                                                <br>
                                                <small class="text-muted">昨天</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="text-center link-block">
                                            <a href="mailbox.html">
                                                <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                                    <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                                </a>
                                <ul class="dropdown-menu dropdown-alerts">
                                    <li>
                                        <a href="mailbox.html">
                                            <div>
                                                <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                                <span class="pull-right text-muted small">4分钟前</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="profile.html">
                                            <div>
                                                <i class="fa fa-qq fa-fw"></i> 3条新回复
                                                <span class="pull-right text-muted small">12分钟钱</span>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="text-center link-block">
                                            <a href="notifications.html">
                                                <strong>查看所有 </strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
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
                <div class="container">
                    <div class="col-sm-6 col-sm-offset-6">
                        <strong>修改个人信息</strong>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <form action="${pageContext.request.contextPath}/admin/admin/updateUI" method="post" class="form-horizontal">
                        <input type="hidden" name="aId" value="${admin.aId}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">登陆账号</label>
                            <div class="col-sm-6">
                                <input type="text" value="${admin.loginName}" name="loginName" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">昵称</label>
                            <div class="col-sm-6">
                                <input type="text" value="${admin.username}" name="username" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" value="${admin.password}" name="password" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">性别</label>
                            <div class="col-sm-6">
                                <div class="radio">
                                    <label><input type="radio" value="男" id="sex1" name="sex" ${admin.sex == '男' ? "checked" : ""}>男</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" value="女" id="sex2" name="sex"  ${admin.sex == '女' ? "checked" : ""}>女</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="radio" value="保密" id="sex3" name="sex"  ${admin.sex == '保密' ? "checked" : ""}>保密</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">生日</label>
                            <div class="col-sm-6">
                                <input type="datetime" value="${admin.birthday}" name="birthday_time" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="laydate-icon">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">电话号码</label>
                            <div class="col-sm-6">
                                <input type="text" value="${admin.phone}" name="phone" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">创建时间</label>
                            <div class="col-sm-6">
                                <input type="datetime" value="${admin.createDate}" name="createDate" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-6">
                                <button class="btn btn-primary" type="submit">保存</button>
                                <button class="btn btn-white" type="reset">重置</button>
                            </div>
                        </div>
                    </form>
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

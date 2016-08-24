<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>

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

    <!-- laydate日期选择器 -->
    <script src="${pageContext.request.contextPath}/resources/lib/laydate/laydate.js"></script>

    <!-- layer弹窗插件 -->
    <script src="${pageContext.request.contextPath}/resources/lib/layer/layer.js"></script>

    <!-- Jquery Validate -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/validate/messages_zh.min.js"></script>

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
                    <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">首页</a>
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
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form action="${pageContext.request.contextPath}/admin/user/insertUser" method="post" id="user-form" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">用户名</label>
                                <div class="col-sm-6">
                                    <input type="text" value="" placeholder="6~10位数字或字母组合" id="loginName" name="loginName" class="form-control">
                                    <div style="display: inline" id="loginNameTip"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">昵称</label>
                                <div class="col-sm-6">
                                    <input type="text" value="" placeholder="用户昵称" name="username" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">密码</label>
                                <div class="col-sm-6">
                                    <input type="password" value="" placeholder="6~10位数字或字母组合" id="password" name="password" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">再次输入密码</label>
                                <div class="col-sm-6">
                                    <input type="password" value="" placeholder="再次输入密码" name="password1" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">性别</label>
                                <div class="col-sm-6">
                                    <div class="radio">
                                        <label><input type="radio" value="男" id="sex1" name="sex" checked>男</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label><input type="radio" value="女" id="sex2" name="sex">女</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <label><input type="radio" value="保密" id="sex3" name="sex">保密</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">生日</label>
                                <div class="col-sm-6">
                                    <input type="datetime" value="" placeholder="请输入具体日期" name="birthday_time" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="laydate-icon">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">电话号码</label>
                                <div class="col-sm-6">
                                    <input type="text" value="" placeholder="11位纯数字" name="phone" class="form-control">
                                </div>
                            </div>
                            <br>
                            <!-- 在隐藏域中先保存用户的默认头像名称 -->
                            <input type="hidden" name="headPortrait" value="default_headPortrait"/>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-4">
                                        <div class="col-md-4">
                                            <button type="button" id="btn" class="btn btn-block btn-outline btn-primary">注册</button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" onclick="reset()" class="btn btn-block btn-outline btn-primary">重置</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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

<!-- 验证表单信息的js代码 -->
<script type="text/javascript">
    $(document).ready(function() {
        $("#user-form").validate({
            rules: {
                loginName: {
                    required:true,
                    rangelength:[6,10],
                    remote: {       //发送ajax请求，到数据库查询是否有相同的loginName
                        url: "${pageContext.request.contextPath}/admin/user/selectByLoginName",
                        type: "post",
                    }
                },
                username: {
                    required:true,
                    minlength:1,
                },
                password: {
                    required:true,
                    rangelength:[6,10],
                },
                password1: {
                    required: true,
                    equalTo:"#password",
                },
                birthday_time: {

                },
                phone: {
                    number:true,
                    rangelength:[11,11]
                }
            },
            messages: {
                loginName: {
                    required: "请输入你的用户名",
                    rangelength: "请输入6到10位数字或字母组合",
                    remote: "用户名已经存在，请重新注册"
                },
                password: {
                    required: "请输入您的密码",
                    rangelength: "请输入6到10位数字或字母组合",
                },
                password1: {
                    required: "请输入您的密码",
                    equalTo: "与上述密码不符合",
                },
                birthday_time: {

                },
                phone: {
                    number: "必须为纯数字",
                    rangelength: "位数必须为11位",
                }
            }
        });

        //提交表单
        $("#btn").click(function(){
            $("#user-form").submit();
        })
    });
</script>
</body>
<c:if test="${result != null}">
    <script>
        var msg = '${result.msg}';
        layer.msg("提示：" + msg);
    </script>
</c:if>
</html>

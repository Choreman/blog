<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>管理员信息</title>

    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/hplus.js?v=2.2.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/iCheck/icheck.min.js"></script>

    <!-- layer弹窗插件 -->
    <script src="${pageContext.request.contextPath}/resources/lib/layer/layer.js"></script>

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
                            <a aria-expanded="false" role="button" href="${pageContext.request.contextPath}/admin/user/index">返回前台首页</a>
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
            <div class="row animated fadeInRight">
                <div class="col-md-4">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>个人资料</h5>
                        </div>
                        <div>
                            <div class="ibox-content no-padding border-left-right">
                                <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/resources/admin/img/profile_big.jpg">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>Simple-Doing</strong></h4>
                                <p><i class="fa fa-map-marker"></i> 佛山市南海区狮山镇大学城东软学院</p>
                                <h5>
                                    关于我
                                </h5>
                                <p>
                                    热爱生活，热爱互联网，热爱新技术, 在不断的寻求新的突破。
                                </p>
                                <div class="row m-t-lg">
                                    <div class="col-md-6">
                                        <h5><strong>169</strong> 博客文章</h5>
                                    </div>
                                    <div class="col-md-6">
                                        <h5><strong>240</strong> 注册用户</h5>
                                    </div>
                                </div>
                                <div class="user-button">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <a href="${pageContext.request.contextPath}/admin/admin/saveUI/${sessionScope.loginAdmin.aId}"><button type="button" class="btn btn-block btn-outline btn-primary">修改个人信息</button></a>
                                        </div>
                                        <div class="col-md-6">
                                            <a data-toggle="modal" href="#modal-form"><button type="button" class="btn btn-block btn-outline btn-primary">修改密码</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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

<!-- 修改密码的弹窗界面 -->
<div id="modal-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h2 class="m-t-none m-b">修改密码</h2>
                        <div class="form-group">
                            <label>请输入密码：</label>
                            <input type="password" name="password1" id="password1" placeholder="6~10位" class="form-control"><div style="display: inline" id="tip1"></div>
                        </div>
                        <div class="form-group">
                            <label>再次输入密码：</label>
                            <input type="password" name="password2" id="password2" placeholder="再次输入密码" class="form-control"><div style="display: inline" id="tip2"></div>
                        </div>
                        <br/>
                        <div id="tip3" class="pull-left"></div>
                        <div>
                            <button id="btn" class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>确认修改</strong></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $("#password1").blur(function(){
            var num = $("#password1").val().length;
            if(num < 6){
                $("#tip1").html("<font color=\"red\" size=\"3\"> 密码长度太短 </font>");
            }else if(num > 10){
                $("#tip1").html("<font color=\"red\" size=\"3\"> 密码长度太长 </font>");
            }else{
                $("#tip1").html("<font color=\"green\" size=\"3\"> 密码长度通过 </font>");
            }
        })

        $("#password2").blur(function(){
            var tmp = $("#password1").val();
            var num = $("#password2").val().length;
            if($("#password2").val() != tmp){
                $("#tip2").html("<font color=\"red\" size=\"3\"> 两次输入密码不一致 </font>");
            }else{
                if(num >= 6 && num <= 10){
                    $("#tip2").html("<font color=\"green\" size=\"3\"> 校验通过 </font>");
                }
            }
        })

        $("#btn").click(function(){
            var flag = true;
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            var num1 = $("#password1").val().length;
            var num2 = $("#password2").val().length;
            if(num1 != num2 || num1 < 6 || num1 > 10 || num2 < 6 || num2 > 10 || password1 != password2){
                flag = false;
            }else{
                flag = true;
            }
            if(flag){
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/admin/updatePassword/${sessionScope.loginAdmin.aId}",
                    data:{
                        password: password1
                    },
                    success: function(result){
                        $("#tip3").show().html("<font color=\"green\" size=\"5\"> 修改成功 </font>")
                        $("#password1").val("");
                        $("#password2").val("");
                        $("#tip1").empty();
                        $("#tip2").empty();
                        $("#tip3").delay(2000).hide(0);
                    }
                })
            }else{
                $("#tip3").show().html("<font color=\"red\" size=\"3\"> 请遵循以上提示规则！ </font>");
            }
        })
    })
</script>
</body>
<c:if test="${result != null}">
    <script>
        var success = ${result.success};
        var msg = '${result.msg}';
        layer.msg("提示：" + msg);
    </script>
</c:if>
</html>

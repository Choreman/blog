<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户上传头像</title>
    
    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- 后台模板的 Mainly scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    
    <!-- 头像上传插件相关js文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/front-end/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/fullAvatarEditor-2.1/scripts/fullAvatarEditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/fullAvatarEditor-2.1/scripts/swfobject.js"></script>
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
<div class="content" style="margin-left: 119px">
    <div class="wrapper wrapper-content" style="width: 1170px;background: #ffffff">
        <div class="container">
            <div style="width:632px;margin: 0 auto;text-align:center">
                <div>
                    <p id="swfContainer">
                        本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
                    </p>
                </div>
                <button type="button" id="upload" style="display:none;margin-top:8px;">swf外定义的上传按钮，点击可执行上传保存操作</button>
            </div>
        </div>
    </div>
</div>
<!-- content -->

<!-- 头像上传相关js代码 -->
<script type="text/javascript">
    swfobject.addDomLoadEvent(function () {
        var swf = new fullAvatarEditor("${pageContext.request.contextPath}/resources/lib/fullAvatarEditor-2.1/fullAvatarEditor.swf", "expressInstall.swf", "swfContainer", {
                    id : 'swf',
                    upload_url : '${pageContext.request.contextPath}/admin/user/headPortraitResult',	//上传接口
                    method : 'post',	//传递到上传接口中的查询参数的提交方式。更改该值时，请注意更改上传接口中的查询参数的接收方式
                    src_upload : 1,		//是否上传原图片的选项，有以下值：0-不上传；1-上传；2-显示复选框由用户选择
                    src_url: '${pageContext.request.contextPath}/resources/lib/images/default_headPortrait.png', //上传头像时，默认的头像
                    tab_visible: false,     //是否显示选项卡(即选择本地上传还是拍照的选项卡)
                    avatar_sizes: "200*200",    //100*100|50*50|32*32,表示一组或多组头像的尺寸。其间用"|"号分隔。
                }, function (msg) {
                    switch(msg.code)
                    {
                        case 1 : alert("页面成功加载了组件！");break;
                        case 2 :
                            alert("已成功加载图片到编辑面板。");
                            document.getElementById("upload").style.display = "inline";
                            break;
                        case 3 :
                            if(msg.type == 0)
                            {
                                alert("摄像头已准备就绪且用户已允许使用。");
                            }
                            else if(msg.type == 1)
                            {
                                alert("摄像头已准备就绪但用户未允许使用！");
                            }
                            else
                            {
                                alert("摄像头被占用！");
                            }
                            break;
                        case 5 :
                            if(msg.type == 0)
                            {
                                if(msg.content.sourceUrl)
                                {
                                    alert("原图已成功保存至服务器，url为：\n" +　msg.content.sourceUrl+"\n\n" + "头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n\n")+"\n\n传递的userid="+msg.content.userid+"&username="+msg.content.username);
                                }
                                else
                                {
                                    alert("头像已成功保存至服务器，url为：\n" + msg.content.avatarUrls.join("\n\n")+"\n\n传递的userid="+msg.content.userid+"&username="+msg.content.username);
                                }
                            }
                            break;
                    }
                },function(json) {
                    if (json.code == 5) {
                        switch (json.type) {
                                //表示图片上传成功。
                            case 0:
                                //alert('原图片位于服务器的虚拟路径为' + json.content.sourceUrl);
                                //alert('头像图片位于服务器的虚拟路径为' + json.content.avatarUrls.join(','));
                                break;
                            case 1:
                                alert('头像上传失败，原因：' + json.content.msg);//will output:头像上传失败，原因：上传的原图文件大小超出限值了！
                                break;
                            case 2:
                                alert('头像上传失败，原因：指定的上传地址不存在或有问题！');
                                break;
                            case 3:
                                alert('头像上传失败，原因：发生了安全性错误！请联系站长添加crossdomain.xml到网站根目录。');
                                break;
                        }
                    }
                }
        );
        document.getElementById("upload").onclick=function(){
            swf.call("upload");
        };
    });

</script>

</body>
</html>
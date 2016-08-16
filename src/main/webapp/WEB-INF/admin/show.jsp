<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>管理员信息</title>

    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

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
                                        <div class="col-md-12">
                                            <a href="${pageContext.request.contextPath}/admin/admin/saveUI/${sessionScope.loginAdmin.aId}"><button type="button" class="btn btn-primary btn-sm btn-block">修改个人信息</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>最新动态</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="profile.html#">选项1</a>
                                    </li>
                                    <li><a href="profile.html#">选项2</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <div>
                                <div class="feed-activity-list">

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/resources/admin/img/a1.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">1天前</small>
                                            <strong>奔波儿灞</strong> 关注了 <strong>灞波儿奔</strong>.
                                            <br>
                                            <small class="text-muted">54分钟前 来自 皮皮时光机</small>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> 收藏</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/resources/admin/img/profile.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">5分钟前</small>
                                            <strong>作家崔成浩</strong> 发布了一篇文章
                                            <br>
                                            <small class="text-muted">今天 10:20 来自 iPhone 6 Plus</small>

                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/resources/admin/img/a2.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2小时前</small>
                                            <strong>作家崔成浩</strong> 抽奖中了20万
                                            <br>
                                            <small class="text-muted">今天 09:27 来自 Koryolink iPhone</small>
                                            <div class="well">
                                                抽奖，人民币2000元，从转发这个微博的粉丝中抽取一人。11月16日平台开奖。随手一转，万一中了呢？
                                            </div>
                                            <div class="pull-right">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                                <a class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 评论</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/resources/admin/img/a3.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right">2天前</small>
                                            <strong>天猫</strong> 上传了2张图片
                                            <br>
                                            <small class="text-muted">11月7日 11:56 来自 微博 weibo.com</small>
                                            <div class="photos">
                                                <a target="_blank" href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg">
                                                    <img alt="image" class="feed-photo" src="${pageContext.request.contextPath}/resources/admin/img/p1.jpg">
                                                </a>
                                                <a target="_blank" href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg">
                                                    <img alt="image" class="feed-photo" src="${pageContext.request.contextPath}/resources/admin/img/p3.jpg">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="profile.html#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/resources/admin/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">5小时前</small>
                                            <strong>在水一方Y</strong> 关注了 <strong>那二十年的单身</strong>.
                                            <br>
                                            <small class="text-muted">今天 10:39 来自 iPhone客户端</small>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button>

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
</body>
</html>

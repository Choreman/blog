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
                <!-- DataTables Example -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="widget-container fluid-height clearfix">
                            <div class="heading">
                                <h2>博文管理</h2>
                            </div>
                            <div class="widget-content padded clearfix">
                                <table class="table table-bordered table-striped" id="datatable-editable">
                                    <thead>
                                        <th width="350px">标题</th>
                                        <th width="350px">内容</th>
                                        <th width="200px">发表时间</th>
                                        <th width="100px">访问人数</th>
                                        <th width="100px">评论数</th>
                                        <th width="100px">作者</th>
                                        <th width="150px">功能</th>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end DataTables Example -->

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

<!-- datatable插件相关js代码 -->
<script type="text/javascript">
    $(document).ready(function() {
        $("#admin_page").addClass("current");
        var oTable= $("#datatable-editable").dataTable({
            "bProcessing": true, // 是否显示取数据时的那个等待提示
            "bServerSide": true,//这个用来指明是通过服务端来取数据
            "sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
            "iDisplayLength": 10,//每页显示10条数据
            "sAjaxSource": "${pageContext.request.contextPath}/admin/admin/dataTable",//这个是请求的地址
            "fnServerData": retrieveData ,
            "oLanguage" : { // 汉化
                "sProcessing" : "正在加载数据...",
                "sLengthMenu" : "显示_MENU_条 ",
                "sZeroRecords" : "没有您要搜索的内容",
                "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                "sInfoEmpty" : "记录数为0",
                "sInfoFiltered" : "(全部记录数 _MAX_  条)",
                "sInfoPostFix" : "",
                "sSearch" : "搜索",
                "sUrl" : "",
                "oPaginate" : {
                    "sFirst" : "第一页",
                    "sPrevious" : " 上一页 ",
                    "sNext" : " 下一页 ",
                    "sLast" : " 最后一页 "
                }
            },
            "aoColumns":
                    [
                        { "mData": "title", 'sClass':'center'},
                        {
                            "mDataProp": "content",
                            "bSortable": true,
                            "fnRender": function(obj) {
                                var content = obj.aData.content;
                                if(content.length > 50){
                                    var temp = content.substring(0, 50);//从最头切割，到第50-1位结束，切割后长度为50-0
                                    return temp + "...";
                                }
                                return content;
                            }
                        },
                        {
                            "mDataProp": "createDate",
                            "bSortable": true,
                            "fnRender": function(obj) {
                                var datetime = new Date();
                                datetime.setTime(obj.aData.createDate);
                                var year = datetime.getFullYear();
                                var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                                var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                                var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
                                var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                                var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                                return year + "-" + month + "-" + date +" "+hour+":"+minute+":"+second;
                            }
                        },
                        { "mData": "visitsNumber", 'sClass':'center'},
                        { "mData": "commentId", 'sClass':'center'},
                        { "mData": "adminId", 'sClass':'center'},
                        {
                            "mDataProp": "articleId",
                            "bSearchable": false,
                            "bSortable": false,
                            "fnRender": function(obj) {
                                var id=obj.aData.a_id;
                                var render=  '<a target="_blank"  href="'+id+'"><i class="icon-search"></i>查看</a>';
                                render += '&nbsp;&nbsp;';
                                render += '/  ';
                                render += '<a class="delete-row" href="#" name='+id+'><i class="icon-remove"></i>删除</a>'
                                return render;
                            }
                        }

                    ]
        });

// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
        function retrieveData( sSource111,aoData111, fnCallback111) {
            var arrayObj=new Array(
                    { "mData": "title", 'sClass':'center'},
                    { "mData": "content", 'sClass':'center'},
                    { "mData": "create_date", 'sClass':'center'},
                    { "mData": "visits_number", 'sClass':'center'},
                    { "mData": "comment_id", 'sClass':'center'},
                    { "mData": "admin_id", 'sClass':'center'}
            );
            var searchtext="";
            var sort="";
            var order="";
            var pageOffset=0;
            var size=10;
            var sEcho=0;
            for(var i=0;i<aoData111.length;i++){
                var value=aoData111[i].value;
                if(aoData111[i].name=="iSortCol_0"){
                    sort=arrayObj[value].mData;
                }
                if(aoData111[i].name=="sSortDir_0"){
                    order=value;
                }
                if(aoData111[i].name=="sSearch"){
                    searchtext=value;
                }
                if(aoData111[i].name=="iDisplayStart"){
                    pageOffset=value
                }
                if(aoData111[i].name=="iDisplayLength"){
                    size=value
                }
                if(aoData111[i].name=="sEcho"){
                    sEcho=value;
                }

            }
            var page=Math.floor(pageOffset/size)+1;
            $.ajax({
                url : sSource111,//这个就是请求地址对应sAjaxSource
                data :{"sort":sort,"order":order,"pageOffset":pageOffset,"size":size,"searchText":searchtext,"page":page,"sEcho":sEcho},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
                type : 'post',
                dataType : 'json',
                async : false,
                success : function(result) {
                    console.info(result)
                    fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
                },
                error : function(msg) {
                }
            });
        }
        var nEditing = null;

        $('#datatable-editable').on('click', 'a.delete-row', function (e) {
            var id=$(this).attr("name");
            var nRow = $(this).parents('tr')[0];
            $.post("${pageContext.request.contextPath}/admin/admin/delete/"+id, function(result){
                if(result.success){
                    oTable.fnDeleteRow( nRow );
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }else{
                    $("#msg >p").text("提示:"+result.msg);
                    $("#msg").removeAttrs("hidden");
                }
                setTimeout(function(){    //设时延迟0.5s执行
                    $("#msg").attr("hidden","hidden");
                },5000)
            },"json");
        } );

    });

</script>

</body>
</html>

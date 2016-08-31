<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>后台管理首页</title>

    <link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style.css?v=2.2.0" rel="stylesheet">

    <!-- datatable插件的css文件 -->
    <link href="${pageContext.request.contextPath}/resources/lib/DataTables-1.10.12/media/css/jquery.dataTables.min.css" rel="stylesheet">

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
            <!-- DataTables Example -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget-container fluid-height clearfix">
                        <div class="heading">
                            <h2>用户管理</h2>
                        </div>
                        <div class="widget-content padded clearfix">
                            <table class="table table-bordered table-striped" id="datatable-editable">
                                <thead>
                                <th width="150px">登陆账号</th>
                                <th width="150px">昵称</th>
                                <th width="150px">密码</th>
                                <th width="100px">性别</th>
                                <th width="200px">生日</th>
                                <th width="100px">电话</th>
                                <th width="200px">创建日期</th>
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


<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pageContext.request.contextPath}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- datatable插件的js文件 -->
<script src="${pageContext.request.contextPath}/resources/lib/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>

<!-- layer弹窗插件 -->
<script src="${pageContext.request.contextPath}/resources/lib/layer/layer.js"></script>

<!-- datatable插件相关的js代码 -->
<script type="text/javascript">
    $(document).ready(function() {
        $("#admin_page").addClass("current");
        var oTable= $("#datatable-editable").dataTable({
            "bProcessing": true, // 是否显示取数据时的那个等待提示
            "bServerSide": true,//这个用来指明是通过服务端来取数据
            "sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
            "iDisplayLength": 10,//每页显示10条数据
            "sAjaxSource": "${pageContext.request.contextPath}/admin/admin/dataTableUser",//这个是请求的地址
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
                        { "mData": "loginName", 'sClass':'center'},
                        { "mData": "username", 'sClass':'center'},
                        { "mData": "password", 'sClass':'center'},
                        { "mData": "sex", 'sClass':'center'},
                        {
                            "mDataProp": "birthday",
                            "bSortable": true,
                            "fnRender": function(obj) {
                                var datetime = new Date();
                                datetime.setTime(obj.aData.birthday);
                                var year = datetime.getFullYear();
                                var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
                                var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
                                var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
                                var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
                                var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
                                return year + "-" + month + "-" + date +" "+hour+":"+minute+":"+second;
                            }
                        },
                        { "mData": "phone", 'sClass':'center'},
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
                        {
                            "mDataProp": "uId",
                            "bSearchable": false,
                            "bSortable": false,
                            "fnRender": function(obj) {
                                var id = obj.aData.uId;
                                var render = '<a targer="_blank" name=' + id + ' class="delete-row" href="#">删除</a>';
                                return render;
                            }
                        }
                    ]
        });

// 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
        function retrieveData( sSource111,aoData111, fnCallback111) {
            var arrayObj=new Array(
                    { "mData": "login_name", 'sClass':'center'},
                    { "mData": "username", 'sClass':'center'},
                    { "mData": "password", 'sClass':'center'},
                    { "mData": "sex", 'sClass':'center'},
                    { "mData": "birthday", 'sClass':'center'},
                    { "mData": "phone", 'sClass':'center'},
                    { "mData": "create_date", 'sClass':'center'}
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
            $.post("${pageContext.request.contextPath}/admin/admin/deleteUser/"+id, function(result){
                if(result.success){
                    oTable.fnDeleteRow( nRow );
                    layer.msg("提示：" + result.msg);
                }else{
                    layer.msg("提示：" + result.msg);
                }
            },"json");
        } );

    });

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

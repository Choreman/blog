<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>上传头像 Demo</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/front-end/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/fullAvatarEditor-2.1/scripts/fullAvatarEditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/fullAvatarEditor-2.1/scripts/swfobject.js"></script>
</head>
<body>
<div style="width:632px;margin: 0 auto;text-align:center">
    <h1 style="text-align:center">富头像上传编辑器演示</h1>
    <div>
        <p id="swfContainer">
            本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
        </p>
    </div>
    <button type="button" id="upload" style="display:none;margin-top:8px;">swf外定义的上传按钮，点击可执行上传保存操作</button>
</div>
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
                                alert('原图片位于服务器的虚拟路径为' + json.content.sourceUrl);
                                alert('头像图片位于服务器的虚拟路径为' + json.content.avatarUrls.join(','));
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
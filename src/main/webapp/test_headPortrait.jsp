<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试上传头像的虚拟路径</title>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.1.min.js"></script>
</head>
<body>
    <p>111</p>
    <img id="my_picture" src="${pageContext.request.contextPath}/resources/head_portrait/jsp_avatar1_20160824162214565v99i673b.jpg" style="border:2px #ff0000;width:200px;height:200px"/>
    <p>222</p>
    <button id="btn" type="button">显示图片</button>

    <script>
        $(document).ready(function(){
            $("#btn").click(function(){
                alert("111");
                $("#my_picture").src = "${pageContext.request.contextPath}/resources/head_portrait/jsp_avatar1_20160824162214565v99i673b.jpg";
                alert("222");
            })
        })
    </script>
</body>
</html>

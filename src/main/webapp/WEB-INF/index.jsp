<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<h1>/WEB-INF/index.jsp</h1>
<h2>selectAdmin</h2>
<table>
    <c:forEach items="${blogAdmins}" var="a">
        <tr>
            <td>${a.loginName}</td>
            <td>${a.username}</td>
            <td>${a.password}</td>
            <td>${a.phone}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

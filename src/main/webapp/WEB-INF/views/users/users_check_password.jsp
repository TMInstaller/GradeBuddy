<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Password</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <form action="${pageContext.request.contextPath}/checkPassword" method="post">
        <label for="password">비밀번호</label><br>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="확인">
    </form>
</div>
</body>
</html>

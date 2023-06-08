<!--이 페이지는 사용자가 개인 정보를 수정할 수 있는 폼을 제공합니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div>
    <h1>Edit Profile</h1>
    <form action="${pageContext.request.contextPath}/updateProfile" method="post">
        <label for="email">이메일</label><br>
        <input type="email" id="email" name="email" value="${user.email}"><br>
        <label for="username">이름</label><br>
        <input type="text" id="username" name="username" value="${user.username}"><br>
        <input type="submit" value="업데이트">
    </form>
</div>
</body>
</html>

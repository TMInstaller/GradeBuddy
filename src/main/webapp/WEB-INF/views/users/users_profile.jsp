<!--이 페이지는 사용자의 개인 정보를 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>User Profile</h1>
    <p>Name: ${user.username}</p>
    <p>Email: ${user.email}</p>
    <!-- 이곳에 사용자 정보를 수정할 수 있는 페이지로 이동할 버튼을 둡니다. -->
    <input class="button_register_page" type="button"
           onclick="window.location.href='${pageContext.request.contextPath}/users/check_password'" value="정보 수정">

</div>
</body>
</html>

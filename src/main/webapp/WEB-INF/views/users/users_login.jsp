<!--이 페이지는 사용자가 로그인 할 수 있는 폼을 제공합니다.-->
<!-- users/login -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/users/login.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>로그인</h1>
    <div class="login_form">
        <form action="${pageContext.request.contextPath}/loginProcess" method="post">
            <label class="form_email_name" for="email">이메일</label><br>
            <input class="form_email_field" type="email" id="email" name="email"><br>
            <label class="form_password_name" for="password">비밀번호</label><br>
            <input class="form_password_field" type="password" id="password" name="password"><br>
            <input class="form_submit_button" type="submit" value="로그인">
        </form>
        <!--회원가입 이동 버튼-->
        <input class="button_register_page" type="button"
               onclick="window.location.href='${pageContext.request.contextPath}/users/register'" value="회원가입">

    </div>
</div>
</body>
</html>

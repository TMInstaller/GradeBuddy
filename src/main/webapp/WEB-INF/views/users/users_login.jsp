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
    <h1 class="login_title">로그인</h1>
    <div class="login_form">
        <form action="${pageContext.request.contextPath}/loginProcess" method="post">
            <div class="input_field">
                <label class="input_label" for="email">이메일</label>
                <input class="input_text" type="email" id="email" name="email">&nbsp;<br>
            </div>
            <div class="input_field">
                <label class="input_label" for="password">비밀번호</label>
                <input class="input_text" type="password" id="password" name="password">&nbsp;<br>
            </div>
            <div class="submit_field">
                <input class="submit_button" type="submit" value="로그인">
            </div>
        </form>
        <button class="button_register" onclick="window.location.href='${pageContext.request.contextPath}/users/register'">계정이 없으신가요?</button>
    </div>
</div>
</body>
</html>

<%--이 페이지는 애플리케이션의 진입점으로 사용되며, 사용자가 처음 애플리케이션에 접속했을 때 보여지는 페이지입니다.
    보통의 경우, 애플리케이션의 주요 기능에 대한 링크나 간단한 소개, 로그인 폼 등이 이 페이지에 위치합니다.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MainPage</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="global/header.jsp" %>
</div>
<div class="content">
    <h1>MainPage</h1> <br>
    <a href="users/login">로그인 페이지로 이동하기</a> <br>
    <a href="users/register">회원가입 페이지로 이동하기</a> <br>
    <a href="assignments/list">과제 페이지로 이동하기</a> <br>
    <a href="submissions/list">제출물 페이지로 이동하기</a> <br>
    <a href="users/profile">내 정보 페이지로 이동하기</a> <br>
</div>
</body>
</html>

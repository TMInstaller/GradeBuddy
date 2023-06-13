<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/global/header_styles.css">
<div class="header">
    <div class="header_logo">
        <a href="/"><img src="${pageContext.request.contextPath}/assets/images/GradeBuddy_logo.png" alt="Logo"></a>
    </div>
    <div class="header_menu">
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/users/login">로그인</a>
                <a href="${pageContext.request.contextPath}/users/register">회원가입</a>
                <a href="${pageContext.request.contextPath}/assignments/list">과제</a>
                <a href="${pageContext.request.contextPath}/submissions/list">제출기록</a>
                <a href="${pageContext.request.contextPath}/feedbacks/list">피드백</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/users/profile">${sessionScope.user.username}님</a>
                <a href="${pageContext.request.contextPath}/logoutProcess">로그아웃</a>
                <a href="${pageContext.request.contextPath}/assignments/list">과제</a>
                <a href="${pageContext.request.contextPath}/submissions/list">제출물</a>
                <a href="${pageContext.request.contextPath}/feedbacks/list">피드백</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

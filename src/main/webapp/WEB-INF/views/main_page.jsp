<%--이 페이지는 애플리케이션의 진입점으로 사용되며, 사용자가 처음 애플리케이션에 접속했을 때 보여지는 페이지입니다.
    보통의 경우, 애플리케이션의 주요 기능에 대한 링크나 간단한 소개, 로그인 폼 등이 이 페이지에 위치합니다.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MainPage</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/main.css">
</head>
<body>
<div class="header">
    <%@ include file="global/header.jsp" %>
</div>
<div class="content">
    <div class="top-rank-dashboard">
        <h1>점수부여 Top 5</h1>
        <table class="top-rank-table">
            <thead>
            <tr>
                <th>Rank</th>
                <th>Username</th>
                <th>Total Score</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="userScore" items="${top5UserScore}" varStatus="status">
                <tr class="rank-item">
                    <td class="rank">${status.count}등</td>
                    <td class="username">${userScore.username}</td>
                    <td class="total-score">${userScore.totalScore} 점</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

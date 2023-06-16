<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>FeedbacksList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
            href="${pageContext.request.contextPath}/assets/css/feedbacks/list.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>FeedbacksList</h1>
    <jsp:useBean id="feedbacks" scope="request" type="java.util.List"/>
    <table class="table">
        <tr>
            <th>Feedback Id</th>
            <th>Feedback Score</th>
            <th>Submission Id</th>
            <th>User Id</th>
            <th>Feedback Comment</th>
        </tr>
        <c:forEach var="feedback" items="${feedbacks}">
            <tr>
                <td>${feedback.feedbackId}</td>
                <td>${feedback.feedbackScore}</td>
                <td>${feedback.submissionsId}</td>
                <td>${feedback.userId}</td>
                <td>${feedback.feedbackComment}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>FeedbacksList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>FeedbacksList</h1>
    <jsp:useBean id="feedbacks" scope="request" type="java.util.List"/>
    <c:forEach var="feedback" items="${feedbacks}">
        <div>
            <h2>FeedbackId: ${feedback.feedbackId}</h2>
            <p>FeedbackScore: ${feedback.feedbackScore}</p>
            <p>SubmissionId: ${feedback.submissionId}</p>
            <p>UserId: ${feedback.userId}</p>
            <p>FeedbackComment: ${feedback.feedbackComment}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>
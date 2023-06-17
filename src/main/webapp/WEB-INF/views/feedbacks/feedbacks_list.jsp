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
            <c:if test="${sessionScope.user.username == 'admin'}">
                <th>삭제하기(관리자)</th>
            </c:if>
            <c:if test="${sessionScope.user.username != 'admin'}">
                <th></th>
            </c:if>
        </tr>
        <c:forEach var="feedback" items="${feedbacks}">
            <tr>
                <td>${feedback.feedbackId}</td>
                <td>
                    <div class="stars">
                        <input class="star star-5" id="star-5-${feedback.feedbackId}" type="radio" <c:if test="${feedback.feedbackScore >= 5}">checked</c:if> disabled/>
                        <label class="star star-5" for="star-5-${feedback.feedbackId}"></label>
                        <input class="star star-4" id="star-4-${feedback.feedbackId}" type="radio" <c:if test="${feedback.feedbackScore >= 4}">checked</c:if> disabled/>
                        <label class="star star-4" for="star-4-${feedback.feedbackId}"></label>
                        <input class="star star-3" id="star-3-${feedback.feedbackId}" type="radio" <c:if test="${feedback.feedbackScore >= 3}">checked</c:if> disabled/>
                        <label class="star star-3" for="star-3-${feedback.feedbackId}"></label>
                        <input class="star star-2" id="star-2-${feedback.feedbackId}" type="radio" <c:if test="${feedback.feedbackScore >= 2}">checked</c:if> disabled/>
                        <label class="star star-2" for="star-2-${feedback.feedbackId}"></label>
                        <input class="star star-1" id="star-1-${feedback.feedbackId}" type="radio" <c:if test="${feedback.feedbackScore >= 1}">checked</c:if> disabled/>
                        <label class="star star-1" for="star-1-${feedback.feedbackId}"></label>
                    </div>
                </td>
                <td>${feedback.submissionsId}</td>
                <td>${feedback.userId}</td>
                <td>${feedback.feedbackComment}</td>
                <td>
                    <c:if test="${sessionScope.user.username == 'admin'}">
                        <a href="${pageContext.request.contextPath}/feedbacks/delete/${feedback.feedbackId}">의견 삭제하기</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

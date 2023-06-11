<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SubmissionList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp"%>
</div>
<div class="content">
    <h1>SubmissionsList</h1>
    <jsp:useBean id="submissions" scope="request" type="java.util.List"/>
    <c:forEach var="submission" items="${submissions}">
        <div>
            <h2>제출정보 ID: ${submission.submissionsId}</h2>
            <p>제출자 ID: ${submission.userId}</p>
            <p>과제 ID: ${submission.assignmentId}</p>
            <p>제출시간: ${submission.submissionTime}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>
<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SubmissionList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/submissions/list.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp"%>
</div>
<div class="content">
    <h1>제출기록(관리자 페이지)</h1>
    <jsp:useBean id="submissions" scope="request" type="java.util.List"/>
    <table class="styled-table">
        <thead>
        <tr>
            <th>제출정보 ID</th>
            <th>제출자 ID</th>
            <th>과제 ID</th>
            <th>제출시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="submission" items="${submissions}">
            <tr>
                <td>${submission.submissionsId}</td>
                <td>${submission.userId}</td>
                <td><a href="${pageContext.request.contextPath}/assignments/detail/${submission.assignmentId}">${submission.assignmentId}</a></td>
                <td>${submission.submissionTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AssignmentList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>AssignmentsList</h1>
    <jsp:useBean id="assignments" scope="request" type="java.util.List"/>
    <c:forEach var="assignment" items="${assignments}">
        <div>
            <h2>제목: <a href="${pageContext.request.contextPath}/assignments/detail/${assignment.assignmentId}">${assignment.assignmentTitle}</a></h2>
            <p>설명: ${assignment.assignmentDescription}</p>
            <p>마감기한: ${assignment.assignmentDeadline}</p>
        </div>
    </c:forEach>
    <a href="${pageContext.request.contextPath}/assignments/create">Create a new assignment</a>
</div>
</body>
</html>
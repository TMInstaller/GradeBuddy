<!--이 페이지는 해당 카테고리의 특정 항목에 대한 상세 정보를 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AssignmentsDetail</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>AssignmentsDetail</h1>
    <jsp:useBean id="assignment" scope="request" type="ac.tukorea.gradebuddy.domain.assignments.Assignment"/>
    <div>
        <h2>제목: <a href="${pageContext.request.contextPath}/assignments/detail/${assignment.assignmentId}">
            ${assignment.assignmentTitle}</a>
        </h2>
        <p>설명: ${assignment.assignmentDescription}</p>
        <p>마감기한: ${assignment.assignmentDeadline}</p>
    </div>
    <a href="${pageContext.request.contextPath}/assignments/edit">Edit this assignment</a>
</div>
</body>
</html>
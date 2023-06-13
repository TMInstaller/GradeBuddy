<!--이 페이지는 해당 카테고리의 특정 항목에 대한 상세 정보를 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AssignmentsDetail</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/assignments/detail.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>제출 과제 상세 페이지</h1>
    <jsp:useBean id="assignment" scope="request" type="ac.tukorea.gradebuddy.domain.assignments.Assignment"/>
    <table class="assignment_detail">
        <tr>
            <th>제출 과제명</th>
            <td>${assignment.assignmentTitle}</td>
        </tr>
        <tr>
            <th>마감기한</th>
            <td>${assignment.assignmentDeadline}</td>
        </tr>
        <tr>
            <th>제출 내용</th>
            <td>${assignment.assignmentDescription}</td>
        </tr>
    </table>
    <a href="${pageContext.request.contextPath}/assignments/edit/${assignment.assignmentId}" class="edit_link">Edit this assignment</a>
</div>
</body>
</html>
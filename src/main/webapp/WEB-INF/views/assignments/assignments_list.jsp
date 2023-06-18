<!--이 페이지는 해당 카테고리의 모든 항목을 목록으로 보여줍니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AssignmentList</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/assignments/list.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1 class="assignment_list_title">제출 과제 목록</h1>
    <a href="${pageContext.request.contextPath}/assignments/create" class="create_button">Create a new assignment</a>
    <jsp:useBean id="assignments" scope="request" type="java.util.List"/>
    <table class="assignments_table">
        <thead>
        <tr>
            <th>제출 과제명</th>
            <th>내용</th>
            <th>마감기한</th>
            <c:if test="${sessionScope.user.username == 'admin'}">
                <th>과제 삭제<br>(관리자)</th>
            </c:if>
            <c:if test="${sessionScope.user.username != 'admin'}">
                <th></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="assignment" items="${assignments}">
            <tr>
                <td class="description">
                    <a href="${pageContext.request.contextPath}/assignments/detail/${assignment.assignmentId}">
                            ${assignment.assignmentTitle}
                    </a>
                </td>
                <td class="description">${assignment.assignmentDescription}</td>
                <td>${assignment.assignmentDeadline}</td>
                <td>
                    <c:if test="${sessionScope.user.username == 'admin'}">
                        <a href="${pageContext.request.contextPath}/assignments/delete/${assignment.assignmentId}">삭제</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
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
    <jsp:useBean id="assignment" scope="request" type="ac.tukorea.gradebuddy.domain.assignments.Assignment"/>
    <h1>
        제출 과제 상세 페이지
        <c:if test="${sessionScope.user.user_id == assignment.userId}">
            (My Assignment)
        </c:if>
    </h1>
    <div>
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
        <c:if test="${assignment.userId == sessionScope.user.user_id}">
            <a href="${pageContext.request.contextPath}/assignments/edit/${assignment.assignmentId}" class="edit_link">
                내용 수정하기
            </a>
        </c:if>
        <c:if test="${!sessionScope.user.user_id.equals(assignment.userId)}">
            <a href="${pageContext.request.contextPath}/feedbacks/create/${assignment.assignmentId}" class="edit_link">
                의견 남기기
            </a>
        </c:if>
        <c:if test="${sessionScope.user.username == 'admin'}">
            <a href="${pageContext.request.contextPath}/assignments/delete/${assignment.assignmentId}">제출내용
                삭제하기(관리자)</a>
        </c:if>
    </div>

    <div>
        <%--댓글 형태로 해당 관련 의견들 모아보는 댓글과 점수 보기 형태로 남겨두기--%>
        <jsp:useBean id="feedbacks" scope="request" type="java.util.List"/>
        <c:if test="${not empty feedbacks}">
            <h2>과제에 대한 의견</h2>
            <div class="feedback-list-container">
                <c:forEach items="${feedbacks}" var="feedback">
                    <div class="feedback-item">
                        <div class="feedback-user">User 식별번호 : ${feedback.userId}</div>
                        <div class="feedback-content">
                            <div class="feedback-score">점수: ${feedback.feedbackScore}</div>
                            <br>
                            <div class="feedback-comment">의견 : ${feedback.feedbackComment}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

</div>
</body>
</html>

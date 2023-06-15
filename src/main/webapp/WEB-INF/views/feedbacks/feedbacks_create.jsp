<!--이 페이지는 새로운 항목을 생성할 수 있는 폼을 제공합니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Feedback</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>Create Feedback</h1>
    <form action="${pageContext.request.contextPath}/feedbacks/create" method="post" class="feedback_form">
        <div class="form_group">
            <label for="submissionsId" class="form_label">Submission ID:</label>
            <input type="number" id="submissionsId" name="submissionsId" value="${submission.submissionsId}" required class="form_input" readonly>
        </div>

        <div class="form_group">
            <label for="userId" class="form_label">User ID:</label>
            <input type="number" id="userId" name="userId" value="${sessionScope.user.user_id}" required class="form_input" readonly>
        </div>

        <div class="form_group">
            <label for="feedbackScore" class="form_label">Feedback Score:</label>
            <input type="number" id="feedbackScore" name="feedbackScore" required class="form_input">
        </div>

        <div class="form_group">
            <label for="feedbackComment" class="form_label">Feedback Comment:</label>
            <textarea id="feedbackComment" name="feedbackComment" required class="form_input"></textarea>
        </div>

        <div class="form_group">
            <input type="submit" value="Create Feedback" class="form_submit">
        </div>
    </form>
</div>
</body>
</html>
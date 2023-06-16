<!--이 페이지는 새로운 항목을 생성할 수 있는 폼을 제공합니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Feedback</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/feedbacks/create.css">
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
            <input type="number" id="feedbackScore" name="feedbackScore" value="1" required class="form_input" hidden>

            <div class="stars">
                <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
                <label class="star star-5" for="star-5"></label>
                <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
                <label class="star star-4" for="star-4"></label>
                <input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
                <label class="star star-3" for="star-3"></label>
                <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
                <label class="star star-2" for="star-2"></label>
                <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
                <label class="star star-1" for="star-1"></label>
            </div>
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
<script>
    // 별점을 선택하면 숨겨진 number 입력 요소의 값도 변경
    document.querySelectorAll('input[name="star"]').forEach((star) => {
        star.addEventListener('change', (event) => {
            document.getElementById('feedbackScore').value = event.target.value;
        });
    });
</script>
</body>
</html>
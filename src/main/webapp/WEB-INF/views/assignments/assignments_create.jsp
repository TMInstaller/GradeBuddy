<!--이 페이지는 새로운 항목을 생성할 수 있는 폼을 제공합니다.-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>AssignmentsCreate</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>AssignmentsCreate</h1>
    <form action="${pageContext.request.contextPath}/assignments/create" method="post">
        <input type="hidden" id="userId" value="${sessionScope.user.user_id}">
        <label for="title">Title</label>
        <input type="text" name="assignmentTitle" id="title" placeholder="title">
        <label for="content">Content</label>
        <input type="text" name="assignmentDescription" id="content" placeholder="content">
        <label for="deadline">Deadline</label>
        <input type="datetime-local" name="assignmentDeadline" id="deadline" placeholder="deadline">
        <input type="submit" value="Create">
    </form>
</div>
</body>
</html>


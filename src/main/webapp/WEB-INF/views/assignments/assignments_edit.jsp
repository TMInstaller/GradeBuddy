<!--이 페이지는 특정 항목을 수정할 수 있는 폼을 제공합니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AssignmentsEdit</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <script>
        function submitForm(Event) {
            event.preventDefault();

            let assignmentId = document.getElementById("assignmentId").value;
            let assignmentTitle = document.getElementById("title").value;
            let assignmentDescription = document.getElementById("description").value;
            let assignmentDeadline = document.getElementById("deadline").value;

            const assignment = {
                assignmentId: assignmentId,
                assignmentTitle: assignmentTitle,
                assignmentDescription: assignmentDescription,
                assignmentDeadline: assignmentDeadline
            };

            fetch('${pageContext.request.contextPath}/assignments/edit/' + assignmentId, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(assignment)
            }).then(response => {
                    if (response.ok) {
                        alert("수정되었습니다.");
                        return response.json();
                    } else {
                        alert("수정에 실패하였습니다.");
                        throw new Error('Failed to update assignment');
                    }
                }).then(json => {
                    window.location.href = '${pageContext.request.contextPath}/assignments/detail/' + assignmentId;
                }
            ).catch(error => {
                console.error(error);
            });
        }
    </script>
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>AssignmentsEdit</h1>
    <jsp:useBean id="assignment" scope="request" type="ac.tukorea.gradebuddy.domain.assignments.Assignment"/>
    <form onsubmit="submitForm(event);">
        <input type="hidden" id="assignmentId" name="assignmentId" value="${assignment.assignmentId}" />
        <div>
            <label for="title">제목:</label>
            <input id="title" name="assignmentTitle" type="text" value="${assignment.assignmentTitle}" required/>
        </div>
        <div>
            <label for="description">설명:</label>
            <textarea id="description" name="assignmentDescription" required>${assignment.assignmentDescription}</textarea>
        </div>
        <div>
            <label for="deadline">마감기한:</label>
            <input id="deadline" name="assignmentDeadline" type="datetime-local" value="${assignment.assignmentDeadline}" required/>
        </div>
        <input type="submit" value="Update assignment"/>
    </form>
</div>
</body>
</html>
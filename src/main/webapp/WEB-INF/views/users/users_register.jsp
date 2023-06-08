<!--이 페이지는 사용자가 새로운 계정을 생성할 수 있는 폼을 제공합니다.-->
<%-- users/register --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/global/global_setting.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/users/register.css">
</head>
<body>
<div class="header">
    <%@ include file="../global/header.jsp" %>
</div>
<div class="content">
    <h1>UsersRegister</h1>
    <form action="${pageContext.request.contextPath}/registerProcess" method="post" class="register_form">
        <div class="form_group">
            <label for="email" class="form_label">Email:</label>
            <input type="email" id="email" name="email" required class="form_input">
            <button id="emailCheck" class="form_button">Email 확인</button>
        </div>

        <div class="form_group">
            <label for="username" class="form_label">Username:</label>
            <input type="text" id="username" name="username" required class="form_input">
        </div>

        <div class="form_group">
            <label for="password" class="form_label">Password:</label>
            <input type="password" id="password" name="password" required class="form_input">
        </div>

        <div class="form_group">
            <label for="passwordConfirm" class="form_label">Password 확인:</label>
            <input type="password" id="passwordConfirm" required class="form_input">
        </div>

        <div class="form_group">
            <input type="submit" value="회원가입" class="form_submit">
        </div>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#emailCheck").click(function (e) {
            e.preventDefault(); // 기본 submit 행위를 중단
            let email = $("#email").val(); // 이메일 필드의 값을 가져옵니다.

            // AJAX POST 요청을 보냅니다.
            $.ajax({
                url: "${pageContext.request.contextPath}/checkEmail",
                type: "POST",
                data: JSON.stringify({email: email}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.exists) {
                        alert("이미 존재하는 이메일입니다.");
                    } else {
                        alert("사용 가능한 이메일입니다.");
                    }
                }
            });
        });
    });
</script>

</body>
</html>
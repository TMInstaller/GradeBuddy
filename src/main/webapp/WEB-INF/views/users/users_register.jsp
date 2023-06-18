<!--이 페이지는 사용자가 새로운 계정을 생성할 수 있는 폼을 제공합니다.-->
<%-- users/register --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
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
    <h1 class="register_title">회원가입</h1>
    <div class="register_form">
        <form action="${pageContext.request.contextPath}/registerProcess" method="post">
            <div class="input_field">
                <label class="input_label" for="email">Email</label>
                <input class="input_text" type="email" id="email" name="email" required><br>
                <button id="emailCheck" class="email_button">Email 확인</button>
            </div>

            <div class="input_field">
                <label class="input_label" for="username">Username</label>
                <input class="input_text" type="text" id="username" name="username" required><br>
            </div>

            <div class="input_field">
                <label class="input_label" for="password">Password</label>
                <input class="input_text" type="password" id="password" name="password" required><br>
            </div>

            <div class="input_field">
                <label class="input_label" for="passwordConfirm">Password 확인</label>
                <input class="input_text" type="password" id="passwordConfirm" required><br>
            </div>
            <div class="submit_field">
                <input class="submit_button" type="submit" value="회원가입">
            </div>
        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#emailCheck").click(function (e) {
            e.preventDefault(); // 기본 submit 행위를 중단
            let email = $("#email").val(); // 이메일 필드의 값을 가져옵니다.
            if(email.length === 0) { // 이메일 필드가 비어있으면 경고창을 띄우고 함수를 종료합니다.
                alert("이메일을 입력해주세요.");
                return;
            }
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
        $('#password, #passwordConfirm').on('keyup', function () {
            let password = $('#password').val();
            let passwordConfirm = $('#passwordConfirm').val();
            if (password.length !== 0 && password === passwordConfirm) {
                $('.submit_button')
                    .attr('disabled', false)
                    .css('background-color', '#4CAF50');
            } else {
                $('.submit_button')
                    .attr('disabled', 'disabled')
                    .css('background-color', '#e0e0e0');
            }
        });
    });
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sign In</title>
            <link rel="stylesheet" href="/css/login.css">
            <link rel="stylesheet" href="/bootstrap-icons-1.11.2/font/bootstrap-icons.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
        </head>
        <style>


        </style>

        <body>
            <div class="wrapper">
                <form:form action="login" modelAttribute="nguoidung" id="loginForm" method="post">

                    <h1>Đăng nhập</h1>
                    <p class="text-success">${mes }</p>
                    <p class="text-danger">${mes2 }</p>
                    <div class="input-box error">
                        <form:input type="text" placeholder="Email hoặc số điện thoại" path="email" id="email" />

                        <form:errors path="email" cssClass="text-danger" />
                    </div>
                    <div class="input-box error">
                        <form:input type="password" placeholder="Mật khẩu" path="password" id="password" />

                        <form:errors path="password" cssClass="text-danger" />
                    </div>

                    <div class="remember-forgot m-2">

                        <a href="forgotpass">Quên mật khẩu?</a>
                    </div>
                    <button type="submit" class="btn">Đăng nhập</button>
                    <div class="register-link">
                        <p>Bạn không có tài khoản? <a href="register">Đăng ký</a></p>
                    </div>
                </form:form>
            </div>
            <script>

            </script>
        </body>

        </html>
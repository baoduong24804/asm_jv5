<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/register.css">
    <link rel="stylesheet" href="/bootstrap-icons-1.11.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>

    <div class="wrapper">
        <form:form id="registerForm" modelAttribute="nguoidung" method="post" action="register">

            <h1>Đăng ký</h1>
            <p class="text-success">${mes }</p>
			 <p class="text-danger">${mes2 }</p>
            <div class="input-box error">
                <form:input type="text" placeholder="Nhập Username" path="username" id="username" />
          
                
                 <form:errors path="username" cssClass="text-danger"/>
            </div>
            <div class="input-box error ">
                <form:input type="text" placeholder="Email" path="email" id="email" />
             
                <form:errors path="email" cssClass="text-danger"/>
            </div>

            <div class="input-box error ">
                <form:input type="password" placeholder="Mật khẩu" path="password" id="password-input" />
   
               <form:errors path="password" cssClass="text-danger"/>
            </div>
            
            <div class="input-box error ">
            	<input type="password" name="confirmpassword" placeholder="Xác nhận mật khẩu" id="confirm-password">
			<span class="text-danger">${err }</span>
            </div>
            <div class="show-pass">
            <input type="checkbox" id="show-btn" class="form-check-input me-1"><label>Hiển thị mật khẩu</label>
            </div>
            <button type="submit" class="btn">Đăng ký</button>
            <div class="login-link">
                <p>Bạn đã có tài khoản? <a href="login" >Đăng nhập</a></p>
            </div>
        </form:form>
    </div>

    <script >
    const showPasswordCheckbox = document.getElementById('show-btn');
    const passwordInput = document.getElementById('password-input');
    const passwordInput2 = document.getElementById('confirm-password');
    showPasswordCheckbox.addEventListener('change', function () {
      if (this.checked) {
        passwordInput.type = 'text'; // Chuyển sang kiểu text để hiển thị
        passwordInput2.type = 'text'; // Chuyển sang kiểu text để hiển thị
      } else {
        passwordInput.type = 'password'; // Chuyển về kiểu password để ẩn
        passwordInput2.type = 'password';
      }
    });
    </script>
    
</body>
</html>

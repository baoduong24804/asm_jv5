<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="ASM/bootstrap-icons-1.11.2/font/bootstrap-icons.css">
</head>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url('ASM/image/background2.jpg') no-repeat;
    background-size: cover;
    background-position: center;
}

.wrapper {
    width: 450px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, .2);
    color: white;
    backdrop-filter: blur(20px);
    box-shadow: 0 0 10px rgba(0, 0, 0, .2);
    counter-reset: #fff;
    border-radius: 10px;
    padding: 30px 40px;
    overflow: hidden;
    
}

.wrapper h1 {
    font-size: 36px;
    text-align: center;
}

.wrapper .input-box {
    position: relative;
    width: 100%;
    height: 50px;
    margin: 40px 0;
}
.wrapper .input-box.error small{ 
    color: red; 
    margin: 10px 0 0 15px;
    font-size: 13px;

}

.wrapper .icon-close {
    position: absolute;
    top: 0;
    right: 0;
    width: 45px;
    height: 45px;
    background: gray;
    font-size: 2em;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom-left-radius:10px ;
}
.wrapper .icon-close:hover{
    cursor: pointer;
    background-color: darkgrey;
}

.input-box input {
    width: 100%;
    height: 100%;
    background-color: transparent;
    border: none;
    outline: none;
    border: 2px solid white;
    border-radius: 30px;
    font-size: 16px;
    color: white;
    padding: 20px 45px 20px 20px;
}

.input-box input::placeholder {
    color: white;
    font-weight: 500;
}

.input-box i {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 20px;
}

.wrapper .remember-forgot {
    display: flex;
    justify-content: space-between;
    font-size: 14.5px;
    margin: -15px 0 15px;
}

.remember-forgot label input {
    accent-color: grey;
    margin-right: 3px;
    cursor: pointer;
}

.remember-forgot a {
    color: cornflowerblue;
    font-weight: 600;
    text-decoration: none;
}

.remember-forgot a:hover {
    text-decoration: underline;
}

.wrapper .btn {
    width: 100%;
    height: 50px;
    background-color: #fff;
    border: none;
    outline: none;
    border-radius: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, .1);
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    color: #333;

}

.wrapper .register-link {
    font-size: 14.5px;
    text-align: center;
    margin: 20px 0 15px;
}

.register-link p a {
    color: cornflowerblue;
    text-decoration: none;
    font-weight: 600;
}

.register-link p a:hover {
    text-decoration: underline;
}

.input-box .show-pass a i{
    color: white;
    text-decoration: none;
    font-weight: 600;
}
</style>
<body>
    <div class="wrapper">
      
        <form id="loginForm">
          <span class="icon-close">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
              </svg>
          </span>
          <h1>Tạo mật khẩu mới</h1>
          <div class="input-box error">
            <input type="password" placeholder="Mật khẩu" id="password" />
            <div
              class="show-pass"
              onclick="togglePassword('password', 'password-icon')"
            >
              <a href="#" class="btn-showpass">
                <i id="password-icon" class="bi bi-eye"></i>
              </a>
            </div>
            <small></small>
          </div>
          <div class="input-box error">
            <input
              type="password"
              placeholder="Xác nhận mật khẩu"
              id="confirm-password"
            />
            <div
              class="show-pass"
              onclick="togglePassword('confirm-password', 'confirm-password-icon')"
            >
              <a href="#" class="btn-showpass">
                <i id="confirm-password-icon" class="bi bi-eye"></i>
              </a>
            </div>
            <small></small>
          </div>
          <button type="submit" class="btn">Xác nhận</button>
        </form>
      </div>
      <script>
        function togglePassword(inputId, iconId) {
            var passwordInput = document.getElementById(inputId);
            var passwordIcon = document.getElementById(iconId);
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                passwordIcon.classList.remove("bi-eye");
                passwordIcon.classList.add("bi-eye-fill");
            } else {
                passwordInput.type = "password";
                passwordIcon.classList.remove("bi-eye-fill");
                passwordIcon.classList.add("bi-eye");
            }
        }
    
        document.querySelector('.icon-close').addEventListener('click', function() {
            document.getElementById('loginForm').reset();
        });
    </script>
</body>
</html>
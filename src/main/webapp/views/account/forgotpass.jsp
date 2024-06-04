<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="/bootstrap-icons-1.11.2/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

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
	background: url('/image/background2.jpg') no-repeat;
	background-size: cover;
	background-position: center;
}

.wrapper {
	width: 450px;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	color: black;
	background-color: rgba(255, 255, 255, 0.8);
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
	margin: 30px 0;
}

.wrapper .input-box.error small {
	color: red;
	margin: 10px 0 0 15px;
	font-size: 13px;
}

.input-box .ID-send {
	display: flex;
	position: relative;
	width: 100%;
	height: 50px;
	margin: 30px 0;
}

.input-box input {
	width: 100%;
	height: 100%;
	background-color: transparent;
	border: none;
	outline: none;
	border: 2px solid black;
	border-radius: 30px;
	font-size: 16px;
	color: black;
	padding: 20px 45px 20px 20px;
}

.input-box input::placeholder {
	color: black;
	font-weight: 500;
}

.input-box .input-send {
	width: 75%;
}

.input-box .btn:hover {
	background-color: #00ff00;
}

.btn {
	display: flex; /* Kích hoạt flexbox */
	align-items: center; /* Căn giữa theo chiều dọc */
	justify-content: center; /* Căn giữa theo chiều ngang (nếu cần) */
}

.btn a {
	white-space: nowrap; /* Ngăn chữ xuống dòng */
}

.input-box .btn {
	width: 40%;
	padding: 10px; border : 2px solid black;
	border-radius: 30px;
	margin-left: 20px;
	background-color: #fff;
	transition: background-color 0.3s ease;
	outline: none;
	border-radius: 30px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
	color: black;
	border: 2px solid black;
}

.wrapper .btn1:hover {
	background-color: rgb(15, 228, 240);
}

.wrapper .btn1 {
	width: 100%;
	height: 50px;
	background-color: #fff;
	outline: none;
	border-radius: 30px;
	transition: background-color 0.3s ease;
	box-shadow: 0 0 10px rgba(0, 0, 0, .1);
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	color: black;
	border: none;
}

.input-box button {
	width: 50px;
}

.input-box i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
}

.login-link  a {
	color: #3027d8;
	text-decoration: none;
	font-weight: 600;
}

.login-link  a:hover {
	text-decoration: underline;
}
</style>
<body>
	<div class="wrapper">
		<form id="forgotPass" action="forgotpass" method="post">
			<h1>Quên mật khẩu</h1>
			<p class="text-success">${mes }</p>
			<p class="text-danger">${mes2 }</p>
			<div class="input-box error">
				<input type="text" value="${email }" placeholder="Email hoặc số điện thoại"
					name="email" id="email" />


			</div>
			<div class="input-box error">
				<div class="ID-send">
					<input type="text" placeholder="Nhập mã xác nhận"
						class="input-send" id="input-sendID" name="OTP" />
					<button type="submit" id="btn-send" name="btn-send-otp" value="true" class="btn">Gửi mã</button>
				</div>
			</div>
			<button type="submit" class="btn1">Xác nhận</button>
			<div class="login-link m-2">
				<a href="login">Đăng nhập</a>
			</div>
		</form>
	</div>
	<script>
		
	</script>
</body>
</html>
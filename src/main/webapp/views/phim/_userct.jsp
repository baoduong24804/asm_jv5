<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="text-white text-center font-weight-bold">User</h1>
	<ul class="nav flex-column">

		<li onclick="changeURL('control/nguoidung',6)"
			class="nav-item menu-item "><a
			class="nav-link text-white"><i class="fas fa-user"></i> Người
				dùng</a></li>
		<li onclick="changeURL('control/chitietnguoidung',7)"
			class="nav-item menu-item "><a
			class="nav-link text-white"><i class="fas fa-info-circle"></i>
				Chi tiết người dùng</a></li>
		<li onclick="changeURL('control/yeuthich',8)"
			class="nav-item menu-item "><a
			class="nav-link text-white"><i class="fas fa-heart"></i> Yêu
				thích</a></li>
	</ul>
</body>
</html>
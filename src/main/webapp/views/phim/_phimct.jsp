<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="text-white text-center">Phim</h1>
	<ul class="nav flex-column">
		<li onclick="changeURL('control',0)"
			class="nav-item menu-item ${not empty action && action == 0 ? 'bg-primary' : '' }"><a
			class="nav-link text-white btn-option"> <i
				class="fas fa-chart-bar"></i>Thống kê
		</a></li>
		<li onclick="changeURL('control/phim',1)"
			class="nav-item menu-item ${not empty action && action == 1 ? 'bg-primary' : '' }"><a
			class="nav-link text-white btn-option"> <i class="fas fa-film"></i>Phim
		</a></li>
		<li onclick="changeURL('control/chitietphim',2)"
			class="nav-item menu-item ${not empty action && action == 2 ? 'bg-primary' : '' }"><a
			class="nav-link text-white btn-option"> <i
				class="fas fa-info-circle"></i> Chi tiết phim
		</a></li>
		<li onclick="changeURL('control/tapphim',3)"
			class="nav-item menu-item ${not empty action && action == 3 ? 'bg-primary' : '' }"><a
			class="nav-link text-white btn-option"><i
				class="fas fa-play-circle"></i> Tập phim</a></li>
		<li onclick="changeURL('control/nhasx',4)"
			class="nav-item menu-item ${not empty action && action == 4 ? 'bg-primary' : '' }"><a
			class="nav-link text-white"><i class="fas fa-industry"></i> Nhà
				sản xuất, tác giả</a></li>
		<li onclick="changeURL('control/phanloai',5)"
			class="nav-item menu-item ${not empty action && action == 5 ? 'bg-primary' : '' }"><a
			class="nav-link text-white"><i class="fas fa-tags"></i> Phân loại</a></li>
	</ul>
</body>
</html>
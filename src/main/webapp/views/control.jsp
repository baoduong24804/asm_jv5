<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/char.css">



<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript" src="/js/control2.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://kit.fontawesome.com/11f5ba3935.js"
	crossorigin="anonymous"></script>
</head>
<style>
.white-hr {
	border: none;
	height: 2px;
	background-color: white;
}

.hidden {
	display: none;
}

.selected {
	background-color: blue;
}

.sidebar {
	transition: transform 0.5s ease;
	/* Thiết lập hiệu ứng chuyển động kéo dài 0.5 giây */
}

#main {
	transition: transform 0.5s ease;
	/* Thiết lập hiệu ứng chuyển động kéo dài 0.5 giây */
}

#toggle-nav {
	max-width: 10px;
}

ul>li {
	cursor: pointer;
}

h3 {
	cursor: pointer;
}

.online {
	background-color: #66BB6A; 
	padding: 2px 4px; 
	border: 2px solid 0;
    border-radius: 10px; 
}
.offline {
	background-color: #FF5733; 
	padding: 2px 4px; 
	border: 2px solid 0;
    border-radius: 10px; 
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    background-color: #007bff; 
    border: 1px solid black; 
    color: #fff; /* Màu chữ trắng */
}
@keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    .reloading {
        display: inline-block;
        animation: spin 1s linear infinite;
    }
.page-item {
    display: inline-block;
    padding: 8px 16px;
    margin: 0 4px;
    border-radius: 4px;
    border: 1px solid #ddd;
    background-color: #f8f9fa;
    color: #007bff;
    text-decoration: none; /* Loại bỏ gạch chân nếu có */
    cursor: pointer;
    font-family: Arial, sans-serif; /* Chỉnh sửa font nếu cần */
}

.page-item:hover {
    background-color: #e9ecef;
    color: #0056b3;
}

.page-item.active {
    background-color: #007bff;
    color: white;
    border: 1px solid #007bff;
}

.page-item.disabled {
    color: #6c757d;
    cursor: not-allowed;
    background-color: #e9ecef;
}
.manager {
            background-color: #d1ecf1;
            color: #0c5460;
            padding: 2px 4px;
            border: 2px solid transparent;
            border-radius: 10px;
        }
        .member {
            background-color: #d4edda;
            color: #155724;
            padding: 2px 4px;
            border: 2px solid transparent;
            border-radius: 10px;
        }
        .member-vip {
            background-color: #f8d7da;
            color: #721c24;
            padding: 2px 4px;
            border: 2px solid transparent;
            border-radius: 10px;
        }

</style>
<body>
	<div class="container-fluid">

		<div class="row">
			<!-- 
			<button id="toggle-nav" class="bg-info"></button>
			 -->



			<nav id="nav" class="col-md-2 d-md-block bg-dark sidebar pt-3 pb-3">

				<div class="text-center m-2">
				<img style="width: 50px;height: 50px;border-radius: 50%" alt="" src="https://th.bing.com/th/id/OIP.PqBYGErQeWQWhbA_VeUBDQHaHa?rs=1&pid=ImgDetMain">
					<p class="text-white text-truncate">Ty Bao</p>
					<hr class="white-hr">
				</div>

				<div class="sidebar-sticky">
					<%@ include file="_phimct.jsp"%>
					<hr class="white-hr">
					<%@ include file="_userct.jsp"%>
					<hr class="white-hr">
					<%@ include file="_other.jsp"%>

				</div>
			</nav>



			<!-- giao dien chinh -->
			<main id="main" role="main" class="col-md-10">
				<!-- Content will be loaded here -->
				
			</main>

		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
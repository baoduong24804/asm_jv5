<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
				<link rel="stylesheet" href="/css/control.css">
				<!-- css -->
				<link rel="stylesheet" type="text/css" href="/css/char.css">


				<!-- js -->
				<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
				<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
				<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
				<script type="text/javascript" src="/js/control.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				<script src="https://kit.fontawesome.com/11f5ba3935.js" crossorigin="anonymous"></script>
			</head>



			<body>
				<div class="container-fluid">

					<div class="row vh-100">


						<nav id="nav" class="col-md-2 d-md-block bg-dark sidebar pt-3 pb-3">

							<div class="text-center m-2">
								<img id="userimg" style="width: 50px;height: 50px;border-radius: 50%" alt=""
									src="https://th.bing.com/th/id/OIP.PqBYGErQeWQWhbA_VeUBDQHaHa?rs=1&pid=ImgDetMain">
								<p class="text-white text-truncate" id="username">Ty Bao</p>
								<hr class="white-hr">
							</div>

							<div class="sidebar-sticky">
								<%@ include file="_phimct.jsp" %>
									<hr class="white-hr">
									<%@ include file="_userct.jsp" %>
										<hr class="white-hr">
										<%@ include file="_other.jsp" %>
											<div class="mt-5 text-center text-white">
												<hr class="white-hr">
												<h3>Chuyển hướng</h3>
												<p><i class="fa-solid fa-arrow-right"></i><a href="/">Trang tổng hợp</a>
												</p>

											</div>
							</div>
						</nav>



						<!-- giao dien chinh -->
						<main id="main" role="main" class="col-md-10">
							<!-- Content will be loaded here -->

						</main>

					</div>
				</div>



				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
			</body>

			</html>
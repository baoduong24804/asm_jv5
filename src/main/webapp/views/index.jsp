<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<title>Trang Chủ</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<link rel="stylesheet" href="/css/index.css">

			<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
				integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
				crossorigin="anonymous"></script>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
				integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
				crossorigin="anonymous"></script>

			<script src="https://kit.fontawesome.com/11f5ba3935.js" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script type="text/javascript" src="/js/index.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

		</head>


		<body id="body" class="body-dark">



			<!-- tapmoi -->
			<section id="news" class="container mt-4">
				<section class="row">

					<!-- HEADER -->
					<div class="col-md-12">
						<header class="row">
							<div class="col-md-6">
								<a href="/animu/home" class="text-decoration-none text-white"> <img
										src="/image/logoanime.jpg" alt="" width="80px" height="80px"
										class="rounded-circle" /> <span class="fw-bold fs-3 theme-dark" id="webname">
										CROWN FILMS</span>
								</a>
							</div>

							<div class="col-md-6 text-white text-end">



								<div class="m-3">

									<a href="?lang=en" class="btn btn-primary mr-2 rounded-4">English</a>
									<a href="?lang=vi" class="btn btn-primary mr-2 rounded-4">Tiếng việt</a>
									<c:if test="${not empty user}">
										<a href="/animu/user">
											<img src="/image/userlogo.jpg" alt="UserImage" width="50px" height="50px"
												class="rounded-circle">
										</a>
									</c:if>
									<c:if test="${empty user}">
										<a href="/animu/login">
											<img src="/image/userlogo.jpg" alt="UserImage" width="50px" height="50px"
												class="rounded-circle">
										</a>
									</c:if>

								</div>
								<i id="theme" class="fa-regular fa-sun fs-3 theme-dark"></i>













							</div>
						</header>
					</div>
					<!-- NAVBAR -->

				</section>
				<c:choose>
					<c:when test="${empty user}">

						<div class="alert alert-dismissible fade show custom-alert text-white text-center mt-3 mb-3"
							role="alert" style="background-color: rgba(0, 0, 0, 0.5);">

							<span class="alert-message">
								<img src="https://s199.imacdn.com/slider/2016/01/6688a321030e165ee5e1e11c1bc844eb.jpg"
									class="img-fluid" alt="Image">
							</span>
							<button type="button" class="btn-close" style="background-color: aliceblue;"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${user.role == 0}">
							<div class="alert alert-dismissible fade show custom-alert text-white text-center mt-3 mb-3"
								role="alert" style="background-color: rgba(0, 0, 0, 0.5);">

								<span class="alert-message">
									<img src="https://s199.imacdn.com/slider/2016/01/6688a321030e165ee5e1e11c1bc844eb.jpg"
										class="img-fluid" alt="Image">
								</span>
								<button type="button" class="btn-close" style="background-color: aliceblue;"
									data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>

					</c:otherwise>
				</c:choose>






				<div class="text-center mt-3 mb-3">
					<img style="max-height: 400px; width: 100%;"
						src="https://as01.epimg.net/meristation/imagenes/2021/03/13/reportajes/1615633069_923466_1616262218_noticia_normal.jpg"
						class="img-fluid" alt="Image">
				</div>
				<h3 class="text-danger fw-bold hover">${tapmoi }</h3>
				<div class="row">
					<c:forEach items="${movies}" var="movie">
						<div class="col-md-3 mb-3 position-relative">

							<a href="/animu/listmovie/information/${movie.slug}"
								class="text-white text-decoration-none">
								<img src="${movie.poster_url }" alt="" class="img-fluid"
									style="width: 100%; height: 100%" />
								<div class="text-white position-absolute bottom-0"
									style="background-color: rgba(0, 0, 0, 0.5); max-width: 100%;">

									<span style="font-size: 18px" class="fw-bold ellipsis-span">${movie.tieude}</span>

								</div>
							</a>


						</div>
					</c:forEach>
				</div>
			</section>
			<!-- BO SUU TAP -->
			<section id="album" class="container">
				<h3 style="cursor: pointer;" class="text-danger fw-bold hover">${bosuutap }</h3>
				<div class="row d-flex">
					<div class="col-md-4">
						<img src="https://s199.imacdn.com/vg/2024/04/03/40090a46a7da0ef1_80e070ce96d5c820_14294017121300547118684.jpg"
							alt="" class="img-fluid" />
					</div>
					<div class="col-md-8 row p-0 m-0">
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2023/12/18/34300209fba3863f_d95555fb4f601c15_13396917028928171185710.jpg"
								alt="" class="img-fluid" width="" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2023/09/21/d256e672999f49d3_e204e82b0f3b26f8_2820816953084767118684.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2023/06/08/9c495aa611ceaf69_27a9622389671c57_10813016862126526185710.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2023/03/02/d66102b20c0df87d_9d5a343f6acdf971_10896816777495647185710.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2023/01/30/68fa82b22b9d4965_d66e4431ce224ac7_2698216750634546118684.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2022/09/02/a17fad944d3cecc5_5ab5fdd64a7f94fd_30967166205716499674.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2022/06/10/09dd799dff4a355b_a6b32d115628ac50_40892165484315239674.jpg"
								alt="" class="img-fluid" />
						</div>
						<div class="col-md-3">
							<img src="https://s199.imacdn.com/vg/2022/03/05/803583cba5d569c2_3c4ab828e8e763bd_117964164647297779674.jpg"
								alt="" class="img-fluid" />
						</div>
					</div>
				</div>
			</section>

		</body>

		</html>
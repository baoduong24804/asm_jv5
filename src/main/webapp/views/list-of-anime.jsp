<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html lang="vi">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Danh sách Anime</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<link rel="stylesheet" href="/css/list-of-anime.css">
			<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script type="text/javascript" src="/js/list-of-anime.js"></script>
			<script src="https://kit.fontawesome.com/11f5ba3935.js" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

		</head>

		<body id="body" class="body-dark">

			<div class="container mt-4">
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
									<img src="/image/userlogo.jpg" alt="UserImage" width="50px" height="50px"
										class="rounded-circle">
								</div>
								<i id="theme" class="fa-regular fa-sun fs-3 theme-dark"></i>

							</div>
						</header>
					</div>
					<!-- NAVBAR -->

				</section>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<form class="m-3" role="search">
							<input class="form-control rounded-5" type="search" placeholder="Tìm kiếm phim..."
								aria-label="Search" name="key" />
						</form>
					</div>
					<div class="col-md-3"></div>
					<h3 class="black-background">Thể loại</h3>
					<div class="text-center d-flex-wrap">
						<div class="nowrap">
							<button class="btn btn-success">
								<a href="/animu/listmovie" class="text-decoration-none text-white">Tất cả
								</a>
							</button>
						</div>
						<c:forEach var="entry" items="${map}">

							<div class="nowrap">
								<button class="btn btn-success">
									<a href="/animu/listmovie?loaiphim=${entry.key}"
										class="text-decoration-none text-white">${entry.value}</a>
								</button>
							</div>
						</c:forEach>

					</div>



				</div>


				<div class="row">


					<button class="btn btn-primary col-md-2 mt-3">Lọc Anime</button>
				</div>



				<div class="row mt-4">

					<c:forEach items="${not empty items ? items : page.content}" var="item">
						<div class="col-md-2 mb-4 position-relative">



							<a href="/animu/listmovie/information/${item.slug}" class="text-white text-decoration-none">
								<img src="${item.poster_url }" alt="" class="img-fluid"
									style="width: 100%; height: 100%" />
								<div class="text-white position-absolute bottom-0"
									style="background-color: rgba(0, 0, 0, 0.5); max-width: 100%;">

									<span style="font-size: 18px" class="fw-bold ellipsis-span">${item.tieude}</span>

								</div>
							</a>





						</div>

					</c:forEach>
				</div>
			</div>
			<h1>


			</h1>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- Các nút chuyển trang -->
					<c:if test="${page.isEmpty() == false}">
						<c:choose>

							<c:when test="${url == '/animu/listmovie'}">
								<li class="page-item <c:if test='${page.number == 0}'>disabled</c:if>">
									<a class="page-link" href="/animu/listmovie?p=0" aria-label="First">
										<span aria-hidden="true">&laquo;&laquo;</span>
									</a>
								</li>
								<li class="page-item <c:if test='${page.number == 0}'>disabled</c:if>">
									<a class="page-link" href="/animu/listmovie?p=${page.number-1}"
										aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach var="i" begin="0" end="${page.totalPages-1}">
									<li class="page-item <c:if test='${i == page.number}'>active</c:if>">
										<a class="page-link" href="/animu/listmovie?p=${i}">
											${i+1}
										</a>
									</li>
								</c:forEach>
								<li class="page-item <c:if test='${page.number == page.totalPages-1}'>disabled</c:if>">
									<a class="page-link" href="/animu/listmovie?p=${page.number+1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								<li class="page-item <c:if test='${page.number == page.totalPages-1}'>disabled</c:if>">
									<a class="page-link" href="/animu/listmovie?p=${page.totalPages-1}"
										aria-label="Last">
										<span aria-hidden="true">&raquo;&raquo;</span>
									</a>
								</li>
							</c:when>
						</c:choose>

					</c:if>

				</ul>
			</nav>


			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>
		</body>

		</html>
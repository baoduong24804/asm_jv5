<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trang Chủ</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	padding: 0;
	margin: 0;
	background-color: #1E293B;
	overflow-x: hidden;
}

.carousel-item{
	height: 500px;
}

header {
	height: 90px;
	padding: 0 15px;
	position: relative;
	z-index: 1;
}

/* Hide search and login on small screens */
@media ( max-width : 767.98px) {
	.d-md-block {
		display: none !important;
	}
}

@media ( min-width : 980px) {
	.d-lg-none {
		display: none !important;
	}
}

.d-none h1 {
	font-family: Impact;
	font-size: 100px;
	color: whitesmoke;
	letter-spacing: 0.3px;
	text-shadow: 0 0 2px black;
	padding-bottom: 0px;
	border-bottom: 1px dotted gray;
	margin: 0px;
	text-decoration: none;
}

.d-none h4 {
	margin-top: 5px;
	letter-spacing: 0.5px;
	color: azure;
	text-shadow: 0 0 5px black;
}

.carousel-caption {
	position: absolute;
	text-align: center;
}

.carousel-caption a {
	text-decoration: none;
}

@media ( max-width : 768px) {
	.d-none h1 {
		font-size: 50px;
	}
	.d-none h4 {
		font-size: 20px;
	}
	.carousel-caption {
		bottom: 100px;
	}
}
</style>
<body>
	<!-- HEADER -->
	<section class="row">
		<!-- HEADER -->
		<div class="container col-md-12">
			<header class="d-flex row">
				<div class="col-md-4 text-start">
					<a href="#" class="text-decoration-none text-white"> <img
						src="/image/logo.jpg" alt="" width="20%" /> <span
						class="fw-bold fs-3"> CROWN FILMS</span>
					</a>
				</div>
				<div class="col-md-4 text-center">
					<form class="d-flex mt-4 d-md-block" role="search">
						<input class="form-control rounded-5" type="search"
							placeholder="Tìm kiếm phim..." aria-label="Search" />
					</form>
				</div>
				<div class="col-md-4 text-white">
					
					<div class="link-login mt-3 text-end d-md-block">
					
					
					<a href="/animu/login"
							class="text-decoration-none text-white mt-5"> <img
							src="/image/userlogo.jpg" alt="UserImage" width="10%"
							class="rounded-circle"> <c:if test="${not empty userCurrent }">
							<span>Welcom, ${userCurrent.username }</span>
					 			</c:if>
					 			<c:if test="${ empty userCurrent }">
					 			<span>Đăng nhập/ Đăng ký</span>
					 			</c:if>
						</a>
					
						
					</div>
				</div>
			</header>
		</div>
		<!-- NAVBAR -->
		<div class="container-fluid col-md-12 p-0">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-center"
						id="navbarSupportedContent">
						<form class="d-flex mt-3 mt-lg-0 d-lg-none m-2" role="search">
							<input class="form-control rounded-5" type="search"
								placeholder="Tìm kiếm phim..." aria-label="Search" />
						</form>
						<ul class="navbar-nav mb-2 mb-lg-0">
							<li class="nav-item dropdown"><a
								class="nav-link me-3 ms-2 text-white fw-bold fs-5" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									THỂ LOẠI </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link me-3 ms-2 text-white fw-bold fs-5" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									PHIM BỘ </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link me-3 ms-2 text-white fw-bold fs-5" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									PHIM LẺ </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link me-3 ms-2 text-white fw-bold fs-5" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									PHIM CHIẾU RẠP </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link me-3 ms-2 text-white fw-bold fs-5" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									THỊNH HÀNH </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
						</ul>
						<div class="link-login mb-3 d-lg-none">
							<a href="#" class="text-decoration-none text-white mt-5"> <img
								src="/image/userlogo.jpg" alt="UserImage" width="10%"
								class="rounded-circle" /> <span> Đăng
									nhập / Đăng ký</span>
							</a>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</section>
	<!-- BACKGROUND CHAY CHAY -->
	<section id="title">
		<div id="carouselExampleCaptions" class="carousel slide mt-4"
			data-bs-ride="carousel" data-bs-interval="2500">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/image/background1.jpg" class="d-block m-auto"
						alt="..." width="1300px" />
					<div class="carousel-caption d-none d-md-block">
						<a href="#">
							<h1>THE BALANCE OF FATE</h1>
						</a>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/image/theworldend.jpg" class="d-block m-auto"
						alt="..." width="1300px" />
					<div class="carousel-caption d-none d-md-block">
						<a href="#">
							<h1>THE WORLD'S END</h1>
						</a>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/image/background3.jpg" class="d-block m-auto"
						alt="..." width="1300px" />
					<div class="carousel-caption d-none d-md-block">
						<a href="#">
							<h1>DEATH DAY</h1>
						</a>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/image/background4.jpg" class="d-block m-auto"
						alt="..." width="1300px" />
					<div class="carousel-caption d-none d-md-block">
						<a href="#">
							<h1>GODZILLA</h1>
						</a>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>
	<!-- TAP MOI -->
	<!-- 
	<section id="news" class="container mt-4">
		<h3 class="text-danger fw-bold">TẬP MỚI</h3>
		<div class="row">
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-6 col-md-3 mb-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/15/24866a398fa6c916_c08471510d631a8e_17933217131909734118684.jpg"
					alt="" class="img-fluid" />
			</div>
		</div>
	</section>
	 -->
	<section id="news" class="container mt-4">
    <h3 class="text-danger fw-bold">TẬP MỚI</h3>
    <div class="row">
        <c:forEach items="${movies}" var="movie">
            <div class="col-6 col-md-3 mb-4 position-relative">
                <img
                    src="https://img.freepik.com/free-photo/anime-style-character-space_23-2151134100.jpg"
                    alt=""
                    class="img-fluid"
                />
                <div
                    class="title text-white position-absolute bottom-0"
                    style="
              background: linear-gradient(
                to top,
                rgba(0, 0, 0, 0.7),
                rgba(0, 0, 0, 0)
              );
              width: 306px;
               height: 60px;
            "
                >
                    <div class="row">
                        <div class="col-md-7" style="font-size: 15px">
                            <a href="" class="text-white text-decoration-none">
                                <span style="font-size: 20px" class="fw-bold ms-1">${movie.tieude}</span>
                                <br>
                                <span style="margin-left: 5px">Tổng tập:</span>
                            </a>
                        </div>
                        <div class="col-md-5 text-end">
                            <br />
                            <span style="font-size: 15px; margin-right: 5px">Lượt xem:</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
	<!-- BO SUU TAP -->
	<section id="album" class="container">
		<h3 class="text-danger fw-bold">BỘ SƯU TẬP</h3>
		<div class="row d-flex">
			<div class="col-md-4">
				<img
					src="https://s199.imacdn.com/vg/2024/04/03/40090a46a7da0ef1_80e070ce96d5c820_14294017121300547118684.jpg"
					alt="" class="img-fluid" />
			</div>
			<div class="col-md-8 row">
				<div class="col-md-3 mb-2">
					<img
						src="https://s199.imacdn.com/vg/2023/12/18/34300209fba3863f_d95555fb4f601c15_13396917028928171185710.jpg"
						alt="" class="img-fluid" width="" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2023/09/21/d256e672999f49d3_e204e82b0f3b26f8_2820816953084767118684.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2023/06/08/9c495aa611ceaf69_27a9622389671c57_10813016862126526185710.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2023/03/02/d66102b20c0df87d_9d5a343f6acdf971_10896816777495647185710.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2023/01/30/68fa82b22b9d4965_d66e4431ce224ac7_2698216750634546118684.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2022/09/02/a17fad944d3cecc5_5ab5fdd64a7f94fd_30967166205716499674.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2022/06/10/09dd799dff4a355b_a6b32d115628ac50_40892165484315239674.jpg"
						alt="" class="img-fluid" />
				</div>
				<div class="col-md-3">
					<img
						src="https://s199.imacdn.com/vg/2022/03/05/803583cba5d569c2_3c4ab828e8e763bd_117964164647297779674.jpg"
						alt="" class="img-fluid" />
				</div>
			</div>
		</div>
	</section>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

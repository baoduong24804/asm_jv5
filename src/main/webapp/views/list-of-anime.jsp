<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh sách Anime</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/list-of-data.css">
</head>
<body>
	<section class="row">
		<!-- HEADER -->
		<div class="container col-md-12">
			<header class="d-flex row">
				<div class="col-md-4 text-start">
					<a href="#" class="text-decoration-none text-white"> <img
						src="../image/logo.jpg" alt="" width="20%" /> <span
						class="fw-bold fs-3"> CROWN FILMS</span>
					</a>
				</div>
				<div class="col-md-4 text-center">
					<form class="d-flex mt-4 d-md-block" role="search">
						<input class="form-control rounded-5" type="search"
							placeholder="Tìm kiếm phim..." aria-label="Search" />
					</form>
				</div>
				<div class="col-md-4">
					
				</div>
			</header>
		</div>
		<!-- NAVBAR -->

	</section>
	<div class="container mt-4">
		<div class="row">
			<div class="col text-center row">
				<button class="btn btn-success col-sm-1">
					<a href="/animu/listmovie?theloai=all"
						class="text-decoration-none text-white">Tất cả Anime</a>
				</button>
				<c:forEach
					items="${not empty phanloai ? phanloai : phanloai.content}"
					var="phanloai">
					<button class="btn btn-success col-sm-1"
						onclick="handlePhanLoaiClick('${phanloai.theloai}')">
						<a href="/animu/listmovie?theloai=${phanloai.theloai}"
							class="text-decoration-none text-white">${phanloai.theloai}</a>
					</button>
				</c:forEach>

			</div>
		</div>

		<div class="container mt-4">
			<div class="row">
				<div class="col text-start row">
					
					<div class="dropdown d-inline col-md-2 mt-3">
						<button class="btn btn-secondary w-100" type="button"
							id="dropdownTheLoai" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Thể Loại</button>
						<div class="dropdown-menu row" aria-labelledby="dropdownTheLoai">
							<label class="dropdown-item"> <input type="checkbox"
								name="category" value="Hành Động"> Hành Động
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Võ Thuật"> Võ Thuật
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Âm Nhạc"> Âm Nhạc
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Đời Thường"> Đời Thường
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Thể Thao"> Thể Thao
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Viễn Tưởng"> Viễn Tưởng
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Hài Hước"> Hài Hước
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Chuyển Sinh"> Chuyển Sinh
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Giả Tưởng"> Giả Tưởng
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Kịch Tính"> Kịch Tính
							</label>
						</div>
					</div>

				
					<div class="dropdown d-inline col-md-2 mt-3">
						<button class="btn btn-secondary w-100" type="button"
							id="dropdownTrangThai" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Trạng Thái</button>
						<div class="dropdown-menu" aria-labelledby="dropdownTrangThai">
							<label class="dropdown-item"> <input type="checkbox"
								name="category" value="Lãng Mạn"> Lãng Mạn
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Trường Học"> Trường Học
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Phiêu Lưu"> Phiêu Lưu
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Robot"> Robot
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Pháp Thuật"> Pháp Thuật
							</label>
						</div>
					</div>

					
					<div class="dropdown d-inline col-md-2 mt-3">
						<button class="btn btn-secondary w-100" type="button"
							id="dropdownMovieTV" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Movie/TV</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMovieTV">
							<label class="dropdown-item"> <input type="checkbox"
								name="category" value="Kinh Dị"> Kinh Dị
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Trinh Thám"> Trinh Thám
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Siêu Nhiên"> Siêu Nhiên
							</label> <label class="dropdown-item"> <input type="checkbox"
								name="category" value="Game"> Game
							</label>
						</div>
					</div>

					<button class="btn btn-primary col-md-2 mt-3">Lọc Anime</button>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			
			<c:forEach items="${not empty items ? items : page.content}"
				var="item">
				<div class="col-md-2 mb-4">
					<div class="card card-custom">
						<a href="#" class="text-decoration-none text-white"> <img
							src="${item.poster_url }"
							alt="Card image" style="height: 270px">
							<div class="text-container">
								<div class="card-title" style="font-size: 17px;">${item.tieude}</div>
								<div class="card-info" style="font-size: 13px;">1 / 18 tập</div>
								<div class="view-count" style="font-size: 13px;">3,997
									lượt xem</div>
							</div>
						</a>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
	<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <!-- Các nút chuyển trang -->
        <c:choose>
            <c:when test="${url == '/animu/listmovie'}">
                <li class="page-item <c:if test='${page.number == 0}'>disabled</c:if>">
                    <a class="page-link"
                       href="/animu/listmovie?theloai=${theloai}&p=0"
                       aria-label="First">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
                <li class="page-item <c:if test='${page.number == 0}'>disabled</c:if>">
                    <a class="page-link"
                       href="/animu/listmovie?theloai=${theloai}&p=${page.number-1}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach var="i" begin="0" end="${page.totalPages-1}">
                    <li class="page-item <c:if test='${i == page.number}'>active</c:if>">
                        <a class="page-link"
                           href="/animu/listmovie?theloai=${theloai}&p=${i}">
                            ${i+1}
                        </a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test='${page.number == page.totalPages-1}'>disabled</c:if>">
                    <a class="page-link"
                       href="/animu/listmovie?theloai=${theloai}&p=${page.number+1}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li class="page-item <c:if test='${page.number == page.totalPages-1}'>disabled</c:if>">
                    <a class="page-link"
                       href="/animu/listmovie?theloai=${theloai}&p=${page.totalPages-1}"
                       aria-label="Last">
                        <span aria-hidden="true">&raquo;&raquo;</span>
                    </a>
                </li>
            </c:when>
        </c:choose>
    </ul>
</nav>
 

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>

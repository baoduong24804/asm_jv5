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
	
	    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      rel="stylesheet"
    />

</head>
<style>

        .white-hr {
        border: none;
        height: 2px;
        background-color: white;
       }
      .form-section {
        display: none;
      }
      .form-section.active {
        display: block;
      }
      .sidebar-sticky {
        height: 100%;
        overflow-y: auto;
      }
      .sidebar-sticky {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        height: 100vh;
        padding-top: 20px;
      }
      .sidebar-sticky ul {
        padding-left: 0;
      }
      .sidebar-sticky li {
        transition: all 0.3s ease;
      }
      .sidebar-sticky li:hover {
        transform: translateX(10px);
      }
      .sidebar-sticky .nav-link {
        display: flex;
        align-items: center;
      }
      .sidebar-sticky .nav-link i {
        margin-right: 10px;
      }
    </style>

<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-dark sidebar ">
				<div class="sidebar-sticky">
					<h1 class="text-white text-center">Admin</h1>
					<ul class="nav flex-column">
						<li class="nav-item"><a
							class="nav-link text-white btn-option" href=""
							onclick="showForm('phim',event)"><i class="fas fa-film"></i>
								Phim</a></li>
						<li class="nav-item"><a
							class="nav-link text-white btn-option" href=""
							onclick="showForm('chitietphim',event)"><i
								class="fas fa-info-circle"></i> Chi tiết phim</a></li>
						<li class="nav-item"><a
							class="nav-link text-white btn-option" href=""
							onclick="showForm('tapphim',event)"><i
								class="fas fa-play-circle"></i> Tập phim</a></li>
								<li class="nav-item">
                <a
                  class="nav-link text-white"
                  href="#"
                  onclick="showForm('nhasanxuat')"
                  ><i class="fas fa-industry"></i> Nhà sản xuất</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link text-white"
                  href="#"
                  onclick="showForm('phanloai')"
                  ><i class="fas fa-tags"></i> Phân loại</a
                >
              </li>
            </ul>
            <hr class="white-hr">
            <ul class="nav flex-column">
              <h1 class="text-white text-center font-weight-bold">User</h1>
              <li class="nav-item">
                <a
                  class="nav-link text-white"
                  href="#"
                  onclick="showForm('nguoidung')"
                  ><i class="fas fa-user"></i> Người dùng</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link text-white"
                  href="#"
                  onclick="showForm('chitietnguoidung')"
                  ><i class="fas fa-info-circle"></i> Chi tiết người dùng</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link text-white"
                  href="#"
                  onclick="showForm('yeuthich')"
                  ><i class="fas fa-heart"></i> Yêu thích</a
                >
              </li>
					</ul>
					<hr>
				</div>
			</nav>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
				<!-- Form Phim -->
				<div id="phim-form" class="form-section active">
					<ul class="nav nav-tabs" id="phimTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="phim-edition-tab" data-toggle="tab" href="#phim-edition"
							role="tab">Chỉnh sửa</a></li>
						<li class="nav-item"><a class="nav-link" id="phim-list-tab"
							data-toggle="tab" href="#phim-list" role="tab">Danh sách</a></li>
					</ul>
					<div class="tab-content">

						<div class="tab-pane fade show active" id="phim-edition"
							role="tabpanel">
							<h2 class="mt-3">
								Chỉnh sửa Phim <span class="text-primary"><c:if
										test="${not empty editPhim }">[Đang làm việc idphim: ${editPhim.idphim }]</c:if></span>
							</h2>
							<h5 class="text-primary">${mes }</h5>
							<f:form action="phim" modelAttribute="phim" method="get">
								<div class="form-group">
									<label for="idphim">ID phim:</label>
									<f:input path="idphim" cssClass="form-control"
										value="${editPhim.idphim }" id="idphim" />

								</div>
								<div class="form-group">
									<label for="phim-tieude">Tiêu đề:</label>
									<f:input path="tieude" cssClass="form-control"
										value="${editPhim.tieude }" id="tieude" />
								</div>
								<div class="form-group">
									<label for="phim-slug">Slug:</label>
									<f:input path="slug" cssClass="form-control"
										value="${editPhim.slug }" id="slugg" />

								</div>
								<div class="form-group">
									<label for="phim-thumb_url">Thumb URL:</label>
									<f:input path="thumb_url" cssClass="form-control"
										value="${editPhim.thumb_url }" id="thumb_url" />

								</div>

								<div class="form-group">
									<label for="phim-poster_url">Poster URL:</label>
									<f:input path="poster_url" cssClass="form-control"
										value="${editPhim.poster_url }" id="poster_url" />

								</div>
								<div class="form-group form-check">

									<input type="checkbox" name="active" value="true"
										${editPhim.active == true ? 'checked' : '' }> <label
										class="form-check-label" for="phim-active">Active</label>
								</div>

								<button type="submit" class="btn btn-primary"
									name="btn-them-phim" value="true">Thêm</button>
								<button type="submit" class="btn btn-success"
									name="btn-chinh-sua-phim" value="true">Chỉnh sửa</button>
								<a href="phim?clear=true" class="btn btn-warning">Làm mới</a>
							</f:form>
						</div>
						<div class="tab-pane fade" id="phim-list" role="tabpanel">
							<h2 class="mt-3">Danh sách Phim</h2>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID phim</th>
										<th>Tiêu đề</th>
										<th>Slug</th>
										<th>Ngày tạo</th>
										<th>Thumb URL</th>

										<th>Poster URL</th>
										<th>Active</th>
										<th>Khác</th>
									</tr>
								</thead>
								<tbody>
									<!-- Dữ liệu thêm cho chơi -->
									<c:forEach items="${listphim }" var="item">
										<tr>
											<td>${item.idphim }</td>
											<td>${item.tieude }</td>
											<td>${item.slug }</td>
											<td>${item.ngaytao }</td>
											<td>${item.thumb_url }</td>
											<td>${item.poster_url }</td>
											<th>${item.active == true ? 'Online' : 'Offline' }</th>
											<td><a class="btn btn-primary"
												href="phim?action=1&idphim=${item.idphim }">Chỉnh sửa</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- Form Chi tiết Phim -->
				<div id="chitietphim-form" class="form-section">
					<ul class="nav nav-tabs" id="chitietphimTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="chitietphim-edition-tab" data-toggle="tab"
							href="#chitietphim-edition" role="tab">Chỉnh sửa</a></li>
						<li class="nav-item"><a class="nav-link"
							id="chitietphim-list-tab" data-toggle="tab"
							href="#chitietphim-list" role="tab">Danh sách</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="chitietphim-edition"
							role="tabpanel">
							<h2 class="mt-3">
								Chỉnh sửa Chi tiết phim <span class="text-primary"><c:if
										test="${not empty editPhim }">[Đang làm việc idphim: ${editPhim.idphim }]</c:if></span>
							</h2>
							<f:form action="phim" modelAttribute="chitietphim" method="get">
								<div class="form-group">
									<label for="chitietphim-idphim">ID phim:</label>

									<f:input path="idphim" cssClass="form-control"
										value="${chiTietPhim.idphim }" />
								</div>
								<div class="form-group">
									<label for="chitietphim-tengoc">Tên gốc:</label>
									<f:input path="tengoc" cssClass="form-control"
										value="${chiTietPhim.tengoc }" />

								</div>
								<div class="form-group">
									<label for="chitietphim-tongsotap">Tổng số tập:</label>
									<f:input path="tongsotap" cssClass="form-control"
										value="${chiTietPhim.tongsotap }" />

								</div>

								<div class="form-group">
									<label for="chitietphim-tapmoinhat">Tập mới nhất:</label>
									<f:input path="tapmoinhat" cssClass="form-control"
										value="${chiTietPhim.tapmoinhat }" />

								</div>
								<div class="form-group">
									<label for="chitietphim-thoigian">Thời gian:</label>
									<f:input path="thoigian" cssClass="form-control"
										value="${chiTietPhim.thoigian }" />

								</div>
								<div class="form-group">
									<label for="chitietphim-chatluong">Chất lượng:</label>
									<f:input path="chatluong" cssClass="form-control"
										value="${chiTietPhim.chatluong }" />

								</div>
								<div class="form-group">
									<label for="chitietphim-mota">Mô tả:</label> <br>


									<textarea name="mota" rows="3" style="width: 100%">${chiTietPhim.mota }</textarea>


								</div>
								<!-- <div class="form-group">
                                    <label for="chitietphim-ngaychinhsua">Ngày chỉnh sửa:</label>
                                    <input type="date" class="form-control" id="chitietphim-ngaychinhsua" name="ngaychinhsua">
                                </div> -->

								<button type="submit" name="btn-chitiet" value="true"
									class="btn btn-primary">Lưu</button>
							</f:form>
							<form></form>
						</div>
						<div class="tab-pane fade" id="chitietphim-list" role="tabpanel">
							<h2 class="mt-3">Danh sách Chi tiết phim</h2>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID phim</th>
										<th>Tên gốc</th>
										<th>Tổng số tập</th>

										<th>Tập mới nhất</th>
										<th>Thời gian</th>
										<th>Chất lượng</th>

										<th>Ngày chỉnh sửa</th>

										<th>Mô tả</th>
										<th>Khác</th>
									</tr>
								</thead>
								<tbody>
									<!-- Dữ liệu thêm cho chơi -->
									<c:if test="${not empty chiTietPhim }">

										<tr>
											<td>${chiTietPhim.idphim }</td>
											<td>${chiTietPhim.tengoc }</td>
											<td>${chiTietPhim.tongsotap }</td>
											<td>${chiTietPhim.tapmoinhat }</td>
											<td>${chiTietPhim.thoigian }</td>
											<td>${chiTietPhim.chatluong }</td>
											<td>${chiTietPhim.ngaychinhsua }</td>
											<td>${chiTietPhim.mota }</td>
											<td><a class="btn btn-primary"
												href="phim?action=2&idphim=${chiTietPhim.idphim }">Chỉnh
													sửa</a></td>
										</tr>
									</c:if>





								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- Form Tập phim -->
				<div id="tapphim-form" class="form-section">
					<ul class="nav nav-tabs" id="tapphimTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="tapphim-edition-tab" data-toggle="tab"
							href="#tapphim-edition" role="tab">Chỉnh sửa</a></li>
						<li class="nav-item"><a class="nav-link"
							id="tapphim-list-tab" data-toggle="tab" href="#tapphim-list"
							role="tab">Danh sách</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tapphim-edition"
							role="tabpanel">
							<h2 class="mt-3">
								Chỉnh sửa Tập phim <span class="text-primary"><c:if
										test="${not empty editPhim }">[Đang làm việc idphim: ${editPhim.idphim }]</c:if></span>
							</h2>
							<f:form action="phim" modelAttribute="tapphim" method="get">
								<div class="form-group">
									<label for="tapphim-idtapphim">ID Tập phim:</label>
									<f:input path="idtapphim" cssClass="form-control"
										value="${tapPhim.idtapphim }" />

								</div>
								<div class="form-group">
									<label for="tapphim-idphim">ID Phim:</label>
									<f:input path="phim.idphim" cssClass="form-control"
										value="${editPhim.idphim }" />

								</div>
								<div class="form-group">
									<label for="tapphim-server">Server:</label>
									<f:input path="server" cssClass="form-control"
										value="${tapPhim.server }" />

								</div>
								<div class="form-group">
									<label for="tapphim-tentap">Tên tập:</label>
									<f:input path="tentap" cssClass="form-control"
										value="${tapPhim.tentap }" />

								</div>
								<div class="form-group">
									<label for="tapphim-slug">Slug:</label>
									<f:input path="slug" cssClass="form-control"
										value="${tapPhim.slug }" />

								</div>
								<div class="form-group">
									<label for="tapphim-link">Link:</label>
									<f:input path="link" cssClass="form-control"
										value="${tapPhim.link }" />

								</div>
								<div class="form-group">
									<label for="tapphim-link2">Link 2:</label>
									<f:input path="link2" cssClass="form-control"
										value="${tapPhim.link2 }" />

								</div>
								<button type="submit" class="btn btn-primary"
									name="btnThemTapPhim" value="true">Thêm</button>
								<button type="submit" class="btn btn-success"
									name="btnChinhSuaTapPhim" value="true">Chỉnh sửa</button>
							</f:form>

						</div>

						<div class="tab-pane fade" id="tapphim-list" role="tabpanel">
							<h2 class="mt-3">Danh sách Tập phim</h2>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID Tập phim</th>
										<th>ID Phim</th>
										<th>Server</th>
										<th>Tên tập</th>
										<th>Slug</th>
										<th>Link</th>
										<th>Link 2</th>
										<th>Khác</th>
									</tr>
								</thead>
								<tbody>
									<!-- Dữ liệu mẫu -->
									<c:forEach items="${listTapPhim }" var="item">
										<tr>
											<td>${item.idtapphim }</td>
											<td>${item.phim.idphim }</td>
											<td>${item.server }</td>
											<td>${item.tentap }</td>
											<td>${item.slug }</td>
											<td>${item.link }</td>
											<td>${item.link2 }</td>
											<td><a class="btn btn-primary"
												href="phim?action=3&idphim=${item.phim.idphim }&idtapphim=${item.idtapphim}">Chỉnh
													sửa</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>

	window.addEventListener("popstate", handleURLChange());
		function handleURLChange() {
			// Lấy giá trị của tham số 'tab' từ URL

			const urlParams = new URLSearchParams(window.location.search);
			const action = urlParams.get('action');
			const formSections = document.querySelectorAll('.form-section');
			const btn = document.querySelectorAll('.btn-option');
			if(action == null){
				btn[0].classList.add('bg-primary');
				formSections[0].classList.add('active');
				formSections[1].classList.remove('active');
				formSections[2].classList.remove('active');
			}
			if(action == 1){
				btn[0].classList.add('bg-primary');
				formSections[0].classList.add('active');
				formSections[1].classList.remove('active');
				formSections[2].classList.remove('active');
			}
			if(action == 2){
				btn[1].classList.add('bg-primary');
				formSections[1].classList.add('active');
				formSections[0].classList.remove('active');
				formSections[2].classList.remove('active');
			}
			if(action == 3){
				btn[2].classList.add('bg-primary');
				formSections[0].classList.remove('active');
				formSections[1].classList.remove('active');
				formSections[2].classList.add('active');
				
			}
		}
	
		

		/** 
		

		function handleClick(value,event) {
		    event.preventDefault();  // Ngăn sự kiện mặc định của thẻ a, tức là ngăn chuyển trang
		    const formSections = document.querySelectorAll('.form-section');
			const btn = document.querySelectorAll('.btn-option');
		    const url = new URL(event.currentTarget.href);  // Lấy URL từ thuộc tính href của thẻ a
			for (let i = 0; i < formSections.length; i++) {
			  formSections[i].classList.remove('active');
			}
		for (let i = 0; i < btn.length; i++) {
			btn[i].classList.remove('bg-primary');
			}
		    // Lấy giá trị của tham số 'action' từ URL
		    const action = url.searchParams.get('action');

		    // Kiểm tra giá trị của 'action'
		    if(value == '1'){
				formSections[0].classList.add('active');
				btn[0].classList.add('bg-primary');
			}
			if(value == '2'){
				formSections[1].classList.add('active');
				btn[1].classList.add('bg-primary');
			}
			if(value == '3'){
				const tab1 = document.getElementById("tapphim-edition");
				const tab2 = document.getElementById("tapphim-list");
				tab2.classList.remove("show");
				tab2.classList.remove("active");
				tab1.classList.add('show');
				tab1.classList.add('active');
				formSections[2].classList.add('active');
				btn[2].classList.add('bg-primary');
			}
		}
		
		 **/
		function showForm(value, event) {
			event.preventDefault();
			const formSections = document.querySelectorAll('.form-section');
			const btn = document.querySelectorAll('.btn-option');
			for (let i = 0; i < formSections.length; i++) {
				formSections[i].classList.remove('active');
			}
			for (let i = 0; i < btn.length; i++) {
				btn[i].classList.remove('bg-primary');
			}
			if (value == 'phim') {
				formSections[0].classList.add('active');
				btn[0].classList.add('bg-primary');
			}
			if (value == 'chitietphim') {
				formSections[1].classList.add('active');
				btn[1].classList.add('bg-primary');
			}
			if (value == 'tapphim') {
				formSections[2].classList.add('active');
				btn[2].classList.add('bg-primary');
			}

		};

		$(document).ready(function() {
			$('.nav-tabs a').on('click', function(e) {
				e.preventDefault();
				$(this).tab('show');
			});
		});
	</script>
</body>

</html>
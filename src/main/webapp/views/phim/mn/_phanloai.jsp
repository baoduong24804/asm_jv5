<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Form Chi tiết Phim -->
<div id="phanloai-form" class="form-section active">
	<ul class="nav nav-tabs" id="phanloaiTab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="phanloai-edition-tab" data-toggle="tab"
			href="#phanloai-edition" role="tab">Chỉnh sửa</a></li>
		<li class="nav-item"><a class="nav-link"
			id="phanloai-list-tab" data-toggle="tab" href="#phanloai-list"
			role="tab">Danh sách</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="phanloai-edition"
			role="tabpanel">
			<h2 class="mt-3">Chỉnh sửa Phân loại</h2>
			<f:form action="phim/edit/phanloai" modelAttribute="phanLoai" method="post">
				<div class="form-group">
					<label for="">ID phim:</label>

					<f:input path="idphim" cssClass="form-control"
						value="${phanLoai.idphim }" />
				</div>
				<div class="form-group">
					<label for="">Loại phim( ngăn cách bằng dấu phẩy ',' ):</label>
					<f:input path="loaiphim" cssClass="form-control"
						value="${phanLoai.loaiphim }" />

				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="">Thể loại( ngăn cách bằng dấu phẩy ',' ):</label>
						<f:input path="theloai" cssClass="form-control"
							value="${phanLoai.theloai }" />

					</div>
					<div class="form-group col-md-6">
						<label for="">Quốc gia( ngăn cách bằng dấu phẩy ',' ):</label>
						<f:input path="quocgia" cssClass="form-control"
							value="${phanLoai.quocgia }" />

					</div>
				</div>
				<div class="form-group">
					<label for="">Năm:</label>
					<f:input path="nam" cssClass="form-control"
						value="${phanLoai.nam }" />

				</div>


				<button type="submit" name="btn-sua-phanloai" value="true"
					class="btn btn-success">Chỉnh sửa</button>
			</f:form>
			<form></form>
		</div>
		<div class="tab-pane fade" id="phanloai-list" role="tabpanel">
			<h2 class="mt-3">Danh sách Phân loại</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID phim</th>
						<th>Loại phim</th>
						<th>Thể loại</th>

						<th>Quốc gia</th>
						<th>Năm</th>
						
						<th>Khác</th>
					</tr>
				</thead>
				<tbody>
					<!-- Dữ liệu thêm cho chơi -->
					
					<c:if test="${not empty phanloai }">

						<tr>
							<td>${phanloai.idphim }</td>
							<td>${phanloai.loaiphim }</td>
							<td>${phanloai.theloai }</td>
							<td>${phanloai.quocgia }</td>
							<td>${phanloai.nam }</td>
							
							<td><a class="btn btn-primary"
								href="phim/edit/phanloai/${phanloai.idphim }">Chỉnh sửa</a></td>
						</tr>
					</c:if>





				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Form Tập phim -->
<div id="tapphim-form" class="form-section active">
	<ul class="nav nav-tabs" id="tapphimTab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="tapphim-edition-tab" data-toggle="tab" href="#tapphim-edition"
			role="tab">Chỉnh sửa</a></li>
		<li class="nav-item"><a class="nav-link" id="tapphim-list-tab"
			data-toggle="tab" href="#tapphim-list" role="tab">Danh sách</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="tapphim-edition"
			role="tabpanel">
			<h2 class="mt-3">
				Chỉnh sửa Tập phim <span class="text-primary">
			</h2>
			<f:form action="phim/edit/tapphim" modelAttribute="tapphim" method="post">
				<div class="row">
					<div class="form-group col-md-6">
						<label for="tapphim-idtapphim">ID Tập phim:</label>
						<f:input path="idtapphim" cssClass="form-control"
							value="${tapPhim.idtapphim }" />

					</div>
					<div class="form-group col-md-6">
						<label for="tapphim-idphim">ID Phim:</label>
						<f:input path="phim.idphim" cssClass="form-control"
							value="${editPhim.idphim }" />

					</div>
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
				<button type="submit" class="btn btn-primary" name="btn-them-tap-phim"
					value="true">Thêm</button>
				<button type="submit" class="btn btn-success"
					name="btn-chinh-sua-tap-phim" value="true">Chỉnh sửa</button>
					<a href="phim/delete/tapphim/${tapPhim.idtapphim }" class="btn btn-danger">Xóa</a>
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
								href="phim/edit/tapphim/${item.idtapphim }">Chỉnh
									sửa</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</div>
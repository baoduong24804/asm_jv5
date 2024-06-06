<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								Chỉnh sửa Phim 
							</h2>
							<span class="text-success">${mesSuccessPhim }</span>
							<span class="text-danger">${mesErrorPhim }</span>
							<h5 class="text-primary">${mes }</h5>
							<f:form action="phim/edit" modelAttribute="phim" method="post">
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
								<a href="phim/clear" class="btn btn-warning">Làm mới</a>
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
												href="phim/edit/${item.idphim }">Chỉnh sửa</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
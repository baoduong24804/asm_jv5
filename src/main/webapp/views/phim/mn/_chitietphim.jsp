<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Form Chi tiết Phim -->
				<div id="chitietphim-form" class="form-section active">
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
								Chỉnh sửa Chi tiết phim 
							</h2>
							<span class="text-success">${mesSuccessChiTietPhim }</span>
							<f:form action="phim/edit/chitietphim" modelAttribute="chitietphim" method="post">
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
								<div class="row">
								<div class="form-group col-md-6">
									<label for="chitietphim-tongsotap">Tổng số tập:</label>
									<f:input path="tongsotap" cssClass="form-control"
										value="${chiTietPhim.tongsotap }" />

								</div>
								<div class="form-group col-md-6">
									<label for="chitietphim-tapmoinhat">Tập mới nhất:</label>
									<f:input path="tapmoinhat" cssClass="form-control"
										value="${chiTietPhim.tapmoinhat }" />

								</div>
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

								<button type="submit" name="btn-chinh-sua-chi-tiet-phim" value="true"
									class="btn btn-success">Chỉnh sửa</button>
						
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
												href="phim/edit/chitietphim/${chiTietPhim.idphim }">Chỉnh
													sửa</a></td>
										</tr>
									</c:if>





								</tbody>
							</table>
						</div>
					</div>
				</div>
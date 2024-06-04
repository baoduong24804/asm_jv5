<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Form Chi tiết Phim -->
<div id="nhasx-form" class="form-section active">
	<ul class="nav nav-tabs" id="nhasxTab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="nhasx-edition-tab" data-toggle="tab"
			href="#nhasx-edition" role="tab">Chỉnh sửa</a></li>
		<li class="nav-item"><a class="nav-link"
			id="nhasx-list-tab" data-toggle="tab" href="#nhasx-list"
			role="tab">Danh sách</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="nhasx-edition"
			role="tabpanel">
			<h2 class="mt-3">Chỉnh sửa Nhà sản xuất</h2>
			<f:form action="phim/edit/nhasx" modelAttribute="nhasanxuat" method="post">
				<div class="form-group">
					<label for="">ID nhà sản xuất:</label>

					<f:input path="idnhasxvadv" cssClass="form-control"
						value="${nhasanxuat.idnhasxvadv }" />
				</div>
				<div class="form-group">
					<label for="">ID phim:</label>
					<f:input path="idphim" cssClass="form-control"
						value="${nhasanxuat.idphim }" />

				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="">Vai trò:</label>
						
						<input disabled="disabled" type="text" value="${nhasanxuat.vaitro == true ? 'Tác giả' : 'Nhà sản xuất' }">

					</div>
					<div class="form-group col-md-12">
						<label for="">Thông tin:</label>
						<textarea name="ten" rows="3" style="width: 100%">${nhasanxuat.ten }</textarea>

					</div>
				</div>
				
				
				<button type="submit" name="btn-sua-nhasx" value="true"
					class="btn btn-success">Chỉnh sữa</button>
			</f:form>
			<form></form>
		</div>
		<div class="tab-pane fade" id="nhasx-list" role="tabpanel">
			<h2 class="mt-3">Danh sách Nhà sản xuất</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID Nhà SX và DV</th>
						<th>ID Phim</th>
						<th>Vai trò</th>

						<th>Thông tin</th>
						
						<th>Khác</th>
					</tr>
				</thead>
				<tbody>
					<!-- Dữ liệu thêm cho chơi -->
					
					<c:forEach items="${nhaXSVaDienViens }" var="item">
					
					<tr>
							<td>${item.idnhasxvadv }</td>
							<td>${item.idphim }</td>
							<td>${item.vaitro == true ? 'Tác giả' : 'Nhà sản xuất' }</td>
							<td>${item.ten }</td>
							
							<td><a class="btn btn-primary"
								href="phim/edit/nhasx/${item.idnhasxvadv }">Chỉnh sửa</a></td>
						</tr>
					</c:forEach>

						
					





				</tbody>
			</table>
		</div>
	</div>
</div>
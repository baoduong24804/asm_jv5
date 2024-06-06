<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<h1>Gửi Mail</h1>

	<!-- Form Section -->

	<div class="form-group">
		<label for="selectOption">Chọn khoảng thời gian</label> <select
			class="form-control" id="selectOption">
			<option value="all">Tất cả</option>
			<option value="year">Trên 1 năm</option>
		</select>
	</div>
	<form enctype="multipart/form-data" action="/animu/control/guimail"
		method="post">
		<div class="form-group">
			<label for="from">From</label> <input type="text"
				class="form-control" id="from" name="from"
				value="Animu with love <animu@gmail.com>" readonly>
		</div>
		<div class="form-group">
			<label for="subject">Tiêu đề</label> <input type="text"
				class="form-control" id="subject" name="subject"
				value="Animu thông báo">
		</div>
		<div class="form-group">
			<label>Nội dung tin nhắn</label>
			<textarea class="form-control" name="text" rows="5"
				style="width: 100%"></textarea>
		</div>

		<div class="form-group">
			<label>Tệp đính kèm</label> <input class="form-control" name="file"
				type="file" multiple>
		</div>

		<div class="form-check">
			<input class="form-check-input" type="radio" name="options"
				id="option1" value="true" checked="checked"> <label
				class="form-check-label" for="option1">CC</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="options"
				id="option2" value="false"> <label
				class="form-check-label" for="option2">BCC</label>
		</div>


		<span class="text-info" id="mes">${mes }</span> <br>


		<button type="submit" class="btn btn-primary" id="btn-send">Gửi
			Mail</button>
		<button type="button" class="btn btn-info" id="btn-load">Thêm
			và hiển thị lên bảng</button>
	</form>




	<!-- Table Section -->
	<table class="table table-striped mt-4">
		<thead>
			<tr>
				<th scope="col">STT</th>
				<th scope="col">Email</th>
				<th scope="col">Username</th>
				<th scope="col">Trạng Thái</th>
			</tr>
		</thead>
		<tbody id="userTableBody">

			<!-- Add more rows as needed -->
		</tbody>
	</table>
</div>

<script type="text/javascript">
const btn = document.getElementById('btn-load');

btn.onclick = () =>{
	var selectedOption = $('#selectOption').val();
	var tbody = $('#userTableBody');
	tbody.empty();
	$.ajax({
        url: '/api/nguoidung/ngaytao/'+selectedOption, // Replace with your API endpoint
        method: 'GET',
        success: function(data) {
        	
        	var html = "";
        	
        	data.forEach((item,index) => {
        		console.log(item);
        		html += "<tr> scope='row'>"+(index)+"</th> <td>"+(index + 1)+"</td> <td>"+(item.email)+"</td> <td>"+(item.username)+"</td> <td>Ok</td> </tr>"
        	})
        	tbody.append(html);
        },
        error: function(error) {
            console.error('Error fetching user data:', error);
        }
    });
	
	
}


</script>
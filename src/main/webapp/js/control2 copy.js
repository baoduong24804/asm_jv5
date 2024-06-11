function loading() {

	if ($('#mes').hasClass('text-danger') || $('#mes').hasClass('text-success')) {
		$('#mes').removeClass();
	}
	//var idphim = $('#idphim').val();
	$('#mes').addClass('reloading');
	$('#mes').html('<i class="fas fa-sync-alt"></i>');


}



function loaded(result) {
	$('#mes').removeClass();
	$('#mes').html('');
	$('#mes').empty();
	var mes = result.split(',');
	if (mes[0] == 0) {// thong bao loi

		$('#mes').text(mes[1]);

		$('#mes').addClass('text-danger');
	} else {// thong bao thanh cong
		$('#mes').text(mes[1]);
		$('#mes').addClass('text-success');
	}
}

function postwithfile(url, data, callback) {
	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		processData: false, // Important
		contentType: false, // Important
		success: function (result) {
			callback(result);
		}
	});
}

function getAPI(url, callback) {
	$.ajax({
		url: url,
		type: "GET",
		success: function (result) {
			callback(result);
		}
	});
}

function PostAPINotJson(url, data, callback) {
	$.ajax({
		url: url,
		type: "POST",
		data: data,
		success: function (result) {

			callback(result);
		}
	});
}

function PostAPI(url, data, callback) {
	$.ajax({
		url: url,
		type: "POST",
		contentType: 'application/json',
		data: JSON.stringify(data),
		success: function (result) {

			callback(result);
		}
	});
}

function loadChar() {
	const ctx = document.getElementById('myChart').getContext('2d');
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const totalUsers = document.getElementById('total-users').innerText;
	const totalMovies = document.getElementById('total-movies').innerText;

	new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ['Users', 'Movies'],
			datasets: [{
				label: '# of Items',
				data: [totalUsers, totalMovies],
				backgroundColor: ['#36A2EB', '#FF6384'],
				hoverBackgroundColor: ['#36A2EB', '#FF6384'],
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
		}
	});

	new Chart(ctx2, {
		type: 'doughnut',
		data: {
			labels: ['Users', 'Movies'],
			datasets: [{
				label: '# of Items',
				data: [totalUsers, totalMovies],
				backgroundColor: ['#36A2EB', '#FF6384'],
				hoverBackgroundColor: ['#36A2EB', '#FF6384'],
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
		}
	});
}

//phân trang
function phantrang(result) {
	var movies = result;

	var currentPage = 1;
	var moviesPerPage = 10; // Số phim mỗi trang

	function displayMovies(movies, page) {
		var startIndex = (page - 1) * moviesPerPage;

		var endIndex = startIndex + moviesPerPage;
		var paginatedMovies = movies.slice(startIndex, endIndex);


		var movieList = $('#table-body');
		movieList.empty();

		$.each(paginatedMovies, function (index, movie) {
			var date = new Date(movie.ngaytao);


			// Lấy thời gian theo múi giờ Việt Nam (GMT+7)
			var vietnamOffset = 7 * 60; // GMT+7 trong phút
			var localOffset = date.getTimezoneOffset(); // Phút lệch so với GMT của giờ địa phương
			var vietnamTime = new Date(date.getTime() + (vietnamOffset + localOffset) * 60 * 1000);

			// Lấy các thành phần ngày giờ theo múi giờ Việt Nam
			var hours = vietnamTime.getHours().toString().padStart(2, '0');
			var minutes = vietnamTime.getMinutes().toString().padStart(2, '0');
			var seconds = vietnamTime.getSeconds().toString().padStart(2, '0');
			var day = vietnamTime.getDate().toString().padStart(2, '0');
			var month = (vietnamTime.getMonth() + 1).toString().padStart(2, '0'); // Tháng bắt đầu từ 0
			var year = vietnamTime.getFullYear();


			var ngay = `Ngày${day} Tháng ${month} Năm ${year}`;
			var thoigian = `${hours}Giờ ${minutes}Phút ${seconds}Giây`;
			//console.log(formattedDatetime);
			var listItem = $('<tr class="movie-item text-center">');
			listItem.append('<td>' + movie.idphim + '</td>');
			listItem.append('<td>' + movie.tieude + '</td>');
			listItem.append('<td>' + movie.slug + '</td>');
			listItem.append('<td>' + ngay + '<br>' + thoigian + '</td>');
			listItem.append('<td>' + movie.thumb_url + '</td>');
			listItem.append('<td>' + movie.poster_url + '</td>');

			listItem.append("<td>" + (movie.active ? "<span class='online'>" : "<span class='offline'>") + (movie.active ? "Đang hoạt động" : "Không hoạt động") + "</span></td>");
			listItem.append("<td>" + "<button class='btn btn-primary btn-edit-phim' value='" + (movie.idphim) + "'>Chỉnh sửa</button>" + "</td>");
			listItem.append('</tr>');
			movieList.append(listItem);
		});
		addbtneditphim();
	}

	function setupPagination(movies) {
		var totalPages = Math.ceil(movies.length / moviesPerPage);
		var pagination = $('#pagination');
		pagination.empty();

		// Add "Go to First Page" and "Go to Last Page" buttons
		pagination.append($('<span class="page-item go-to-first">1</span>').attr('data-target', 1));
		if (totalPages > 1) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function (e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function (e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function (e) {

			currentPage = totalPages;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		updatePaginationUI(currentPage);
	}

	function updateVisiblePages(currentPage) {

		$('#pagination .page-item').slice(1, -1).remove(); // Remove old middle pages

		var totalPages = Math.ceil(movies.length / moviesPerPage);

		var startPage = Math.max(2, currentPage - 1);


		var endPage = Math.min(totalPages - 1, parseInt(currentPage) + 1);


		for (var i = startPage; i <= endPage; i++) {
			$('<span class="page-item">' + i + '</span>').attr('data-target', i).insertBefore('#pagination .page-item:last');
		}

		updatePaginationUI(currentPage);
	}

	function updatePaginationUI(currentPage) {
		$('#pagination .page-item').removeClass('active').filter(function () {
			return $(this).attr('data-target') == currentPage;
		}).addClass('active');
	}

	// Initial call to display movies and setup pagination
	displayMovies(movies, currentPage);
	setupPagination(movies);

}
// phan trang nguoi dung 


/////.append////////////////////// ở trên ko đụng tới////////////////////////////////////

function loadPhimForm() {
	getAPI('/animu/api/get/phim', function (result) {

		$('#idphim').val(result.idphim);
		$('#tieude').val(result.tieude);
		$('#slug').val(result.slug);
		$('#thumb_url').val(result.thumb_url);
		$('#poster_url').val(result.poster_url);
		$('#phim-active').prop('checked', result.active);


		//$('#phimSelected').text($('#idphim').val() + ':' + $('#tieude').val());

		//getThongBaoPhim();// hien thi thong bao phim dang edit


	});
}

function phantrangnguoidung(result) {
	var movies = result;

	var currentPage = 1;
	var moviesPerPage = 10; // Số phim mỗi trang

	function displayMovies(movies, page) {
		var startIndex = (page - 1) * moviesPerPage;

		var endIndex = startIndex + moviesPerPage;
		var paginatedMovies = movies.slice(startIndex, endIndex);

		var movieList = $('#body-nguoidung');
		movieList.empty();

		$.each(paginatedMovies, function (index, movie) {
			var date = new Date(movie.ngaytao);

			// Lấy thời gian theo múi giờ Việt Nam (GMT+7)
			var vietnamOffset = 7 * 60; // GMT+7 trong phút
			var localOffset = date.getTimezoneOffset(); // Phút lệch so với GMT của giờ địa phương
			var vietnamTime = new Date(date.getTime() + (vietnamOffset + localOffset) * 60 * 1000);

			// Lấy các thành phần ngày giờ theo múi giờ Việt Nam
			var hours = vietnamTime.getHours().toString().padStart(2, '0');
			var minutes = vietnamTime.getMinutes().toString().padStart(2, '0');
			var seconds = vietnamTime.getSeconds().toString().padStart(2, '0');
			var day = vietnamTime.getDate().toString().padStart(2, '0');
			var month = (vietnamTime.getMonth() + 1).toString().padStart(2, '0'); // Tháng bắt đầu từ 0
			var year = vietnamTime.getFullYear();


			var ngay = `Ngày${day} Tháng ${month} Năm ${year}`;
			var thoigian = `${hours}Giờ ${minutes}Phút ${seconds}Giây`;

			var listItem = $('<tr class="text-center">');
			listItem.append('<td>' + movie.user_id + '</td>');
			listItem.append('<td>' + movie.username + '</td>');
			listItem.append('<td>' + movie.email + '</td>');
			listItem.append('<td>' + ngay + '<br>' + thoigian + '</td>');
			var role = '';
			var classCss = '';
			if (movie.role == 2) {
				role = 'Manager';
				classCss = 'manager';
			} else if (movie.role == 1) {
				role = 'Member Vip';
				classCss = 'member-vip';
			} else {
				role = 'Member';
				classCss = 'member';
			}

			listItem.append('<td >' + '<span class=' + classCss + '>' + role + '</span>' + '</td>');
			listItem.append("<td>" + (movie.active ? "<span class='online'>" : "<span class='offline'>") + (movie.active ? "Đang hoạt động" : "Không hoạt động") + "</span></td>");
			if (movie.role == 2) {

			} else {
				if (movie.active) {
					listItem.append("<td>" + "<button class='btn btn-danger btn-edit-chitietphim' value='" + (movie.user_id) + "'>Hủy kích hoạt</button>" + "</td>");
				} else {
					listItem.append("<td>" + "<button class='btn btn-success btn-edit-chitietphim' value='" + (movie.user_id) + "'>Kích hoạt</button>" + "</td>");
				}
			}


			listItem.append('</tr>');

			movieList.append(listItem);
			//

			////////////////

		});
		$('.btn-edit-chitietphim').off('click').click(function () {
			var idnguoidung = $(this).val();

			updatenguoidung(idnguoidung);
			loadnguoidunglist();
		});

	}

	function setupPagination(movies) {
		var totalPages = Math.ceil(movies.length / moviesPerPage);
		var pagination = $('#pagination');
		pagination.empty();

		// Add "Go to First Page" and "Go to Last Page" buttons
		pagination.append($('<span class="page-item go-to-first">1</span>').attr('data-target', 1));
		if (totalPages > 1) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function (e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function (e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function (e) {

			currentPage = totalPages;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		updatePaginationUI(currentPage);
	}

	function updateVisiblePages(currentPage) {

		$('#pagination .page-item').slice(1, -1).remove(); // Remove old middle pages

		var totalPages = Math.ceil(movies.length / moviesPerPage);

		var startPage = Math.max(2, currentPage - 1);


		var endPage = Math.min(totalPages - 1, parseInt(currentPage) + 1);


		for (var i = startPage; i <= endPage; i++) {
			$('<span class="page-item">' + i + '</span>').attr('data-target', i).insertBefore('#pagination .page-item:last');
		}

		updatePaginationUI(currentPage);
	}

	function updatePaginationUI(currentPage) {
		$('#pagination .page-item').removeClass('active').filter(function () {
			return $(this).attr('data-target') == currentPage;
		}).addClass('active');
	}

	// Initial call to display movies and setup pagination
	displayMovies(movies, currentPage);
	setupPagination(movies);

}
// phan trang nguoi dung 



///phan trang chi tiet nguoi dung 
function phantrangchitietnguoidung(result) {

	var movies = Object.values(result);


	var currentPage = 1;
	var moviesPerPage = 10; // Số phim mỗi trang

	function displayMovies(movies, page) {
		var startIndex = (page - 1) * moviesPerPage;

		var endIndex = startIndex + moviesPerPage;
		var paginatedMovies = movies.slice(startIndex, endIndex);

		var movieList = $('#body-chitietnguoidung');
		movieList.empty();

		$.each(paginatedMovies, function (index, movie) {
			var date = new Date(movie.date);


			// Lấy thời gian theo múi giờ Việt Nam (GMT+7)
			var vietnamOffset = 7 * 60; // GMT+7 trong phút
			var localOffset = date.getTimezoneOffset(); // Phút lệch so với GMT của giờ địa phương
			var vietnamTime = new Date(date.getTime() + (vietnamOffset + localOffset) * 60 * 1000);

			// Lấy các thành phần ngày giờ theo múi giờ Việt Nam
			var hours = vietnamTime.getHours().toString().padStart(2, '0');
			var minutes = vietnamTime.getMinutes().toString().padStart(2, '0');
			var seconds = vietnamTime.getSeconds().toString().padStart(2, '0');
			var day = vietnamTime.getDate().toString().padStart(2, '0');
			var month = (vietnamTime.getMonth() + 1).toString().padStart(2, '0'); // Tháng bắt đầu từ 0
			var year = vietnamTime.getFullYear();


			var ngay = `Ngày${day} Tháng ${month} Năm ${year}`;
			var thoigian = `${hours}Giờ ${minutes}Phút ${seconds}Giây`;

			var listItem = $('<tr class="text-center">');
			listItem.append('<td>' + movie.idchitiet + '</td>');
			listItem.append('<td>' + movie.user_id + '</td>');
			listItem.append('<td>' + movie.email + '</td>');
			listItem.append('<td>' + movie.username + '</td>');
			listItem.append('<td>' + movie.idphim + '</td>');
			listItem.append('<td>' + movie.tieude + '</td>');
			listItem.append('<td>' + movie.tapphim + '</td>');
			listItem.append('<td>' + movie.cmt + '</td>');
			listItem.append('<td>' + movie.vote + ' <i class="fas fa-star" style="color: #ffd700;"></i></td>');
			var like = '';
			if (movie.like) {
				like = 'Đã thích';
			} else {
				like = 'Chưa thích';
			}
			listItem.append('<td>' + like + '</td>');
			listItem.append('<td>' + ngay + '<br>' + thoigian + '</td>');
			listItem.append("<td>" + "<button class='btn btn-danger btn-delete-chitietnguoidung' value='" + (movie.idchitiet) + "'>Xóa hành động</button>" + "</td>");
			listItem.append("<td>" + "<button class='btn btn-warning btn-delete-chitietnguoidung-cmt' value='" + (movie.idchitiet) + "'>Xóa bình luận</button>" + "</td>");
			listItem.append('</tr>');

			movieList.append(listItem);
			//

			////////////////

		});
		$('.btn-edit-chitietphim').off('click').click(function () {
			var idnguoidung = $(this).val();

			updatenguoidung(idnguoidung);
			loadnguoidunglist();
		});

		addbtndelete();

	}

	function setupPagination(movies) {
		var totalPages = Math.ceil(movies.length / moviesPerPage);
		var pagination = $('#pagination');
		pagination.empty();

		// Add "Go to First Page" and "Go to Last Page" buttons
		pagination.append($('<span class="page-item go-to-first">1</span>').attr('data-target', 1));
		if (totalPages > 1) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function (e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function (e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function (e) {

			currentPage = totalPages;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		updatePaginationUI(currentPage);
	}

	function updateVisiblePages(currentPage) {

		$('#pagination .page-item').slice(1, -1).remove(); // Remove old middle pages

		var totalPages = Math.ceil(movies.length / moviesPerPage);

		var startPage = Math.max(2, currentPage - 1);


		var endPage = Math.min(totalPages - 1, parseInt(currentPage) + 1);


		for (var i = startPage; i <= endPage; i++) {
			$('<span class="page-item">' + i + '</span>').attr('data-target', i).insertBefore('#pagination .page-item:last');
		}

		updatePaginationUI(currentPage);
	}

	function updatePaginationUI(currentPage) {
		$('#pagination .page-item').removeClass('active').filter(function () {
			return $(this).attr('data-target') == currentPage;
		}).addClass('active');
	}

	// Initial call to display movies and setup pagination
	displayMovies(movies, currentPage);
	setupPagination(movies);

}


//////////////////////////////////// ở trên ko đụng tới////////////////////////////////////

function loadPhimForm() {
	getAPI('/animu/api/get/phim', function (result) {

		$('#idphim').val(result.idphim);
		$('#tieude').val(result.tieude);
		$('#slug').val(result.slug);
		$('#thumb_url').val(result.thumb_url);
		$('#poster_url').val(result.poster_url);
		$('#phim-active').prop('checked', result.active);


		//$('#phimSelected').text($('#idphim').val() + ':' + $('#tieude').val());

		//getThongBaoPhim();// hien thi thong bao phim dang edit


	});
}

// thêm sự kiện click cho button chỉnh sửa ở trang danh sách phim
function addbtneditphim() {

	$('.btn-edit-phim').off('click').click(function () {
		var idphim = $(this).val();

		getAPI('/animu/api/get/phim/' + idphim, function (result) {

			$('#idphim').val(result.idphim);
			$('#tieude').val(result.tieude);
			$('#slug').val(result.slug);
			$('#thumb_url').val(result.thumb_url);
			$('#poster_url').val(result.poster_url);
			$('#phim-active').prop('checked', result.active);
			$('#phim-edition').addClass('active');
			$('#phim-edition').addClass('show');
			$('#phim-edition-tab').addClass('active');
			$('#phim-edition-tab').attr('aria-selected', 'true');

			$('#phim-list').removeClass('active');
			$('#phim-list').removeClass('show');
			$('#phim-list-tab').removeClass('active');
			$('#phim-list-tab').attr('aria-selected', 'false');

			//$('#phimSelected').text($('#idphim').val() + ':' + $('#tieude').val());

			getThongBaoPhim();// hien thi thong bao phim dang edit


		});



	});

}
// hiển thị thông báo phim đang được chỉnh sửa
function getThongBaoPhim() {
	getAPI('/animu/api/get/editPhim', function (result) {
		var phim = result.split(',');
		if (phim.length > 1) {
			$('#phimSelected').text(phim[0] + ' : ' + phim[1]);
		} else {
			$('#phimSelected').text(result);
		}

	});
}



// hàm thêm sự kiện cho form và danh sách Phim
function addClickForPhim() {
	// add tim kiem
	$('#btn_timkiem_phim').off('click').click(() => {

		var data = {
			key: $('#searchInput').val()
		}

		PostAPINotJson('/animu/api/search/phim', data, function (result) {
			phantrang(result);
			//	addbtneditphim();
		});
	});

	// cap nhat
	$('#btn_update_phim').off('click').click(() => {
		if ($('#mes').hasClass('text-danger') || $('#mes').hasClass('text-success')) {
			$('#mes').removeClass();
		}
		//var idphim = $('#idphim').val();
		$('#mes').addClass('reloading');
		$('#mes').html('<i class="fas fa-sync-alt"></i>');
		//
		var idphim = $('#idphim').val();
		var url = '/animu/api/update/phim/';
		var data = {
			idphim: $('#idphim').val(),
			tieude: $('#tieude').val(),
			slug: $('#slug').val(),
			thumb_url: $('#thumb_url').val(),
			poster_url: $('#poster_url').val(),
			active: $('#phim-active').prop('checked')
		};

		PostAPI(url + idphim, data, function (result) {

			$('#mes').removeClass();
			var mes = result.split(',');
			if (mes[0] == 0) {// thong bao loi

				$('#mes').text(mes[1]);

				$('#mes').addClass('text-danger');
			} else {// thong bao thanh cong
				$('#mes').text(mes[1]);
				$('#mes').addClass('text-success');
			}
			// chinh sua xong => load lai du lieu
			getAPI('/animu/api/load/listphim', function (result) {
				phantrang(result);


			});
		});

	});
	// them
	$('#btn_insert_phim').off('click').click(() => {
		if ($('#mes').hasClass('text-danger') || $('#mes').hasClass('text-success')) {
			$('#mes').removeClass();
		}
		//var idphim = $('#idphim').val();
		$('#mes').addClass('reloading');
		$('#mes').html('<i class="fas fa-sync-alt"></i>');
		var data = {
			//idphim: $('#idphim').val(),
			tieude: $('#tieude').val(),
			slug: $('#slug').val(),
			thumb_url: $('#thumb_url').val(),
			poster_url: $('#poster_url').val(),
			active: $('#phim-active').prop('checked')
		};

		var url = '/animu/api/insert/phim';

		PostAPI(url, data, function (result) {
			$('#mes').removeClass();

			$('#mes').empty();

			var mes = result.split(',');

			if (mes[0] == 0) {// thong bao loi

				$('#mes').text(mes[1]);

				$('#mes').addClass('text-danger');
			} else {// thong bao thanh cong
				$('#mes').text(mes[1]);
				$('#mes').addClass('text-success');
			}
			// them sua xong => cap nhat 
			getAPI('/animu/api/load/listphim', function (result) {

				phantrang(result);

				//	addbtneditphim();

			});
		});

	});

	// làm mới
	$('#btn_clear').off('click').click(() => {
		//var idphim = $('#idphim').val();
		$('#idphim').val('');
		$('#tieude').val('');
		$('#slug').val('');
		$('#thumb_url').val('');
		$('#poster_url').val('');
		$('#phim-active').prop('checked', true);
		$('#phimSelected').text('Vui lòng chọn phim cần chỉnh sửa');
		$('#mes').text('');
		// clear sua xong => cap nhat 
		getAPI('/animu/api/phim/clearPhim', function (result) {



			//addbtneditphim();

		});
		getAPI('/animu/api/load/listphim', function (result) {

			phantrang(result);

			//	addbtneditphim();

		});
	});

}



// thêm các sự kiện hoặc load dữ liệu cần thiết cho trang
$(document).ready(function () {

	getAPI('/animu/api/' + 1, function (result) {
		html = result;
		$('#main').html(html);
		getThongBaoPhim();// hien thi thong bao phim dang duoc edit
	});
	///
	// lay du lieu tong user va phim
	getAPI('/animu/api/char', function (result) {
		var data = result.split(',');
		$('#total-users').text(data[0]);
		$('#total-movies').text(data[1]);
		loadChar();// tao bieu do
	});

	// to mau nen
	$('#option1').addClass('selected');


	$('.nav-item').off('click').click(function () {
		// Lấy giá trị của data-target từ mục menu được chọn
		var option = $(this).attr('data-target');
		var html = '';
		// tai trang html
		getAPI('/animu/api/' + option, function (result) {
			html = result;
			$('#main').html(html);
			getThongBaoPhim();// hien thi thong bao phim dang duoc edit
			//
			// tai du lieu len trang
			if (option == 1) {
				// lay du lieu tong user va phim
				getAPI('/animu/api/char', function (result) {
					var data = result.split(',');
					$('#total-users').text(data[0]);
					$('#total-movies').text(data[1]);
					loadChar();// tao bieu do
				})
			}



			if (option == 2) {
				getAPI('/animu/api/load/listphim', function (result) {

					phantrang(result);

					//	addbtneditphim();
					addClickForPhim();
					loadPhimForm();
					clickXuatExcel();
					clickImportExcel();
				});
			}
			// chi tiet phim
			if (option == 3) {
				loadctphimform();
				loadctphimlist();
			}

			// tap phim 
			if (option == 4) {
				loadlistTapphim();
				addbtnClickTapphim();
				// goi 2 ham
				// goi ham add su kien
			}

			if (option == 5) {
				loadnhasx();
				addClickSuaNhasx();

			}

			if (option == 6) {
				loadlistPhanLoai();
				addclickPhanLoai();
			}

			if (option == 7) {
				loadnguoidunglist();
				$('#btn_timkiem_phim').off('click').click(function () {
					searchNguoiDung();
				});
				loadvaitro();
			}
			if (option == 8) {// ct nguoi dung
				loadChiTietNguoiDung();
				addClickSearchCTNguoiDung();

			}

			if (option == 10) {
				clearMail();
				addClickMail();
			}



		});
	});


	// doi backgound khi duoc click 
	$('.nav-item').click(function () {
		// Xóa lớp 'selected' từ tất cả các đoạn văn
		$('.nav-item').removeClass('selected');
		// Thêm lớp 'selected' cho đoạn văn được click
		$(this).addClass('selected');
	});

	// Xử lý sự kiện click cho phần tử h1 có id là phimbtn
	$('#phimbtn').click(function () {
		// Slide toggle all hidden menu items
		$('.menu-item-phim').slideToggle('slow');
	});

	$('#userbtn').click(function () {
		// Slide toggle all hidden menu items
		$('.menu-item-user').slideToggle('slow');
	});

	$('#otherbtn').click(function () {
		// Slide toggle all hidden menu items
		$('.menu-item-other').slideToggle('slow');
	});


	$('.nav-item').hover(
		function () {
			$(this).css('transform', 'translateX(15px)'); // Di chuyển phần tử sang phải khi hover vào
		},
		function () {
			$(this).css('transform', 'translateX(0)'); // Đưa phần tử về vị trí ban đầu khi rời chuột ra
		}
	);




});
/////////////////////////////////////////////////////////Tập phim ////////////////////////////////
// function loadlisttapphim();
// function loadformtapphim();


/////////////////////////////////////////////////////////Chi tiết phim ////////////////////////////////

// load dữ liệu lên form chi tiết phim khi chọn nút edit từ danh sách Phim
function loadctphimform() {
	getAPI('/animu/api/get/chitietphim', function (result) {

		$('#chitietphim-idphim').val(result.idphim);
		$('#chitietphim-tengoc').val(result.tengoc);
		$('#chitietphim-tongsotap').val(result.tongsotap);
		$('#chitietphim-tapmoinhat').val(result.tapmoinhat);
		$('#chitietphim-thoigian').val(result.thoigian);
		$('#chitietphim-chatluong').val(result.chatluong);
		$('#chitietphim_mota').val(result.mota);

		$('#chitietphim-edition').addClass('active');
		$('#chitietphim-edition').addClass('show');
		$('#chitietphim-edition-tab').addClass('active');
		$('#chitietphim-edition-tab').attr('aria-selected', 'true');

		$('#chitietphim-list').removeClass('active');
		$('#chitietphim-list').removeClass('show');
		$('#chitietphim-list-tab').removeClass('active');
		$('#chitietphim-list-tab').attr('aria-selected', 'false');
		addClickChiTietPhim();



		//

	});

}

function addClickChiTietPhim() {
	$('#btn_update_chitietphim').off('click').click(() => {
		//var idphim = $('#idphim').val();
		if ($('#mes').hasClass('text-danger') || $('#mes').hasClass('text-success')) {
			$('#mes').removeClass();
		}
		//var idphim = $('#idphim').val();
		$('#mes').addClass('reloading');
		$('#mes').html('<i class="fas fa-sync-alt"></i>');

		var url = '/animu/api/update/chitietphim';
		var data = {
			//idphim: $('#idphim').val(),
			tengoc: $('#chitietphim-tengoc').val(),
			tongsotap: $('#chitietphim-tongsotap').val(),
			thoigian: $('#chitietphim-thoigian').val(),
			tapmoinhat: $('#chitietphim-tapmoinhat').val(),
			chatluong: $('#chitietphim-chatluong').val(),
			mota: $('#chitietphim_mota').val(),

		};

		PostAPI(url, data, function (result) {
			$('#mes').removeClass();
			$('#mes').empty();
			var mes = result.split(',');
			if (mes[0] == 0) {
				$('#mes').text(mes[1]).addClass('text-danger');
			} else {
				$('#mes').text(mes[1]).addClass('text-success');
			}
			loadctphimlist();

		});
	});
}


function loadctphimlist() {
	getAPI('/animu/api/get/chitietphim', function (result) {


		if (result.length != 0) {

			var date = new Date(result.ngaychinhsua);

			// Lấy thời gian theo múi giờ Việt Nam (GMT+7)
			var vietnamOffset = 7 * 60; // GMT+7 trong phút
			var localOffset = date.getTimezoneOffset(); // Phút lệch so với GMT của giờ địa phương
			var vietnamTime = new Date(date.getTime() + (vietnamOffset + localOffset) * 60 * 1000);

			// Lấy các thành phần ngày giờ theo múi giờ Việt Nam
			var hours = vietnamTime.getHours().toString().padStart(2, '0');
			var minutes = vietnamTime.getMinutes().toString().padStart(2, '0');
			var seconds = vietnamTime.getSeconds().toString().padStart(2, '0');
			var day = vietnamTime.getDate().toString().padStart(2, '0');
			var month = (vietnamTime.getMonth() + 1).toString().padStart(2, '0'); // Tháng bắt đầu từ 0
			var year = vietnamTime.getFullYear();


			var ngay = `Ngày${day} Tháng ${month} Năm ${year}`;
			var thoigian = `${hours}Giờ ${minutes}Phút ${seconds}Giây`;

			var listItem = ('<tr class="text-center">');
			listItem += ('<td>' + result.idphim + '</td>');
			listItem += ('<td>' + result.tengoc + '</td>');
			listItem += ('<td>' + result.tongsotap + '</td>');
			listItem += ('<td>' + result.tapmoinhat + '</td>');
			listItem += ('<td>' + result.thoigian + '</td>');
			listItem += ('<td>' + result.chatluong + '</td>');
			listItem += ('<td>' + ngay + '<br>' + thoigian + '</td>');
			listItem += ('<td>' + result.mota + '</td>');

			listItem += ("<td>" + "<button class='btn btn-primary btn-edit-chitietphim' value='" + (result.idphim) + "'>Chỉnh sửa</button>" + "</td>");
			listItem += ('</tr>');

			$('#body_ctphim').html(listItem);

			////
			$('.btn-edit-chitietphim').off('click').click(function () {
				loadctphimform();
			});
		}


	});

}
/////////////////// Nguoi dung ///////////////////////////////
function loadvaitro() {

	getAPI('/animu/api/get/nguoidung/vaitro', function (result) {
		$('#roleSelect').append('<option value="-1">Tất cả</option>');
		$.each(result, function (index, item) {
			// index = key;
			$('#roleSelect').append('<option value=' + index + '>' + item + '</option>');
		});

	});
}


function searchNguoiDung() {
	var data = {
		key: $('#searchInput').val(),
		option: $('#roleSelect').val()
	}


	PostAPINotJson('/animu/api/search/nguoidung', data, function (result) {
		phantrangnguoidung(result);
		//	addbtneditphim();
	});
}


function loadnguoidunglist() {
	getAPI('/animu/api/get/nguoidung/list', function (result) {

		phantrangnguoidung(result);
	});

}

function updatenguoidung(idnguoidung) {
	loading();
	getAPI('/animu/api/update/nguoidung/' + idnguoidung, function (result) {

		loaded(result);

		loadnguoidunglist();
	});

}

//////////////////// chi tiet nguoi dung //////////////////////////////
function loadChiTietNguoiDung() {

	getAPI('/animu/api/load/chitietnguoidung', function (result) {

		phantrangchitietnguoidung(result);
	});
}

function addbtndelete() {

	$('.btn-delete-chitietnguoidung').off('click').click(function () {
		var idctnguoidung = $(this).val();
		getAPI('/animu/api/delete/all/' + idctnguoidung, function (result) {

			loadChiTietNguoiDung();
			loaded(result);
		});
	});

	$('.btn-delete-chitietnguoidung-cmt').off('click').click(function () {
		var idctnguoidung = $(this).val();

		getAPI('/animu/api/delete/cmt/' + idctnguoidung, function (result) {

			loadChiTietNguoiDung();
			loaded(result);
		});

	});
}

function addClickSearchCTNguoiDung() {
	$('#searchct').off('click').click(function () {
		searchChiTietNguoiDung();
	});
}

function searchChiTietNguoiDung() {

	var data = {
		key: $('#searchInputDetail').val()
	}


	PostAPINotJson('/animu/api/search/chitietnguoidung', data, function (result) {
		phantrangchitietnguoidung(result);
	});

}
/////////////////////// gui mail /////////////////////
function addClickMail() {

	// gui
	$('#btn-send').off('click').click(function () {
		loading();
		var formData = new FormData();
		// Add files to the form data
		var files = $('#file')[0].files;
		if (files.length === 0) {
			// Append an empty file if no files are selected
			formData.append('file', new Blob(), '');
		} else {
			for (var i = 0; i < files.length; i++) {
				formData.append('file', files[i]);
			}
		}

		// Add other form data
		formData.append('from', $('#from').val());
		formData.append('subject', $('#subject').val());
		formData.append('text', $('#body').val());
		formData.append('options', $('#options').val());



		postwithfile('/animu/control/guimail', formData, function (result) {
			loaded(result);
		});

	});

	/// them vao ds gui
	$('#btn-load').off('click').click(function () {
		var type = $('#selectOption').val();
		getAPI('/animu/api/add/listmail/' + type, function (result) {
			loadlistEmail(result);
		});
	});

}

function clearMail() {
	getAPI('/animu/api/clear/listmail', function () {

	});
}

function loadlistEmail(result) {
	var movieList = $('#body-email');
	movieList.empty();
	$.each(result, function (index, movie) {
		var date = new Date(movie.ngaytao);


		// Lấy thời gian theo múi giờ Việt Nam (GMT+7)
		var vietnamOffset = 7 * 60; // GMT+7 trong phút
		var localOffset = date.getTimezoneOffset(); // Phút lệch so với GMT của giờ địa phương
		var vietnamTime = new Date(date.getTime() + (vietnamOffset + localOffset) * 60 * 1000);

		// Lấy các thành phần ngày giờ theo múi giờ Việt Nam
		var hours = vietnamTime.getHours().toString().padStart(2, '0');
		var minutes = vietnamTime.getMinutes().toString().padStart(2, '0');
		var seconds = vietnamTime.getSeconds().toString().padStart(2, '0');
		var day = vietnamTime.getDate().toString().padStart(2, '0');
		var month = (vietnamTime.getMonth() + 1).toString().padStart(2, '0'); // Tháng bắt đầu từ 0
		var year = vietnamTime.getFullYear();


		var ngay = `Ngày${day} Tháng ${month} Năm ${year}`;
		var thoigian = `${hours}Giờ ${minutes}Phút ${seconds}Giây`;
		//console.log(formattedDatetime);
		var listItem = $('<tr class="movie-item text-center">');
		listItem.append('<td>' + index + '</td>');
		listItem.append('<td>' + movie.user_id + '</td>');
		listItem.append('<td>' + movie.email + '</td>');
		listItem.append('<td>' + movie.username + '</td>');
		var role = '';
		if (role == 0) {
			role = 'Member';
		} else {
			role = 'Member Vip';
		}
		listItem.append('<td>' + role + '</td>');
		listItem.append('<td>' + ngay + '</td>');




		listItem.append('</tr>');
		movieList.append(listItem);
	});

}

//////////////////////Xuat Excel/////////////////////////////


function clickXuatExcel() {

	$('#btn_xuat_excel').off('click').click(function () {
		loading();
		window.location.href = "/animu/api/export/Excel";
		loaded('1, Xuất file thành công');
	});
}

//////////////////////////////////////////////////////////////


//////////////////Import Excel//////////////////////////////
function clickImportExcel() {
	$('#btn_import_excel').off('click').click(function () {
		var fileinput = document.getElementById("file-input");
		var file = fileinput.files[0];
		var form = new FormData();
		form.append('file', file);
		$.ajax({
			url: '/animu/api/import/Excel',
			type: 'POST',
			data: form,
			processData: false,  // không xử lý dữ liệu trước khi gửi
			contentType: false,  // không đặt Content-Type
			success: function (response) {
				console.log('File uploaded successfully:', response);
			},
			error: function (xhr, status, error) {
				console.error('Error uploading file:', error);
			}
		});

	});
}

/////////////////  Tap phim ///////////////////////

function loadlistTapphim() {
	getAPI('/animu/api/get/tapphim', function (result) {
		phantrangTapPhim(result);
	});
}

function phantrangTapPhim(result) {
	var movies = result;

	var currentPage = 1;
	var moviesPerPage = 10; // Số phim mỗi trang

	function displayMovies(movies, page) {
		var startIndex = (page - 1) * moviesPerPage;

		var endIndex = startIndex + moviesPerPage;
		var paginatedMovies = movies.slice(startIndex, endIndex);

		var movieList = $('#body-tapphim');
		movieList.empty();

		$.each(paginatedMovies, function (index, movie) {

			var listItem = $('<tr class="movie-item text-center">');
			listItem.append('<td>' + movie.idtapphim + '</td>');
			listItem.append('<td>' + movie.tentap + '</td>');
			listItem.append('<td>' + movie.server + '</td>');


			listItem.append('<td>' + movie.slug + '</td>');
			listItem.append('<td>' + movie.link + '</td>');
			listItem.append('<td>' + movie.link2 + '</td>');


			listItem.append("<td>" + "<button class='btn btn-primary btn-edit-tapphim' value='" + (movie.idtapphim) + "'>Chỉnh sửa</button>" + "</td>");
			listItem.append('</tr>');
			movieList.append(listItem);
		});

		addbtnedittapphim();

	}

	function setupPagination(movies) {
		var totalPages = Math.ceil(movies.length / moviesPerPage);
		var pagination = $('#pagination');
		pagination.empty();

		// Add "Go to First Page" and "Go to Last Page" buttons
		pagination.append($('<span class="page-item go-to-first">1</span>').attr('data-target', 1));
		if (totalPages > 1) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function (e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function (e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function (e) {

			currentPage = totalPages;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		updatePaginationUI(currentPage);
	}

	function updateVisiblePages(currentPage) {

		$('#pagination .page-item').slice(1, -1).remove(); // Remove old middle pages

		var totalPages = Math.ceil(movies.length / moviesPerPage);

		var startPage = Math.max(2, currentPage - 1);


		var endPage = Math.min(totalPages - 1, parseInt(currentPage) + 1);


		for (var i = startPage; i <= endPage; i++) {
			$('<span class="page-item">' + i + '</span>').attr('data-target', i).insertBefore('#pagination .page-item:last');
		}

		updatePaginationUI(currentPage);
	}

	function updatePaginationUI(currentPage) {
		$('#pagination .page-item').removeClass('active').filter(function () {
			return $(this).attr('data-target') == currentPage;
		}).addClass('active');
	}

	// Initial call to display movies and setup pagination
	displayMovies(movies, currentPage);
	setupPagination(movies);

}

function addbtnClickTapphim() {
	// them
	$('#btn_them').off('click').click(() => {
		loading();
		var data = {
			idtapphim: $('#tapphim-idtapphim').val(),
			server: $('#tapphim-server').val(),
			slug: $('#tapphim-slug').val(),
			link: $('#tapphim-link').val(),
			link2: $('#tapphim-link2').val(),
			tentap: $('#tapphim-tentap').val(),
		};

		var url = '/animu/api/insert/tapphim';

		PostAPI(url, data, function (result) {
			loaded(result);
			// them sua xong => cap nhat 
			getAPI('/animu/api/get/tapphim', function (result) {
				phantrangTapPhim(result);


			});
		});

	});

	// cap nhat
	$('#btn_sua').off('click').click(() => {
		loading();
		var idtapphim = $('#tapphim-idtapphim').val();
		var url = '/animu/api/update/tapphim/';
		var data = {
			idtapphim: $('#tapphim-idtapphim').val(),
			server: $('#tapphim-server').val(),
			slug: $('#tapphim-slug').val(),
			link: $('#tapphim-link').val(),
			link2: $('#tapphim-link2').val(),
			tentap: $('#tapphim-tentap').val(),

		};

		PostAPI(url + idtapphim, data, function (result) {

			loaded(result);
			// chinh sua xong => load lai du lieu
			getAPI('/animu/api/get/tapphim', function (result) {
				phantrangTapPhim(result);


			});
		});

	});
	// xoa

	$('#btn_xoa').off('click').click(() => {
		loading();
		var idtapphim = $('#tapphim-idtapphim').val();
		var url = '/animu/api/delete/tapphim/';


		getAPI(url + idtapphim, function (result) {

			loaded(result);
			// chinh sua xong => load lai du lieu
			getAPI('/animu/api/get/tapphim', function (result) {
				phantrangTapPhim(result);


			});
		});

	});
}

function addbtnedittapphim() {


	$('.btn-edit-tapphim').off('click').click(function () {
		var idtapphim = $(this).val();

		getAPI('/animu/api/get/tapphim/' + idtapphim, function (result) {

			$('#tapphim-idtapphim').val(result.idtapphim);
			$('#tapphim-tentap').val(result.tentap);
			$('#tapphim-server').val(result.server);
			$('#tapphim-slug').val(result.slug);
			$('#tapphim-link').val(result.link);
			$('#tapphim-link2').val(result.link2);

			$('#tapphim-edition').addClass('active');
			$('#tapphim-edition').addClass('show');
			$('#tapphim-edition-tab').addClass('active');
			$('#tapphim-edition-tab').attr('aria-selected', 'true');

			$('#tapphim-list').removeClass('active');
			$('#tapphim-list').removeClass('show');
			$('#tapphim-list-tab').removeClass('active');
			$('#tapphim-list-tab').attr('aria-selected', 'false');

			//$('#phimSelected').text($('#idphim').val() + ':' + $('#tieude').val());

			getThongBaoPhim();// hien thi thong bao phim dang edit


		});



	});

}


//////////////////////////////////// nha sx  ///////////////////////////////////
function loadnhasx() {
	getAPI('/animu/api/get/listnhasx', function (result) {
		var listItem = '';

		$.each(result, function (index, movie) {

			listItem += ('<tr class="text-center">');
			listItem += ('<td>' + movie.idnhasxvadv + '</td>');
			listItem += ('<td>' + movie.idphim + '</td>');
			var vt = '';
			if (movie.vaitro) {
				vt = 'Diễn viên';
			} else {
				vt = 'Nhà sản xuất';
			}
			listItem += ('<td>' + vt + '</td>');
			listItem += ('<td>' + movie.ten + '</td>');



			listItem += ("<td>" + "<button class='btn btn-primary btn-edit-nhasx' value='" + (movie.idnhasxvadv) + "'>Chỉnh sửa</button>" + "</td>");
			listItem += ('</tr>');


		});

		$('#body-nhasx').html(listItem);

		addClickEditNhasx();

	});

}

function addClickSuaNhasx() {
	$('#btn-sua-nhasx').off('click').click(() => {
		console.log('jhij');
		loading();
		var idnhasxvadv = $('#idnhasxvadv').val();
		var url = '/animu/api/update/nhasx/';
		var data = {


			ten: $('#thongtin').val(),

		};

		PostAPI(url + idnhasxvadv, data, function (result) {

			loaded(result);
			// chinh sua xong => load lai du lieu
			loadnhasx();
		});

	});
}

function addClickEditNhasx() {
	$('.btn-edit-nhasx').off('click').click(function () {
		var idnhasxvadv = $(this).val();

		getAPI('/animu/api/get/nhasx/' + idnhasxvadv, function (result) {

			$('#idnhasxvadv').val(result.idnhasxvadv);
			$('#idphim').val(result.idphim);
			$('#thongtin').val(result.ten);
			var vt = '';
			if (result.vaitro) {
				vt = 'Diễn viên';
			} else {
				vt = 'Nhà sản xuất'
			}
			$('#vaitro').val(vt);


			$('#nhasx-edition').addClass('active');
			$('#nhasx-edition').addClass('show');
			$('#nhasx-edition-tab').addClass('active');
			$('#nhasx-edition-tab').attr('aria-selected', 'true');

			$('#nhasx-list').removeClass('active');
			$('#nhasx-list').removeClass('show');
			$('#nhasx-list-tab').removeClass('active');
			$('#nhasx-list-tab').attr('aria-selected', 'false');

			//$('#phimSelected').text($('#idphim').val() + ':' + $('#tieude').val());

			//getThongBaoPhim();// hien thi thong bao phim dang edit


		});



	});
}

//////////////////////////////// phan loai /////////////////////////////////
function addClickphanloai() {


	getAPI('/animu/api/get/phanloai', function (result) {

		$('#idphim').val(result.idphim);
		$('#loaiphim').val(result.loaiphim);
		$('#theloai').val(result.theloai);
		$('#quocgia').val(result.quocgia);
		$('#nam').val(result.nam);


		$('#phanloai-edition').addClass('active');
		$('#phanloai-edition').addClass('show');
		$('#phanloai-edition-tab').addClass('active');
		$('#phanloai-edition-tab').attr('aria-selected', 'true');

		$('#phanloai-list').removeClass('active');
		$('#phanloai-list').removeClass('show');
		$('#phanloai-list-tab').removeClass('active');
		$('#phanloai-list-tab').attr('aria-selected', 'false');





		//

	});
}

function addclickPhanLoai() {
	// cap nhat
	$('#btn-sua-phanloai').off('click').click(() => {
		loading();

		var url = '/animu/api/update/phanloai';
		var data = {
			loaiphim: $('#loaiphim').val(),
			nam: $('#nam').val(),
			quocgia: $('#quocgia').val(),
			theloai: $('#theloai').val(),


		};

		PostAPI(url, data, function (result) {

			loaded(result);
			// chinh sua xong => load lai du lieu
			loadlistPhanLoai();
		});

	});
}

function loadlistPhanLoai() {
	getAPI('/animu/api/get/phanloai', function (result) {


		if (result.length != 0) {

			var listItem = ('<tr class="text-center">');
			listItem += ('<td>' + result.idphim + '</td>');
			listItem += ('<td>' + result.loaiphim + '</td>');
			listItem += ('<td>' + result.theloai + '</td>');
			listItem += ('<td>' + result.quocgia + '</td>');
			listItem += ('<td>' + result.nam + '</td>');

			listItem += ("<td>" + "<button class='btn btn-primary btn-edit-phanloai' value='" + (result.idphim) + "'>Chỉnh sửa</button>" + "</td>");
			listItem += ('</tr>');

			$('#body-phanloai').html(listItem);

			////
			$('.btn-edit-phanloai').off('click').click(function () {
				addClickphanloai();
			});
		}

		addClickphanloai();// tai len form
	});
}


/////////////////////         ////////////////////////////////
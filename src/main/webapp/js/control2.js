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
	var mes = result.split(',');
	if (mes[0] == 0) {// thong bao loi

		$('#mes').text(mes[1]);

		$('#mes').addClass('text-danger');
	} else {// thong bao thanh cong
		$('#mes').text(mes[1]);
		$('#mes').addClass('text-success');
	}
}

function getAPI(url, callback) {
	$.ajax({
		url: url,
		type: "GET",
		success: function(result) {
			callback(result);
		}
	});
}

function PostAPINotJson(url, data, callback) {
	$.ajax({
		url: url,
		type: "POST",
		data: data,
		success: function(result) {

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
		success: function(result) {

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

		$.each(paginatedMovies, function(index, movie) {
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
		if (totalPages > 2) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function(e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function(e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function(e) {

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
		$('#pagination .page-item').removeClass('active').filter(function() {
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
	getAPI('/animu/api/get/phim', function(result) {

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

		$.each(paginatedMovies, function(index, movie) {
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
		$('.btn-edit-chitietphim').off('click').click(function() {
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
		if (totalPages > 2) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function(e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function(e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function(e) {

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
		$('#pagination .page-item').removeClass('active').filter(function() {
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

		$.each(paginatedMovies, function(index, movie) {
			console.log(movie);

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
			if(movie.like){
				like = 'Đã thích';
			}else{
				like = 'Chưa thích';
			}
			listItem.append('<td>' + like + '</td>');
			listItem.append('<td>' + movie.date + '</td>');
			listItem.append("<td>" + "<button class='btn btn-danger btn-delete-chitietnguoidung' value='" + (movie.idchitiet) + "'>Xóa hành động</button>" + "</td>");
			listItem.append("<td>" + "<button class='btn btn-warning btn-delete-chitietnguoidung-cmt' value='" + (movie.idchitiet) + "'>Xóa bình luận</button>" + "</td>");
			listItem.append('</tr>');

			movieList.append(listItem);
			//

			////////////////

		});
		$('.btn-edit-chitietphim').off('click').click(function() {
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
		if (totalPages > 2) {
			pagination.append($('<span class="page-item go-to-last">' + totalPages + '</span>').attr('data-target', totalPages));
		}

		// Calculate the visible pages
		updateVisiblePages(currentPage);

		// Setup click handlers
		pagination.on('click', '.page-item', function(e) {

			var page = $(this).attr('data-target');// lay gia tri cua trang duoc chon

			currentPage = page;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to First Page"
		pagination.on('click', '.go-to-first', function(e) {

			currentPage = 1;
			displayMovies(movies, currentPage);
			updateVisiblePages(currentPage);
		});

		// Click handler for "Go to Last Page"
		pagination.on('click', '.go-to-last', function(e) {

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
		$('#pagination .page-item').removeClass('active').filter(function() {
			return $(this).attr('data-target') == currentPage;
		}).addClass('active');
	}

	// Initial call to display movies and setup pagination
	displayMovies(movies, currentPage);
	setupPagination(movies);

}


//////////////////////////////////// ở trên ko đụng tới////////////////////////////////////

function loadPhimForm() {
	getAPI('/animu/api/get/phim', function(result) {

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

	$('.btn-edit-phim').off('click').click(function() {
		var idphim = $(this).val();

		getAPI('/animu/api/get/phim/' + idphim, function(result) {

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
	getAPI('/animu/api/get/editPhim', function(result) {
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

		PostAPINotJson('/animu/api/search/phim', data, function(result) {
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

		PostAPI(url + idphim, data, function(result) {

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
			getAPI('/animu/api/load/listphim', function(result) {
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

		PostAPI(url, data, function(result) {
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
			getAPI('/animu/api/load/listphim', function(result) {

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
		getAPI('/animu/api/phim/clearPhim', function(result) {



			//addbtneditphim();

		});
		getAPI('/animu/api/load/listphim', function(result) {

			phantrang(result);

			//	addbtneditphim();

		});
	});

}



// thêm các sự kiện hoặc load dữ liệu cần thiết cho trang
$(document).ready(function() {

	getAPI('/animu/api/' + 1, function(result) {
		html = result;
		$('#main').html(html);
		getThongBaoPhim();// hien thi thong bao phim dang duoc edit
	});
	///
	// lay du lieu tong user va phim
	getAPI('/animu/api/char', function(result) {
		var data = result.split(',');
		$('#total-users').text(data[0]);
		$('#total-movies').text(data[1]);
		loadChar();// tao bieu do
	});

	// to mau nen
	$('#option1').addClass('selected');


	$('.nav-item').off('click').click(function() {
		// Lấy giá trị của data-target từ mục menu được chọn
		var option = $(this).attr('data-target');
		var html = '';
		// tai trang html
		getAPI('/animu/api/' + option, function(result) {
			html = result;
			$('#main').html(html);
			getThongBaoPhim();// hien thi thong bao phim dang duoc edit
			//
			// tai du lieu len trang
			if (option == 1) {
				// lay du lieu tong user va phim
				getAPI('/animu/api/char', function(result) {
					var data = result.split(',');
					$('#total-users').text(data[0]);
					$('#total-movies').text(data[1]);
					loadChar();// tao bieu do
				})
			}



			if (option == 2) {
				getAPI('/animu/api/load/listphim', function(result) {

					phantrang(result);

					//	addbtneditphim();
					addClickForPhim();
					loadPhimForm();
				});
			}
			// chi tiet phim
			if (option == 3) {
				loadctphimform();
				loadctphimlist();
			}

			// tap phim 
			if (option == 4) {
				// goi 2 ham
				// goi ham add su kien
			}

			if (option == 7) {
				loadnguoidunglist();
				$('#btn_timkiem_phim').off('click').click(function() {
					searchNguoiDung();
				});
				loadvaitro();
			}
			if(option == 8){// ct nguoi dung
				loadChiTietNguoiDung();
				addClickSearchCTNguoiDung();
			}



		});
	});


	// doi backgound khi duoc click 
	$('.nav-item').click(function() {
		// Xóa lớp 'selected' từ tất cả các đoạn văn
		$('.nav-item').removeClass('selected');
		// Thêm lớp 'selected' cho đoạn văn được click
		$(this).addClass('selected');
	});

	// Xử lý sự kiện click cho phần tử h1 có id là phimbtn
	$('#phimbtn').click(function() {
		// Slide toggle all hidden menu items
		$('.menu-item-phim').slideToggle('slow');
	});

	$('#userbtn').click(function() {
		// Slide toggle all hidden menu items
		$('.menu-item-user').slideToggle('slow');
	});

	$('#otherbtn').click(function() {
		// Slide toggle all hidden menu items
		$('.menu-item-other').slideToggle('slow');
	});


	$('.nav-item').hover(
		function() {
			$(this).css('transform', 'translateX(15px)'); // Di chuyển phần tử sang phải khi hover vào
		},
		function() {
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
	getAPI('/animu/api/get/chitietphim', function(result) {

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
		//
		updateChiTietPhim();
	});

}

function updateChiTietPhim() {
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

		PostAPI(url, data, function(result) {
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
	getAPI('/animu/api/get/chitietphim', function(result) {
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
		$('.btn-edit-chitietphim').off('click').click(function() {
			loadctphimform();
		});
	});

}
/////////////////// Nguoi dung ///////////////////////////////
function loadvaitro() {

	getAPI('/animu/api/get/nguoidung/vaitro', function(result) {
		$('#roleSelect').append('<option value="-1">Tất cả</option>');
		$.each(result, function(index, item) {
			// index = key;
			$('#roleSelect').append('<option value='+index+'>'+item+'</option>');
		});

	});
}


function searchNguoiDung() {
	var data = {
		key: $('#searchInput').val(),
		option: $('#roleSelect').val()
	}
	

	PostAPINotJson('/animu/api/search/nguoidung', data, function(result) {
		phantrangnguoidung(result);
		//	addbtneditphim();
	});
}


function loadnguoidunglist() {
	getAPI('/animu/api/get/nguoidung/list', function(result) {

		phantrangnguoidung(result);
	});

}

function updatenguoidung(idnguoidung) {
	loading();
	getAPI('/animu/api/update/nguoidung/' + idnguoidung, function(result) {

		loaded(result);

		loadnguoidunglist();
	});

}

//////////////////// chi tiet nguoi dung //////////////////////////////
function loadChiTietNguoiDung(){
	
	getAPI('/animu/api/load/chitietnguoidung', function(result) {

		phantrangchitietnguoidung(result);
	});
}

function addClickSearchCTNguoiDung(){
	$('#searchct').off('click').click(function(){
		searchChiTietNguoiDung();
	});
}

function searchChiTietNguoiDung(){
	
	var data = {
		key: $('#searchInputDetail').val()
	}
	

	PostAPINotJson('/animu/api/search/chitietnguoidung', data, function(result) {
		phantrangchitietnguoidung(result);
	});

}

/////////////////////         ////////////////////////////////
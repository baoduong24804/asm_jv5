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

function postwithfile(url,data, callback) {
	$.ajax({
		url: url,
		type: 'POST',
		data: data,
		processData: false, // Important
		contentType: false, // Important
		success: function(result) {
			callback(result);
		}
	});
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

/////////////////////////////////////////////////////////////////////////////////////////////////////
















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

<script src="https://kit.fontawesome.com/11f5ba3935.js"
	crossorigin="anonymous"></script>

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

#mainview {
	display: none;
}

#hiddenInp {
	display: none;
}
</style>

<body>
	<div class="container-fluid">

		<input type="number" id="hiddenInp"
			value="${actionEdit != -1 ? actionEdit : -1 }">

		<div class="row">
			<nav id="nav" class="col-md-2 d-none d-md-block bg-dark sidebar ">

				<div class="text-center m-2">
					<img style="max-height: 50px; max-width: 50px"
						src="https://www.pngmart.com/files/22/User-Avatar-Profile-Background-Isolated-PNG.png"
						alt="User Avatar" class="rounded-circle">
					<p class="text-white text-truncate">Ty Bao</p>
					<hr class="white-hr">

				</div>

				<div class="sidebar-sticky">
					<%@ include file="_phimct.jsp"%>
					<hr class="white-hr">
					<%@ include file="_userct.jsp"%>

				</div>
			</nav>
			<main id="main" role="main"
				class="col-md-10 ml-sm-auto col-lg-10 px-4">
				<div id="mainview">
					<div id="charview">
						<%@ include file="./mn/_char.jsp"%>
					</div>
					<div id="phimview">
						<%@ include file="./mn/_phim.jsp"%>
					</div>

					<div id="chitietphimview">
						<%@ include file="./mn/_chitietphim.jsp"%>
					</div>

					<div id="tapphimview">
						<%@ include file="./mn/_tapphim.jsp"%>
					</div>

					<div id="nhasxview">
						<%@ include file="./mn/_nhasx.jsp"%>
					</div>

					<div id="phanloaiview">
						<%@ include file="./mn/_phanloai.jsp"%>
					</div>

				</div>


			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script>
		
		const navs = document.querySelectorAll('.menu-item');
		const phimview = document.getElementById('phimview');
		const charview = document.getElementById('charview');
		const chitietphimview = document.getElementById('chitietphimview');
		const tapphimview = document.getElementById('tapphimview');
		const nhasxview = document.getElementById('nhasxview');
		const phanloaiview = document.getElementById('phanloaiview');
		//

		//
		//reload();

		function load() {
			const mainview = document.getElementById('mainview');
			//mainview.style.display = 'none';
			mainview.style.display = 'block';
		}
	
		window.onload = load;
		
		
		window.addEventListener('load', function() {
			reload();
		});

		function reload() {
			

			phimview.style.display = 'none';
			charview.style.display = 'none';
			chitietphimview.style.display = 'none';
			tapphimview.style.display = 'none';
			nhasxview.style.display = 'none';
			phanloaiview.style.display = 'none';

			
			
			var currentUrl = window.location.href;
			if (currentUrl.endsWith('/control')) {
				charview.style.display = 'block';
				//menu[0].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/phim')) {
				phimview.style.display = 'block';
				//menu[1].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/chitietphim')) {
				chitietphimview.style.display = 'block';
				//menu[2].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/tapphim')) {
				tapphimview.style.display = 'block';
				//menu[3].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/nhasx')) {
				nhasxview.style.display = 'block';
				//menu[4].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/phanloai')) {
				phanloaiview.style.display = 'block';
				//menu[5].classList.add('bg-primary');
			}

		}

		function changeURL(value, index) {
			history.pushState({}, '', '/animu/' + value);

			const currentUrl = window.location.href;

			// Duyệt qua từng phần tử trong HTMLCollection
			for (var i = 0; i < navs.length; i++) {
				if (i == index) {
					navs[i].classList.add('bg-primary');
				} else {
					navs[i].classList.remove('bg-primary');
				}
			}

			phimview.style.display = 'none';
			charview.style.display = 'none';
			chitietphimview.style.display = 'none';
			tapphimview.style.display = 'none';
			nhasxview.style.display = 'none';
			phanloaiview.style.display = 'none';

			if (currentUrl.endsWith('/phim')) {
				phimview.style.display = 'block';
			}

			if (currentUrl.endsWith('/control')) {
				charview.style.display = 'block';
			}
			if (currentUrl.endsWith('/chitietphim')) {
				chitietphimview.style.display = 'block';
				//navs[1].classList.add('bg-primary');
			}
			if (currentUrl.endsWith('/tapphim')) {
				tapphimview.style.display = 'block';

			}
			if (currentUrl.endsWith('/nhasx')) {
				nhasxview.style.display = 'block';

			}
			if (currentUrl.endsWith('/phanloai')) {
				phanloaiview.style.display = 'block';

			}

		}
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</body>

</html>
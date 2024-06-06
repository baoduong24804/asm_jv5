function changeURL(value, index) {
	history.pushState({}, '', '/test/' + value);
	const navs = document.getElementsByClassName('menu-item');
	const currentURL = window.location.href;
	checkURL(currentURL);
	// Duyệt qua từng phần tử trong HTMLCollection
	for (var i = 0; i < navs.length; i++) {
		if (i == index) {
			navs[i].classList.add('bg-primary');
		} else {
			navs[i].classList.remove('bg-primary');
		}
	}


}

function checkURL(url) {
	if (url.endsWith('/control')) {
		$.ajax({
			url: "http://localhost:8080/api/phim",
			success: function(result) {
				let html = "<ul>"
				result.forEach((item =>{
					html += "<li>"+item.tieude+"</li>";
				}))
				html += "</ul>";
				$("#mainview").html(html);
			}
		});
	}
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<h1 class="text-white text-center font-weight-bold">User</h1>
	<ul class="nav flex-column">

		<li onclick="changeURL('control/mail',9)"
			class="nav-item menu-item ${not empty action && action == 9 ? 'bg-primary' : '' }"><a
			class="nav-link text-white"><i class="fas fa-user"></i>Gửi Mail</a></li>
	</ul>

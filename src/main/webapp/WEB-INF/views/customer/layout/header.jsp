
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<header>
	<div class="container header-container">
		<div class="header-left"></div>
		<div class="header-center">
			<a href="${base}/home"><img src="${base}/img/logo.png" alt=""></a>
		</div>
		<div class="header-right">
			<div class="icon" style="display: flex;align-items: center;">
				<form action="${base}/home" method="POST" style="margin-right: 30px; display: flex; height: 40px">
					<input type="text" id="keyword" name="name" class="form-control"
						placeholder="..." autocomplete="off" style="margin-right: 10px;"> 
					<button class="btn btn-warning" type="submit">Tìm Kiếm</button>
				</form>
				<sec:authorize access="isAuthenticated()">
					<a href="${base}/logout" style="margin-right: 20px;">
						<button type="button" class="btn btn-warning" style="height: 40px;
    margin-bottom: 5px;">Logout</button></a>
				</sec:authorize>

				<sec:authorize access="!isAuthenticated()">
						<a href="${base}/login" style="color: #000;">
							<i class="fa-regular fa-user"></i>
						</a>
				</sec:authorize>

				<a href="${base}/cart" style="color: #000;">
					<i class="fa-solid fa-cart-shopping">
						<div class="count-holder" id="iconShowTotalItemsInCart">${totalItems}</div>
					</i>
				</a>
			</div>
		</div>
	</div>
</header>
<nav class="container nav-container">
	<ul class="nav">
		<li><a href="${base}/home" class="active">Trang chủ</a></li>
		<li class="dropdown"><a href="">Collection view <i
				class="fa-solid fa-angle-down"></i></a>
			<div class="dropdown-list">
				<a href="${base}/product">Bộ sưu tập mùa thu</a> <a
					href="${base}/product">Bộ sưu tập mùa đông</a>
			</div></li>
		<li class="dropdown"><a href="">Product view <i
				class="fa-solid fa-angle-down"></i></a>
			<div class="dropdown-list">
				<a href="${base}/product">Chăm sóc da mặt</a> <a href="">dầu gội
					/ dầu xả</a> <a href="${base}/product">Phụ kiện chăm sóc</a>
			</div></li>
		<li><a href="">Liên hệ</a></li>
	</ul>
</nav>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Document</title>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" media="screen"
	href="${base}/css/customerProduct.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<main>
		<div class="menu-header">
			<ul class="container   breadcrumd">
				<li><a href="${base}/home">Trang chủ</a></li>
				<li><a href="">Danh mục</a></li>
				<li>Sản phẩm nổi bật</li>
			</ul>
			<div class="banner">
				<img src="${base}/img/banner.png" alt="">
			</div>
		</div>
		<div class="container desc-product">
			<a href="">
				<h1>Sản phẩm nổi bật</h1>
			</a>
			<div class="filter">
				<span class="filter-btn">Bộ lọc <i class="fa-solid fa-filter"></i></span>
				<div class="price-filter">
					<span class="price-btn">Giá: Tăng Dần <i
						class="fa-solid fa-chevron-down"></i></span>
					<ul class="dropdown-price">
						<li><a href="${base}/product/viewAsc">Giá: Tăng dần</a></li>
						<li><a href="${base}/product/viewDes">Giá: Giảm dần</a></li>
						<li><a href="">Cũ nhất</a></li>
						<li><a href="">Mới nhất</a></li>
						<li><a href="${base}/product/viewNameAsc">Tên: A-Z</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container main-container">
			<div class="product">
				<div class="product-list">
					<!--start-->
					<c:forEach items="${product}" var="products">
						<div class="product-item">
							<a href="${base}/product/${products.id}"><img
								src="${base}/upload/${products.avatar}" alt=""></a>
							<p>${products.title}</p>
							<fmt:setLocale value="vi_VN" />
							<p class="price">
								<fmt:formatNumber value="${products.price}" type="currency"></fmt:formatNumber>
								
							</p>
						</div>
					</c:forEach>
					<!--end-->
				</div>

				<nav aria-label="Page navigation example ">
					<ul class="pagination justify-content-center">

						<c:if test="${currentPages >=1}">
							<li class="page-item "><a class="page-link"
								href="${base}?p=${currentPages-1}">Previous</a></li>
						</c:if>

							<li class="page-item"><a class="page-link"
													 href="${base}?p=0">1</a></li>
							<li class="page-item"><a class="page-link"
													 href="${base}?p=1">2</a></li>
							<li class="page-item"><a class="page-link"
													 href="${base}?p=${currentPages+1}">Next</a></li>

					</ul>
				</nav>
			</div>
			<div class="filter-product">
				<div class="filter-active">
					<div class="filter-brand">
						<h4>Thương hiệu</h4>
						<div class="form-control">
							<input type="checkbox" name="" id=""> Selena
						</div>
					</div>
					<div class="filter-price">
						<h4>Giá Tiền</h4>
						<div class="form-control">
							<input type="checkbox" name="" id="">Dưới 1.000.000
						</div>
						<div class="form-control">
							<input type="checkbox" name="" id="">Từ 1.000.000 -
							2.000.000
						</div>
						<div class="form-control">
							<input type="checkbox" name="" id="">Từ 1.000.000 -
							2.000.000
						</div>
						<div class="form-control">
							<input type="checkbox" name="" id="">Từ 1.000.000 -
							2.000.000
						</div>
						<div class="form-control">
							<input type="checkbox" name="" id="">Từ 1.000.000 -
							2.000.000
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>



	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="${base}/js/jquery-3.6.1.min.js"></script>
	<script src="${base}/js/product.js"></script>

</body>

</html>
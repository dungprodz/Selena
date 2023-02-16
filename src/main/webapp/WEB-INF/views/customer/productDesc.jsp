<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" media="screen"
	href="${base}/css/desc_product.css">
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
				<li><a href="">Trang chủ</a></li>
				<li>Sản phẩm nổi bật</li>
				<li>${productTitle}</li>
			</ul>
		</div>
		<div class="container main-container">
			<div class="main-left">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-interval="4000" data-ride="carousel">
					
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="${base}/upload/${productAvatar}"
								alt="First slide">
						</div>
					</div>
				</div>
				<div class="description">
					<div class="des-header">
						<p>Mô tả</p>
						<i class="fa-solid fa-plus btn-more"></i>
					</div>
					<p class="desc">
						${productDesc}
					</p>
					<div class="des-header">
						<p>Chính sách đổi trả</p>
						<i class="fa-solid fa-plus btn-more-order"></i>
					</div>
					<p class="order">
						
					</p>
				</div>
			</div>
			<div class="main-right">
				<div class="desc-product">
					
						<h2 class="desc-product-name">${productTitle}</h2>
							<fmt:setLocale value="vi_VN"/>
						<p class="desc-product-price"><fmt:formatNumber value="${productPrice}" type="currency"></fmt:formatNumber></p>
						<div class="quanlity">
							<i class="fa-solid fa-plus"></i> <span>1</span> <i
								class="fa-solid fa-minus"></i>
							<a class="btn-add"onclick="AddProductToCart('${base}', ${productId}, 1)"> Add
							to cart </a>
						</div>
			
				</div>

			</div>
		</div>
		<div class="container product-container">
			<div class="product">
				<div class="desc-product-bottom">
					<a href="${base}/product">
						<h1>Sản phẩm liên quan</h1>
					</a>
				</div>
				<div class="product-list">
					<!--start-->
					<c:forEach items="${products}" var="products">
						<div class="product-item">
							<a href="${base}/product/${products.id}"><img src="${base}/upload/${products.avatar}"
								alt=""></a>
							<p>${products.title}</p>
							<p class="price">${products.price}VND</p>
						</div>
					</c:forEach>
					<!--end-->
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
	<script src="${base}/js/descProduct.js"></script>
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>

</html>
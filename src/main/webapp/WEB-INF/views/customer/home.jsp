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
	href="${base}/css/customerHome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>


	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-interval="4000" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="${base}/img/slider.png"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="banner">Cung cấp mỹ phẩm tốt nhất</h1>
					<button class="btn-slider">Mua Ngay</button>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="${base}/img/slider2.png"
					alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="banner">Sản phẩm làm đẹp</h1>
					<button class="btn-slider">Mua Ngay</button>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="${base}/img/slider3.png"
					alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="banner">Kem tự nhiên cho làn da mềm mại</h1>
					<button class="btn-slider">Mua Ngay</button>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container main-container">
		<div class="product">
			<div class="desc-product">
				<a href="${base}/product">
					<h1>Sản phẩm tốt cho sức khỏe</h1>
				</a>
				<p>Cung cấp các sản phẩm có chất lượng cao</p>
			</div>
			<div class="product-list">
				<!--start-->
				<c:forEach items="${product}" var="products">
					<div class="product-item">
						<a href="${base}/product/${products.id}"><img
							src="${base}/upload/${products.avatar}" alt=""></a>
						<p>${products.title}</p>
						<fmt:setLocale value="vi_VN"/>
						<p class="price"><fmt:formatNumber value="${products.price}" type="currency"></fmt:formatNumber> </p>
						<a class="btn btn-outline-dark mt-auto" href="#"
							onclick="AddProductToCart('${base}', ${products.id }, 1)" style="margin-left: 35%; margin-bottom: 50px"> Add
							to cart </a>
					</div>
				</c:forEach>
				<!--end-->
			</div>

			<nav aria-label="Page navigation example ">
				<ul class="pagination justify-content-center">
					<c:if test="${currentPages >=1}">
						<li class="page-item "><a class="page-link"
							href="${base}/home?p=${currentPages-1}">Previous</a></li>
					</c:if>
					<li class="page-item"><a class="page-link"
						href="${base}/home?p=0">1</a></li>
					<li class="page-item"><a class="page-link"
						href="${base}/home?p=1">2</a></li>
					<li class="page-item"><a class="page-link"
						href="${base}/home?p=${currentPages+1}">Next</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<div class="main-bottom">
		<div class="container banner-main">
			<h1 class="banner-desc">Kem khoáng Deadsea</h1>
			<p>
				Kem khoáng Deadsea Multi-Vitamin kem SPF-20 khoáng chất (Sức <br>
				khỏe & Làm đẹp) bao gồm một phức hợp các vitamin C và kết hợp với <br>
				dầu hoa anh thảo, cây hắc mai biển, trà xanh, lô hội, cũng như các
				bộ <br> lọc tia UVA và UVB.
			</p>
			<button class="btn-slider">Mua ngay</button>
		</div>
	</div>
	<div class="container main-container">
		<div class="product">
			<div class="desc-product">
				<a href="${base}/product">
					<h1>Sản phẩm khuyến mãi</h1>
				</a>
				<p>Cung cấp các sản phẩm có chất lượng cao</p>
			</div>
			<div class="product-list">
				<!--start-->
				<c:forEach items="${product}" var="products">
					<div class="product-item">
						<a href="${base}/product/${products.id}"><img
							src="${base}/upload/${products.avatar}" alt=""></a>
						<p>${products.title}</p>
						<fmt:setLocale value="vi_VN"/>
						<p class="price"><fmt:formatNumber value="${products.price}" type="currency"></fmt:formatNumber></p>
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

	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>


</body>

</html>
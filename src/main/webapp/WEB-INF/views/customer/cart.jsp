
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Selena</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" media="screen" href="${base}/css/cart.css">
</head>

<body class="goto-here">

	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<!-- END nav -->


	<main>
		<div class="container">
			<div class="title">Giỏ hàng của bạn</div>
			<div class="list-product">
				<c:forEach items="${cart.cartItems}" var="ci">
					<div class="row">
						<div class="product-info">
							<a href=""> <img src="${base}/upload/${ci.productAvatar}"
								alt="">
							</a>
							<div class="description" style="display: block;">
								<h2>
									<a href="">${ci.productName}</a>
								</h2>
								<div class="brand">Thương hiệu: Selena</div>
								<fmt:setLocale value="vi_VN" />
								<div class="price">
									<fmt:formatNumber value="${ci.priceUnit}" type="currency"></fmt:formatNumber>
								</div>
							</div>
						</div>
						<div class="action">
							<div class="slg_sp">
								<button type="button" data-type="tru" class="btn-tru" style="border: none;" >-</button>
								<input type="text" data-price="${ci.priceUnit}"
									value="${ci.quanlity}" class="input_slg">
								<button type="button" data-type="cong" class="btn-cong" style="border: none;">+</button>
							</div>
							<div class="total"></div>
							<button class="btn-xoa" type="button" onclick="DeleteProductFromCart('${base}', ${ci.productId})">Xóa</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="check_out container" style="margin-bottom: 30px;">
			<div class="total-price">
				<fmt:setLocale value="vi_VN" />
				<span>Tổng tiền: </span> <span id="total-price"><fmt:formatNumber
						value="${sessionScope.totalPrice}" type="currency"></fmt:formatNumber></span>
			</div>
			<div class="content">
				<form action="${base}/cart/checkout" method="post">
					<div class="form">
						<input type="text" class="form-control" name="customerFullName"
							value="${userLogined.username }" placeholder="Họ Tên">
						<p id="required"></p>
					</div>
					<div class="form">
						<input type="text" class="form-control" name="customerEmail"
							value="${userLogined.email }" placeholder="Email">
						<p id="required"></p>
					</div>
					<div class="form">
						<input type="text" class="form-control" name="customerPhone"
							value="${userLogined.phone }" placeholder="Số Điện Thoại">
						<p id="required"></p>
					</div>
					<div class="form">
						<input type="text" class="form-control" name="customerAddress"
							value="${userLogined.shippingAddress }" placeholder="Địa Chỉ">
						<p id="required"></p>
					</div>
					<div class="form">
						<button type="submit" class="btn-create">Check out</button>
					</div>
				</form>
			</div>
		</div>

	</main>

	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
	function DeleteProductFromCart(baseUrl, productId) {
		
		let data = {
			productId: productId, 	// Id sản phẩm
		
		};

	
		jQuery.ajax({
			url: baseUrl + "/ajax/DeleteCart", //->action
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json", // kieu du lieu tra ve tu controller la json
			success: function(jsonResult) {
				
				$('.btn-xoa').on('click', function() {
					$(this).parents('.row').remove();
					let total = totalPrice();
					$('#total-price').text(formatPrice(total) + 'VND')
				})
				
			},
			error: function(jqXhr, textStatus, errorMessage) {
				
			}
		});
	}
	</script>

</body>

</html>
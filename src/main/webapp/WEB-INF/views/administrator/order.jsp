<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<title>Admin page</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link href="${base}/css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
<body>
	<div class="wrapper">

		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${base}/admin/product/list">
					<span class="align-middle">Admin page</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Pages
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${base}/admin/product/list">
							<i class="align-middle" data-feather="sliders"></i> <span
								class="align-middle">Dashboard</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${base}/admin/profile">
							<i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
						</a>
					</li>

					<li class="sidebar-item"><a class="sidebar-link"
												href="${base}/logout"> <i class="align-middle"
																		  data-feather="log-in"></i> <span class="align-middle">logout
								</span>
					</a></li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${base}/admin/product">
							<i class="align-middle" data-feather="inbox"></i> <span class="align-middle"> Product</span>
						</a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="${base}/admin/category">
							<i class="align-middle" data-feather="bar-chart-2"></i> <span
								class="align-middle">Category</span>
						</a>
					</li>

					<li class="sidebar-item active"><a class="sidebar-link"
												href="${base}/admin/order"> <i class="align-middle" data-feather="map"></i> <span
							class="align-middle">Order</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> <span
										class="indicator">4</span>
								</div>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="message-square"></i>
								</div>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="${base}/img/images.png"
								class="avatar img-fluid rounded me-1" alt="" /> <span
								class="text-dark"></span>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i
									class="align-middle me-1" data-feather="settings"></i> Settings
									& Privacy</a> <a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="help-circle"></i> Help
									Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="${base}/logout">Log out
									(${userLogined.email})</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<strong>Danh sách Hoá đơn</strong>
					</h1>
					<form action="${base }/admin/order" method="post">
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input id="page" name="id" class="form-control"
									placeholder="Nhập số hoá đơn">
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Seach</button>
							</div>
						</div>
					</form>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Số hoá đơn</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col">Ngày tạo</th>
								<th scope="col">Trạng thái</th>
								<th scope="col">Email</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order}" var="order" varStatus="loop">
								<tr>
									<th scope="row" width="5%">${loop.index + 1}</th>
									<td>${order.id }</td>
									<td>${order.customerAddress}</td>
									<td>${order.createdDate}</td>
									<td>${order.status}</td>
									<td>${order.customerEmail}</td>
									<td width="15%">

										<div>
											<a class="btn btn-primary"
												href="${base}/admin/bill/${order.id}" role="button">Check</a>
											<!-- Button trigger modal -->
											<a style="color: #FFFFFF" data-order-id="${order.id}" type="button" class="btn btn-primary edit-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
												Edit
											</a>

											<!-- Modal -->
											<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
													<div class="modal-content">
														<form id="editForm" action="${base}/admin/order/${order.id}" method="post">
															<div class="modal-header">
																<h5 class="modal-title" id="staticBackdropLabel">Chỉnh sửa trạng thái</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="btn-group">
																	<button type="button" id="dropdownMenuButton" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																		Trạng Thái
																	</button>
																	<ul class="dropdown-menu">
																		<li><a class="dropdown-item" >Đang giao hàng</a></li>
																		<li><a class="dropdown-item" >Đã Thanh toán</a></li>
																		<li><a class="dropdown-item" >Hủy</a></li>
																		<li><hr class="dropdown-divider"></li>
																	</ul>
																</div>
																<input style="margin-top: 10px" class="form-control" name="status" type="text" id="selected-option" readonly>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
																<button type="submit" class="btn btn-primary">Lưu</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<nav aria-label="Page navigation example ">
				<ul class="pagination justify-content-center">
					<c:if test="${currentPages >=1}">
						<li class="page-item "><a class="page-link"
							href="${base}/admin/order?p=${currentPages-1}">Previous</a></li>
					</c:if>
					<li class="page-item"><a class="page-link"
						href="${base}/admin/order?p=0">1</a></li>
					<li class="page-item"><a class="page-link"
						href="${base}/admin/order?p=1">2</a></li>
					<li class="page-item"><a class="page-link"
						href="${base}/admin/order?p=${currentPages+1}">Next</a></li>
				</ul>
			</nav>
				</div>
			</main>
		</div>
	</div>

	<script src="${base}/js/app.js"></script>
	<script src="${base}/js/jquery-3.6.1.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>

	<script type="text/javascript">
		const dropdownItems = document.querySelectorAll('.dropdown-item');
		const selectedOption = document.getElementById('selected-option');

		dropdownItems.forEach(function(item) {
			item.addEventListener('click', function() {
				selectedOption.value = item.textContent;
			});
		});

		$('#staticBackdrop').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget); // Nút "Chỉnh sửa" được nhấp vào
			var orderId = button.data('order-id'); // Lấy ID của hóa đơn từ thuộc tính data-order-id

			var form = $(this).find('#editForm');
			var actionUrl = '${base}/admin/order/' + orderId; // Tạo URL chứa ID hóa đơn
			form.attr('action', actionUrl);
		});


	</script>




</body>

</html>
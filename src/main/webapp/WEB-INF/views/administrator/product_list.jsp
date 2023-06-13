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

		<jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>

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
						<strong>Sản phẩm</strong>
					</h1>
					<form action="${base }/admin/product/list" method="get">
						<!-- tìm kiếm sản phẩm trên danh sách -->
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input id="page" name="page" class="form-control"
									value="${productSearch.currentPage }">

								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" name="keyword"
									class="form-control" placeholder="Search" autocomplete="off"
									style="margin-right: 5px;" value="${productSearch.keyword }">

								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="categoryId" id="categoryId"
									style="margin-right: 5px;">
									<option value="0">All</option>
									<c:forEach items="${categories}" var="category">
										<option value="${category.id }">${category.name }</option>
									</c:forEach>
								</select>

								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Seach</button>
							</div>
							<div>
								<a class="btn btn-outline-primary mb-1"
									href="${base }/admin/product/" role="button"> Add New </a>
							</div>
						</div>
					</form>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Title</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Xóa/Chưa Xóa</th>
								<th scope="col">Avatar</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products.data}" var="product"
								varStatus="loop">
								<tr>
									<th scope="row" width="5%">${loop.index + 1}</th>
									<td>${product.title }</td>
									<td>
										<!-- định dạng tiền tệ --> <fmt:setLocale value="vi_VN"
											scope="session" /> <fmt:formatNumber
											value="${product.price}" type="currency" />
									</td>
									<td>${product.categories.name }</td>
									<td><span id="_product_status_${product.id}"> <c:choose>
												<c:when test="${product.status == 1}">
													<input type="checkbox" checked="checked" name="status"
														readonly="readonly">
												</c:when>
												<c:when test="${product.status == 0}">
													<input type="checkbox" name="status" readonly="readonly">
												</c:when>
											</c:choose>
									</span></td>
									<td><img src="${base}/upload/${product.avatar}"
										width="100" height="100"></td>
									<td width="15%">
										<form action="${base}/delete" method="post">
											<div>
												<a class="btn btn-primary"
													href="${base }/admin/product/${product.id}" role="button">Edit</a>
												<a class="btn btn-danger" role="button"
													href="${base }/delete/${product.id}">Delete</a>
											</div>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="row">
						<div class="col-12 d-flex justify-content-center">
							<div id="paging"></div>
						</div>
					</div>


				</div>
			</main>
		</div>
	</div>

	<script src="${base}/js/app.js"></script>
	<script src="${base}/js/jquery-3.6.1.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>

	<script type="text/javascript">
			$( document ).ready(function() {
				
				$("#categoryId").val(${productSearch.categoryId});
				
				$(function() {
				    $("#paging").pagination({
				    	currentPage: ${products.currentPage}, 	//trang hiện tại
				        items: ${products.totalItems},			//tổng số sản phẩm
				        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
				        cssStyle: 'light-theme',
				        onPageClick: function(pageNumber, event) {
				        	$('#page').val(pageNumber);
				        	$('#btnSearch').trigger('click');
						},
				    });
				});
			});			
		
	</script>




</body>

</html>
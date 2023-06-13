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

<link rel="canonical" href="https://demo-basic.adminkit.io/" />
<title>Admin page</title>
<link href="${base}/css/app.css" rel="stylesheet">
<link rel="stylesheet" href="${base}/css/product.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="${base}/admin/product/list"> <span
					class="align-middle">Admin page</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">Pages</li>

					<li class="sidebar-item "><a class="sidebar-link"
						href="${base}/admin/product/list"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="${base}/admin/profile"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">Profile</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base}/logout"> <i class="align-middle"
							data-feather="log-in"></i> <span class="align-middle">logout
								</span>
					</a></li>

					<li class="sidebar-item "><a class="sidebar-link"
						href="${base}/admin/product"> <i class="align-middle"
							data-feather="inbox"></i> <span class="align-middle">
								Product</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link" href="#">
							<i class="align-middle" data-feather="bar-chart-2"></i> <span
							class="align-middle">Charts</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link" href="#">
							<i class="align-middle" data-feather="map"></i> <span
							class="align-middle">Maps</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
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
								<a class="dropdown-item" href="${base}/admin/profile"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="settings"></i> Settings
									& Privacy</a> <a class="dropdown-item" href="#"><i
									class="align-middle me-1" data-feather="help-circle"></i> Help
									Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="${base}/logout">Log out (${userLogined.email})</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Profile</h1>
					</div>
					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Details</h5>
								</div>
								<div class="card-body text-center">
									<img src="${base}/img/images.png" alt=""
										class="img-fluid rounded-circle mb-2" width="128" height="128" />
									<h5 class="card-title mb-0"> ${userLogined.username}</h5>
									<div class="text-muted mb-2">${userLogined.email}</div>

									<div>
										<a class="btn btn-primary btn-sm" href="#"><span
												data-feather="message-square"></span> Message</a>
									</div>
								</div>
								<hr class="my-0" />
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">About</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="home" class="feather-sm me-1"> </span>Name  <a href="#"> ${userLogined.username}</a></li>

										<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span>
											Email <a href="#">${userLogined.email}</a></li>
										<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span>
											From <a href="#">Ha Noi</a></li>
									</ul>
								</div>
								<hr class="my-0" />
							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Activities</h5>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>
		</div>
	</div>
	<script src="${base}/js/jquery-3.6.1.min.js"></script>
	<script src="${base}/js/app.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js">
	</script>
	<script>
		$(document).ready(function() {
			$('#details').summernote({

			});
		});
	</script>
</body>

</html>
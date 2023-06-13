<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<span class="align-middle">Admin page</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Pages
					</li>

					<li class="sidebar-item active">
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

					<li class="sidebar-item"><a class="sidebar-link"
						href="${base}/admin/order"> <i class="align-middle" data-feather="map"></i> <span
							class="align-middle">Order</span>
					</a></li>
				</ul>
			</div>
		</nav>
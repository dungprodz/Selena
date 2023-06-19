<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
                            class="avatar img-fluid rounded me-1" alt=""/> <span
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
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle">Bill Details</h1>
                </div>
                <div class="row">
                    <div class="col-md-4 col-xl-3">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Customer Details</h5>
                            </div>

                            <div class="card-body text-center">
                                <img src="${base}/img/images.png" alt=""
                                     class="img-fluid rounded-circle mb-2" width="128"
                                     height="128"/>
                                <h5 class="card-title mb-0">${customerName}</h5>
                            </div>
                            <hr class="my-0"/>
                            <hr class="my-0"/>
                            <div class="card-body">
                                <h5 class="h6 card-title">About</h5>
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-1"><span data-feather="home"
                                                           class="feather-sm me-1"></span> Email <a
                                            href="#">${customerEmail}</a>
                                    </li>

                                    <li class="mb-1"><span data-feather="briefcase"
                                                           class="feather-sm me-1"></span> Số điện thoại <a
                                            href="#">${bill.customerPhone}</a></li>
                                    <li class="mb-1"><span data-feather="map-pin"
                                                           class="feather-sm me-1"></span> Địa chỉ <a
                                            href="#">${bill.customerAddress}</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-8 col-xl-9">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Bill</h5>
                            </div>
                        </div>

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Title</th>
                                <th scope="col">Price</th>
                                <th scope="col">Category</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total Price</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderDetail}" var="orderDetail" varStatus="loop">
                                <tr>
                                    <th scope="row" style="vertical-align: middle;">${loop.index + 1}</th>
                                    <td>${orderDetail.product.title }</td>
                                    <td>
                                        <!-- định dạng tiền tệ -->
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${orderDetail.product.price}" type="currency"/>
                                    </td>
                                    <td>${orderDetail.product.categories.name }</td>
                                    <td>${orderDetail.quality }</td>
                                    <c:set var="quantity" value="${orderDetail.quality }"/>
                                    <c:set var="price" value="${orderDetail.product.price}"/>
                                    <c:set var="sum" value="${price.multiply(quantity)}"></c:set>
                                    <td>
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${sum}" type="currency"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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

</script>


</body>

</html>
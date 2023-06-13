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
<link rel="stylesheet" media="screen" href="${base}/css/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class="container" style="margin-bottom: 50px">
			<h1>Login</h1>
			<form method="post" action="${base}/login_processing_url">
				<div class="content">
					<c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">Tên đăng nhập
							hoặc mật khẩu không đúng vui lòng thử lại!</div>
					</c:if>
					<div class="form">
						<input type="text" class="form-control" name="username"
							placeholder="*User Name">
						<p id="required"></p>
					</div>
					<div class="form">
						<input type="password" class="form-control" name="password"
							placeholder="*Password">
						<p id="required"></p>
					</div>
					<div class="form" style="margin-top: 30px;">
						<input type="checkbox" class="form-control-checkbox"
							 name="remember-me" style="ma">Rememmber me
						<p id="required"></p>
					</div>
					<div class="form">
						<button type="submit" class="btn-create">Sign In</button>
					</div>
					<a href="${base}/register" style="margin-top: 10px; display: block;">Bạn chưa có tài khoản</a>
				</div>
			</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	
</head>
<body>
<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">메인화면</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<input type="button" value="상품목록">
				<form action = "user/login.jsp" method="get">
				<input type="submit" value="로그인">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
</body>
</html>
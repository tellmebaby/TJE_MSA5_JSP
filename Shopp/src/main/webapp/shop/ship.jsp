<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.Ship"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop🛒 - ALOHA CLASS🌴</title>
<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<%
		String loginId = (String) session.getAttribute("loginId");
		User user = new User();
		if(loginId != null && !loginId.isEmpty()){
			UserRepository userDAO = new UserRepository();
			user = userDAO.getUserById(loginId);	
		}
		String root = request.getContextPath();
	 	String productId = request.getParameter("id");
	 	String cartId = request.getParameter("cartId");
	 	List<Ship> cart = (List<Ship>) session.getAttribute("cart");
 	
	%>
	<jsp:include page="/layout/header.jsp" />
	

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">배송 정보</h1>
	</div>
	
	<!-- 배송 정보 입력 -->
	<div class="container shop mb-5 p-4">
		<form action="ship_pro.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId" value="<%=cartId%>">
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">성명</label>
				<%
				if (loginId != null && !loginId.isEmpty()){
				%>
				<input type="text" class="form-control col-md-10" name="name" value="<%=user.getName()%>">
				<%
				}else{
				%>
				<input type="text" class="form-control col-md-10" name="name" value="">
			<% } %>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">배송일</label>
				<input type="text" class="form-control col-md-10" name="shippingDate" value="">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">국가명</label>
				<input type="text" class="form-control col-md-10" name="country" value="">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">우편번호</label>
				<input type="text" class="form-control col-md-10" name="zipCode" value="">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label>
				<%
				if (loginId != null && !loginId.isEmpty()){
				%>
				<input type="text" class="form-control col-md-10" name="addressName" value="<%=user.getAddress()%>">
				<%
				}else{
				%>
				<input type="text" class="form-control col-md-10" name="addressName" value="">
				<% } %>
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label>
				<%
				if (loginId != null && !loginId.isEmpty()){
				%>
				<input type="text" class="form-control col-md-10" name="phone" value="<%=user.getPhone()%>">
				<%
				}else{
				%>
				<input type="text" class="form-control col-md-10" name="phone" value="">
				<% } %>
			</div>
			
			<!-- 버튼 영역 -->
			<div class="d-flex justify-content-between mt-5 mb-5">
				<div class="item">
					<a href="cart.jsp" class="btn btn-lg btn-success">이전</a>
					<!-- 취소 프로세스는 이어서... -->				
					<a href="/" class="btn btn-lg btn-danger">취소</a>				
				</div>
				<div class="item">
					<input type="submit" class="btn btn-lg btn-primary" value="등록">
				</div>
			</div>
			
		</form>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />

</body>
</html>
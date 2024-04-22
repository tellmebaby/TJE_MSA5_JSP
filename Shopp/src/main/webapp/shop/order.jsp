<%@page import="shop.dto.Order"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="shop.dto.Ship"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop🛒 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<%
		String root = request.getContextPath();
		String cartId="";
		Order order = (Order) session.getAttribute("userInfo");
		String loginId = (String) session.getAttribute("loginId");
	%>
	<jsp:include page="/layout/header.jsp" />
	

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 주문 확인 영역 -->
	<div class="container order mb-5">
		<form action="complete.jsp" method="post">
		<!-- 배송정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문 형태 :</td>
					<%
					if(loginId!=null&&!loginId.isEmpty()){
					%>
					<td>회원 주문</td>
					<% } else { %>
					<td>비회원 주문</td>
					<% } %>
				</tr>
				<tr>
					<td>성 명 :</td>
					<td><%=order.getShipName() %></td>
				</tr>
				<tr>
					<td>우편번호 :</td>
					<td><%=order.getZipCode()%></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><%=order.getAddress() %></td>
				</tr>
				<tr>
					<td>배송일 :</td>
					<td><%=order.getDate() %></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><%=order.getPhone() %></td>
				</tr>
				<%
				if ( loginId == null) {
				%>	
				<tr>
					<td>주문 비밀번호 :</td>
					<td>
						<input type="password" class="form-control" name="orderPw">
					</td>
				</tr>
				<% 
				}
				%>				
				</tbody>
			</table>
		</div>
		
		<!-- 주문목록 -->
		<div class="cart-box">
			<table class="table table-striped table-hover table-bordered text-center align-middle">
				<thead>
					<tr class="table-primary">
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				<%
			 List<Ship> cart = (List<Ship>) session.getAttribute("cart");
			  ProductRepository productDAO = new ProductRepository();
			int totalQuantity = 0;
			int totalPrice = 0;
			if (cart == null || cart.isEmpty()) { %>
				<tr>
					<td colspan="5">추가된 상품이 없습니다.</td>
				</tr>
			<% } else {
				
				Map<String, Integer> productCountMap = new HashMap<>();
				
				for (Ship ship : cart) { 
					String productId = ship.getShipName();
					int count = productCountMap.getOrDefault(productId, 0);
					productCountMap.put(productId, count + ship.getQuantity());
					cartId = ship.getCartId();
				}
				
				int cartSum = 0;
				for (String productId : productCountMap.keySet()) {
					
					Product product = productDAO.getProductById(productId);
					int unitPrice = product.getUnitPrice() != null ? product.getUnitPrice().intValue() : 0;
					int quantity  = productCountMap.get(productId);
					int subtotal = unitPrice * quantity;
					totalQuantity += quantity;
					totalPrice += subtotal;
					cartSum += subtotal;
				%>
					<tr>
						<td><%= product.getName() %></td>			
						<td><%= unitPrice %></td>			
						<td><%= quantity %></td>			
						<td><%= subtotal %></td>			
						<td></td>			
					</tr>
				<% } %>
				</tbody>
				<tfoot>
					
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><%=totalPrice%></td>
						<td></td>
					</tr>
					
				</tfoot>
			</table>
			<% } %>	
		</div>
		
		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<div class="item">
				<a href="ship.jsp" class="btn btn-lg btn-success">이전</a>
				<!-- 취소 프로세스는 이어서... -->				
				<a href="" class="btn btn-lg btn-danger">취소</a>				
			</div>
			<div class="item">
				<%
				if ( loginId != null) {
				%>	
						<input type="hidden" name="loginId" value="<%=loginId%>">
				<% 
				}
				%>
				<input type="hidden" name="login" value="false">
				<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
				<input type="submit" class="btn btn-lg btn-primary" value="주문완료">	
			</div>
		</div>
		</form>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />

</body>
</html>
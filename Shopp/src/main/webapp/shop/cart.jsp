<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
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
		String root = request.getContextPath();
		ProductRepository productDAO = new ProductRepository();
		String cartId = "";
		int totalQuantity = 0;
	%>
	<jsp:include page="/layout/header.jsp" />
	
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">장바구니</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">장바구니 목록 입니다.</p>
		</div>
	</div>
	
	<!-- 장바구니 영역 -->
	<div class="container order">
		<!-- 장바구니 목록 -->
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
			  
			
			int cartSum = 0;
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
				
				for (String productId : productCountMap.keySet()) {
					
					Product product = productDAO.getProductById(productId);
					int unitPrice = product.getUnitPrice() != null ? product.getUnitPrice().intValue() : 0;
					int quantity  = productCountMap.get(productId);
					int subtotal = unitPrice * quantity;
					totalQuantity += quantity;
					cartSum += subtotal;
				%>
				<tr>
					<td><%= product.getName() %></td>			
					<td><%= unitPrice %></td>			
					<td><%= quantity %></td>			
					<td><%= subtotal %></td>			
					<td><a href="deleteCart.jsp?id=<%= productId %>" class="btn btn-danger">삭제</a></td>			
				</tr>
			
				<% } %>
			
			<% } %>	
				</tbody>
				<tfoot>
					
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td id="cart-sum"><%= cartSum %></td>
						<td></td>
					</tr>
					
				</tfoot>
			</table>
			
				<!-- 버튼 영역 -->
				<div class="d-flex justify-content-between align-items-center p-3">
					<a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-lg btn-danger ">전체삭제</a>
		
					<a href="javascript:;" class="btn btn-lg btn-primary" onclick="order()">주문하기</a>
				</div>
			
			
				
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />

	<script>
		let cartId = '<%=cartId%>'
		let cartCount = '<%=totalQuantity%>'
		let cartSum = document.getElementById('cart-sum')
		
		function order() {
			if( cartCount == 0 ) {
				alert('장바구니에 담긴 상품이 없습니다.')
				return
			}
			let msg = '총 ' + cartCount + '개의 상품을 주문합니다. \n총 주문금액 : ' + cartSum.textContent
			let check = confirm(msg)
			if( check ) {
				location.href = 'ship.jsp?cartId=' + cartId
			}
			
		}
	</script>
</body>
</html>
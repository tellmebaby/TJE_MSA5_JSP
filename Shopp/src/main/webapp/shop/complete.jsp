
<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Ship"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Order"%>
<%@page import="shop.dao.ProductRepository"%>
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
		String loginId = (String) session.getAttribute("loginId");
		OrderRepository orderDAO = new OrderRepository();
		String orderPw = request.getParameter("orderPw");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		Order getOrder = (Order) session.getAttribute("userInfo");
		getOrder.setTotalPrice(totalPrice);
		if(orderPw != null ) {
			getOrder.setOrderPw(orderPw);
		}else{
			if(loginId != null && !loginId.isEmpty()){
			 getOrder.setUserId(loginId);
			}
		}
				
		int result = orderDAO.insert(getOrder);
		//방금전 주문번호 꺼내오기
		Order order = orderDAO.lastOrderNo(); 
				
		if(result == 1){
			//주문 목록 등록
			List<Ship> cartList = (List<Ship>) session.getAttribute("cart"); 	// 세션에 등록한 주문세부내역꺼낸다
			Product productIo = new Product();
			ProductIORepository productIoDAO = new ProductIORepository();
			if( cartList != null && !cartList.isEmpty()){ // 유효한지 
				// productIo에 입력하기
				for (int i = 0 ; i < cartList.size() ; i ++ ){
					productIo.setProductId(cartList.get(i).getShipName()); // pruductId
					productIo.setOrderNo(order.getOrderNo());
					productIo.setAmount(cartList.get(i).getQuantity());
					productIo.setType("out");
					if(getOrder.getUserId() != null && !getOrder.getUserId().isEmpty()){
						productIo.setUserId(getOrder.getUserId());
					}
					int ioResult = productIoDAO.insert(productIo);
				}
			}
			// 주문이 성공하면 세션에서 다 지워준다
			session.removeAttribute("cart");
			session.removeAttribute("orderList");
		}
		//직전 주분내용 꺼내온다
		
		%>

<jsp:include page="/layout/header.jsp" />



	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	
	<!-- 주문 완료 확인 -->
	
	<div class="container order mb-5 p-5">
		
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<!-- 주문정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문번호 :</td>
					<td><%=order.getOrderNo() %></td>
				</tr>
				<tr>
					<td>배송지 :</td>
					<td><%=order.getAddress() %></td>
				</tr>
			</tbody></table>
			
			<div class="btn-box d-flex justify-content-center">
				<a href="<%=root%>/user/order.jsp" class="btn btn-primary btn-lg px-4 gap-3">주문내역</a>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />

</body>
</html>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Ship"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();

	String cartId = request.getParameter("cartId");
	String shipName = request.getParameter("name");
	String date = request.getParameter("shippingDate");
	String country = request.getParameter("country");
	int zipCode = Integer.parseInt(request.getParameter("zipCode"));
	String address = request.getParameter("addressName");
	String phone = request.getParameter("phone");
	String orderPw = request.getParameter("orderPw");
	String userId = request.getParameter("userId");
	
	// 받아온 정보 세팅
	Order order = new Order();
	
	order.setShipName(shipName);
	order.setZipCode(shipName);
	order.setCountry(country);
	order.setAddress(address);
	order.setDate(date);
	order.setPhone(phone);
	if ( !orderPw.isEmpty()){
		order.setOrderPw(orderPw);
	}else{
		order.setUserId(userId);
	}
	// 주문 인서트 준비
	OrderRepository orderDAO = new OrderRepository();
	ProductRepository productDAO = new ProductRepository();
	List<Order> orderList = new ArrayList<Order>();
	
	// 장바구니 전체 불러오기
	List<Ship> cart = (List<Ship>) session.getAttribute("cart");
	// 장바구니 주문 목록 별 가격 인서트하기 넣어줘야할 정보 (가격)
	int totalPrice = 0;
	if (cart != null && !cart.isEmpty()) {
		for (Ship ship : cart) {
			int unitPrice = productDAO.getProductById(ship.getShipName()).getUnitPrice();
			totalPrice += unitPrice;
		}
		order.setTotalPrice(totalPrice);
	}
	
	int result = orderDAO.insert(order);
	if (result != 0){
		cart.clear();
		response.sendRedirect(root + "/shop/products.jsp");
	}else{
	response.sendRedirect(root + "/shop/cart.jsp?id=0");
	}
%>








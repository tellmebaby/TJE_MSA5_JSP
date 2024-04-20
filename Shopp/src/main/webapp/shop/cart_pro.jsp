<%@page import="shop.dto.Ship"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	List<Ship> cart = (List<Ship>) session.getAttribute("cart");

	if (cart == null) {
	    cart = new ArrayList<>();
	    session.setAttribute("cart", cart);	   	
	    session.setAttribute("cartId", UUID.randomUUID().toString());
	}

	String cartId = (String) session.getAttribute("cartId");
	
	String productId = request.getParameter("id");
	ProductRepository productDAO = new ProductRepository();
	Product product = productDAO.getProductById(productId);
	
	Ship ship = new Ship();
	ship.setCartId(cartId); // 상품 ID를 장바구니 ID로 사용하고 있음
	ship.setShipName(product.getProductId()); // 상품명을 받는 사람 이름으로 설정 (예시)
	ship.setQuantity(1);
	
	cart.add(ship);
	
	session.setAttribute("cart",cart);
	
	String root = request.getContextPath();
	response.sendRedirect(root + "/shop/products.jsp");
%>

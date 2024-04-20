<%@page import="shop.dto.Ship"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String root = request.getContextPath();
 	String productId = request.getParameter("id");
 	String cartId = request.getParameter("cartId");
 	
 	List<Ship> cart = (List<Ship>) session.getAttribute("cart");
 	
 	if (cart != null && !cart.isEmpty()) {
 		
 		for (int i = 0; i < cart.size(); i++) {
			Ship ship = cart.get(i);
			if (ship.getShipName().equals(productId)) {
				cart.remove(i);
				break;
			}else if (cartId != null && !cartId.isEmpty()){
		 		cart.clear();
			}
 		
	 	}
 		
 		session.setAttribute("cart", cart);
 	}
 	
 	response.sendRedirect(root + "/shop/cart.jsp");
 %>   
    
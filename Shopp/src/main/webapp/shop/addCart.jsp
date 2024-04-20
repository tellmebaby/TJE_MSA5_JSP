<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String productId = request.getParameter("id");
	
	// 세션에 저장된 장바구니를 가져옴
	HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
	if (cart == null) {
		// 세션에 장바구니가 없는 경우, 새로운 장바구니를 생성
		cart = new HashMap<>();
		session.setAttribute("cart", cart);
	}
	
	// 장바구니에 상품을 추가
	if (productId != null) {
		if (cart.containsKey(productId)) {
			// 이미 장바구니에 있는 상품인 경우, 수량을 1 증가시킴
			int quantity = cart.get(productId);
			cart.put(productId, quantity + 1);
		} else {
			// 장바구니에 없는 상품인 경우, 수량을 1로 설정
			cart.put(productId, 1);
		}
	}
	
	// 장바구니 페이지로 리다이렉션
	
	response.sendRedirect(request.getContextPath() + "/cart.jsp");
%>

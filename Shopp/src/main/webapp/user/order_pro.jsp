<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String root = request.getContextPath();
	String phone = request.getParameter("phone");
	String orderPw = request.getParameter("orderPw");

	// 비회원 주문 내역 세션에 등록 처리
		
	response.sendRedirect(root + "/user/order.jsp");

%>
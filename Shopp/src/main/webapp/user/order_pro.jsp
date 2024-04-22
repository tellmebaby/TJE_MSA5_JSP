<%@page import="shop.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String root = request.getContextPath();
	String phone = request.getParameter("phone");
	String orderPw = request.getParameter("orderPw");
	
	
	// 비회원 주문 내역 세션에 등록 처리

	OrderRepository orderDAO = new OrderRepository();
	
	List<Order> orderList = orderDAO.orderSelectNm(phone, orderPw);
	int listCount = (orderList.size());
	session.setAttribute("orderList", orderList);
	response.sendRedirect(root + "/user/order.jsp");

%>
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
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("addressName");
	String phone = request.getParameter("phone");

	// 받아온 정보 세팅
	Order order = new Order();
	
	order.setShipName(shipName);
	order.setZipCode(zipCode);
	order.setCountry(country);
	order.setAddress(address);
	order.setDate(date);
	order.setPhone(phone);
	
	// 세션에 주문자 정보 세팅
	
	session.setAttribute("nonUserInfo", order);
	

	
	response.sendRedirect(root + "/shop/order.jsp");
	
%>








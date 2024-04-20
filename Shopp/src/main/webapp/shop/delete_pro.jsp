<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//필요한 정보 : no
	String reqNo = request.getParameter("id");
	
	ProductRepository productDAO = new ProductRepository();
	int result = productDAO.delete(reqNo);
	
	String root = request.getContextPath();
	if( result > 0 ) {
		//삭제 성공
		response.sendRedirect(root + "/shop/editProducts.jsp");
	} else {
		//삭제 실패
		response.sendRedirect(root + "/shop/editProducts.jsp");
	}

%>
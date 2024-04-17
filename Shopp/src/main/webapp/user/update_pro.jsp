<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />
<%
	User user = new User();
	user.setPassword(request.getParameter("password"))	;
	user.setName(request.getParameter("name"))	;
	user.setGender(request.getParameter("gender"))	;
	user.setBirth(request.getParameter("birth"))	;
	user.setMail(request.getParameter("mail"))	;
	user.setPhone(request.getParameter("phone"))	;
	user.setAddress(request.getParameter("address"))	;
	user.setId(request.getParameter("id"))	;

	// 회원 정보 수정 처리
	
    int result = userDAO.update(user);
    if (result >0 ){
        response.sendRedirect("complete.jsp?msg=2");
    } else {
        response.sendRedirect("update.jsp");
    }

%>
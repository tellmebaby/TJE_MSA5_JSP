<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	// 회원가입정보 받아오기
	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");	
	String name = request.getParameter("name");	
	String gender = request.getParameter("gender");	
		String year = request.getParameter("year");	
		String month = request.getParameter("month");	
		String day = request.getParameter("day");	
	String birth = year +"/"+ month +"/"+ day;	
		String email1 = request.getParameter("email1");	
		String email2 = request.getParameter("email2");	
	String email = email1 +"@"+ email2;	
	String phone = request.getParameter("phone");	
	String address = request.getParameter("address");	

	// 회원가입정보 세팅
	User user = new User();
	user.setId(id);
	user.setPassword(pw);
	user.setName(name);
	user.setGender(gender);
	user.setBirth(birth);
	user.setMail(email);
	user.setPhone(phone);
	user.setAddress(address);
	
	UserRepository userDAO = new UserRepository();
	// 회원가입
	int result = userDAO.insert(user);
	if ( result == 1){
		// 성공시 로그인 후 상품목록
		session.setAttribute("loginId", id );		
		response.sendRedirect("complete.jsp?msg=2");
	}else{
		// 실패시 다시
		response.sendRedirect(root + "/user/join.jsp?id=0");
	}
	
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 자동 로그인, 토큰 쿠키 삭제
	Cookie cookieRememberMe = new Cookie("rememberId", "");
	Cookie cookieToken = new Cookie("token", "");
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	cookieRememberMe.setMaxAge(0);
	cookieToken.setMaxAge(0);
	
	// 세션 무효화
	session.invalidate();
	
	// 쿠키 전달
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	
	// 메인 페이지로 이동
	// i) jsp 를 지정하여 이동
	// response.sendRedirect("index.jsp");
	// ii) url 경로를 지정하여 이동
	response.sendRedirect(request.getContextPath() + "/");
	
%>
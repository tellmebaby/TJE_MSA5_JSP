<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>
	<h1>로그인 결과</h1>
	<h1>관리자님 환영합니다.</h1>
	<%
		String user_id = request.getParameter("id");
    	String user_pw = request.getParameter("passwd");
    	
    	
		String root = request.getContextPath();
		
		
		user_id = (String) session.getAttribute("userID");
		user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션 속성 값 [1] - user_id : " + user_id + "<br>");
		out.println("설정된 세션 속성 값 [2] - user_pw : " + user_pw + "<br>");
	%>
	<a href="<%= root %>/board/boardlist.jsp">공지사항</a>
	<a href="<%= root %>/board/studentlist.jsp">학생정보</a>
</body>
</html>
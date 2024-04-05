<%@page import="admin.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="admin.Service.BoardServiceImpl"%>
<%@page import="admin.Service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드</title>
</head>
<body>
	<h1>관리자님 환영합니다.</h1>
	<%
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션 속성 값 [1] - user_id : " + user_id + "<br>");
		out.println("설정된 세션 속성 값 [2] - user_pw : " + user_pw + "<br>");
	%>
	<a href="<%= request.getContextPath() %>/board/boardlist.jsp">공지사항</a>
	<a href="<%= request.getContextPath() %>/users/userslist.jsp">학생정보</a>
	<a href="<%= request.getContextPath() %>/calendar/calendarlist.jsp">학사일정</a>
</body>
</html>

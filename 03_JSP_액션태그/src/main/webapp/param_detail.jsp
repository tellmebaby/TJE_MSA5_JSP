<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 param</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	<h3>이름 : <%= name %></h3>
	<h3>나이 : <%= age %></h3>

</body>
</html>
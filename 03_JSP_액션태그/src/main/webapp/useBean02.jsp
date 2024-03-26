<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="cal" class="beans.Calculator"/>
<!-- cal 이라는 이름의 calculator 객체 생성 -->
<%
	int a = 10 , b = 20;
	int sum = cal.sum(a,b);
%>

<h1> sum = <%= sum %></h1>

</body>
</html>
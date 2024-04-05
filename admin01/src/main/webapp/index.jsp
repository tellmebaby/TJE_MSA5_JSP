<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login</title>
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="menu.jsp">
		<p >아이디 : <input type="text" name="id">
		<p> 비밀번호 : <input type="text" name="passwd">	
		<p>	<input type="submit" value="전송">
	</form>
</body>
</html>
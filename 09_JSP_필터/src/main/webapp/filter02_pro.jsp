<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기 파라미터 필터</title>
</head>
<body>
	<%
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
    %>
    <p> 입력된 id 값 : <%=id%>
    <p> 입력된 pw 값 : <%=passwd%>
    <p> 관리자 메뉴입니다
    <p> 학생정보입력
    <p> 공지사항 입력
</body>
</html>
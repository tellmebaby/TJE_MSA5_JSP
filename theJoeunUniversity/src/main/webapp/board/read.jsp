<%@page import="admin.DTO.Board"%>
<%@page import="admin.Service.BoardService"%>
<%@page import="admin.Service.BoardServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link rel="stylesheet" href="../static/css/adminLogin.css">
</head>
<body>
	<%
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");
	BoardService boardService = new BoardServiceImpl();
	int no = Integer.parseInt(request.getParameter("no"));
	Board board = boardService.select(no);
	%>

	<div class="container">
		<div class="container-head">
			<div class="item">
				<img src="../static/img/adminLogo.png" alt="로고">
			</div>
			<div class="item">
				<p>
					THEJOEUN University Kiosk <br> Management System
				</p>
			</div>
		</div>
		<div class="container-readForm">
			<%
			if (board != null) {
			%>
			<div class="item-boardReadt">
				<span><%=board.getTitle()%></span>
				<span><%=board.getWriter()%></span>
			</div>
			<div class="item-boardReadb">
				<span><%=board.getContent()%></span>
			</div>
			<%
			} else {
			%>
			<h3>조회된 게시글이 없습니다.</h3>
			<%
			}
			%>
		</div>
	</div>


	<!-- 기존 -->
	<div>
		<a href="<%=request.getContextPath()%>/board/boardlist.jsp"> 닫기 </a> <a
			href="<%=request.getContextPath()%>/board/update.jsp?no=<%=board.getNo()%>">
			수정 </a>
		<form action="<%=request.getContextPath()%>/board/delete_pro.jsp"
			method="post">
			<input type="hidden" name="no" value="<%=board.getNo()%>" /> <input
				type="submit" value="삭제" />
		</form>

	</div>
</body>
</html>
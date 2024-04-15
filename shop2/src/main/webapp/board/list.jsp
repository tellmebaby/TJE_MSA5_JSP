<%@page import="shop.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="shop.Service.BoardServiceImpl"%>
<%@page import="shop.Service.BoardService"%>
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
<title>게시글 목록</title>
<jsp:include page="/layout/link.jsp"/>
</head>
<body>
	
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp"/>

	<%
		BoardService boardService = new BoardServiceImpl();
		List<Board> boardList = boardService.list();
		
	%>
	
	<!-- 컨텐츠 -->
	
	<div class="container">
	<h1>게시글 목록</h1>
	
	<a href="<%= request.getContextPath() %>/board/insert.jsp">글쓰기</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일자</th>
			<th>수정일자</th>
		</tr>
		<% if( boardList == null || boardList.size() == 0 ) { %>
		<tr>
			<td colspan="5">조회된 게시글이 없습니다.</td>
		</tr>
		<% } else {
			for(Board board : boardList) {
		%>
				<tr>
					<td><%= board.getNo() %></td>
					<td>
						<a href="<%= request.getContextPath() %>/board/read.jsp?no=<%= board.getNo() %>">
						<%= board.getTitle() %>
						</a>
					</td>
					<td><%= board.getUserId() %></td>
					<td><%= board.getRegDate() %></td>
					<td><%= board.getUpdDate() %></td>
				</tr>
		<% 		}
			}
		%>
	</table>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>













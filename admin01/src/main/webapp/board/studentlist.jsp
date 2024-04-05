<%@page import="admin.DTO.Board"%>
<%@page import="admin.Service.BoardServiceImpl"%>
<%@page import="admin.Service.BoardService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 관리자모드</title>
</head>
<body>
	<h1>학생정보</h1>
	<%
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션 속성 값 [1] - user_id : " + user_id + "<br>");
		out.println("설정된 세션 속성 값 [2] - user_pw : " + user_pw + "<br>");
		
		BoardService boardService = new BoardServiceImpl();
		List<Board> boardList = boardService.list();
		if(user_id != null){
		%>
			
	
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
			
			
		<%
		}else{
			boardList = boardService.list();
			out.println("잘못된 접근입니다.?");
		}
	
	%>
	
	
</body>
</html>

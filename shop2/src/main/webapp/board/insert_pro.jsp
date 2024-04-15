<%@page import="shop.Service.BoardServiceImpl"%>
<%@page import="shop.Service.BoardService"%>
<%@page import="shop.DTO.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//필요한 정보 : 제목, 작성자, 내용
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	String content = request.getParameter("content");
	
	Board board = new Board( title, userId, content );
	
	BoardService boardService = new BoardServiceImpl();
	int result = boardService.insert(board);
	
	String root = request.getContextPath();
	if( result > 0 ) {
		//수정성공
		response.sendRedirect(root + "/board/list.jsp");
	} else {
		//수정실패
		response.sendRedirect(root + "/board/insert.jsp?msg=0");
	}

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<header>
	<nav>
		<ul>
			<li><a href="<%= root %>/">Home</a></li>
			<li><a href="<%= root %>/board/list.jsp">Board</a></li>
			<li><a href="<%= root %>/gallery/list.jsp">Gallery</a></li>
			<li><a href="<%= root %>/about.jsp">About</a></li>
		</ul>
	</nav>
</header>
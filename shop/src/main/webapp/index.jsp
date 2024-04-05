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
<title>메인 페이지</title>
	<jsp:include page="/layout/link.jsp"/>
</head>
<body>
	
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp"/>
	
	<!-- 컨텐츠 -->
	
	<div class="container">
		<h1>shop</h1>
		<h3>메인 화면</h3>
	
		<!-- 로그인 시 -->	
		<c:if test="${ sessionScope.loginId != null }">
			<h5>${ sessionScope.loginId } 님 환영합니다.</h5>
			<a href="logout.jsp">로그아웃</a>
			<ul>
				<li><a href="<%= request.getContextPath()%>/board/list.jsp">게시판</a></li>
			</ul>
		</c:if>
		
		<!-- 비로그인 시 -->
		<c:if test="${ sessionScope.loginId == null }">
			<a href="join.jsp">회원가입</a>
			<a href="login.jsp">로그인</a>
		</c:if>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp" />
	
	
	<!-- 스크립트 -->
	<jsp:include page="/layout/script.jsp"/>
	
</body>
</html>









<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();

	Date date = new Date();
	int year = date.getYear() + 1900;
	int month = date.getMonth() + 1;
	
	String url = root + "/schedule/schedule_user.jsp?year=" + year + "&month=" + month;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더조은대학교</title>

<!-- css -->
<jsp:include page="/layout/link.jsp" />
<jsp:include page="/layout/mainLink.jsp" />
<link rel="icon" href="<%=root%>/static/img/icon.png">
</head>
<body>
	<header>
		<!-- 헤더 -->
		<jsp:include page="/layout/header.jsp" />
	</header>
	<!-- 컨텐츠 -->
	<div class="container txt-center">
		<div class="con1 flex j-space-around">
			<figure class="figure2">
				<a href="<%=root%>/Euna/Info.jsp">
					<button class="btn">
						<i id="fa1" class="fa fa-search" aria-hidden="true"> </i>
					</button>
				</a>
				<figcaption>학교 소개</figcaption>
			</figure>
			<figure class="figure2">
				<a href="<%=root%>/information/login.jsp">
					<button class="btn">
						<i id="fa2" class="fa fa-id-card-o" aria-hidden="true"> </i>
					</button>
				</a>
				<figcaption>학생 정보</figcaption>
			</figure>
		</div>
		<div class="con2 flex j-space-around">
			<figure class="figure3">
				<a href="<%=root%>/board/list.jsp">
					<button class="btn">
						<i id="fa3" class="fa fa-bullhorn" aria-hidden="true"> </i>
					</button>
				</a>
				<figcaption>공지 사항</figcaption>
			</figure>
			<figure class="figure4">
				<a href="<%= url %>">
					<button class="btn">
						<i id="fa4" class="fa fa-calendar" aria-hidden="true"> </i>
					</button>
				</a>
				<figcaption>학사 일정</figcaption>
			</figure>
		</div>
	</div>

	<footer>
		<!-- 푸터 -->
		<jsp:include page="/layout/footer.jsp" />
	</footer>
	
	
</body>
</html>
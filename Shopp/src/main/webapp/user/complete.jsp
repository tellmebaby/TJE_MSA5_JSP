<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" /> <jsp:include page="/layout/link.jsp" />
</head>
<body>   


	<% 
	String loginId = (String) session.getAttribute("loginId");
	int msg = Integer.parseInt(request.getParameter("msg"));
	String root = request.getContextPath();
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
		
	</div>
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
	<%
	switch ( msg ) {
	case 0: 
		%> <h1 class="text-center"><%=loginId%>님 환영합니다.</h1> <%
		break;
	case 1:	
		%> <h1 class="text-center">회원 가입이 완료되었습니다.</h1> <%
		break;
	case 2:	
		%> <h1 class="text-center">회원 정보가 수정되었습니다.</h1> <%
		break;
	case 3:	
		%> <h1 class="text-center">회원 정보가 삭제되었습니다.</h1>

		<%
		// 자동 로그인, 토큰 쿠키 삭제
		Cookie cookieRememberMe = new Cookie("rememberId", "");
		Cookie cookieToken = new Cookie("token", "");
		cookieRememberMe.setPath("/");
		cookieToken.setPath("/");
		cookieRememberMe.setMaxAge(0);
		cookieToken.setMaxAge(0);
		
		// 세션 무효화
		session.invalidate();
		
		
		// 쿠키 전달
		response.addCookie(cookieRememberMe);
		response.addCookie(cookieToken);
		%>
		
	<% } %>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%=root %>" class="btn btn-lg btn-primary">메인 화면</a>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
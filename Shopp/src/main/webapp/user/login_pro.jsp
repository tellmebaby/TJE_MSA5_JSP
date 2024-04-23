<!-- 로그인 처리 -->

<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String rememberId = request.getParameter("rememberId");

UserRepository userDAO = new UserRepository();
User loginUser = userDAO.login(id, pw);

if (loginUser == null) {
	// 로그인 실패
	response.sendRedirect("login.jsp?msg=0");
} else {
	// 로그인 성공
	session.setAttribute("loginId", loginUser.getId());
// 	Cookie cokie_test = new Cookie("test", id ); 페이지 가 여기서 옮겨가면서 생성이 취소되는듯 유지하는거 알아보자
	response.sendRedirect("complete.jsp?msg=0");
}

// - 세션에 아이디 등록

// 아이디 저장
// checkbox 체크시, 기본값 on 이 넘어온다

	if ( rememberId != null && !rememberId.isEmpty() ) {
		out.println("rememberId : " + rememberId);
		// ✅ 아이디 저장 체크 시, 쿠키 생성
		if (rememberId.equals("on")) {
			// 아이디 저장 체크됨
			Cookie cookie_id = new Cookie("id", id);
			Cookie cookie_rememberId = new Cookie("rememberId", rememberId);
			response.addCookie(cookie_id);
			response.addCookie(cookie_rememberId);
			out.println("아이디를 쿠키에 저장했습니다.<br>");
		}
	} else {
		// 🟩 저장 미체크 시, 쿠키 삭제
		Cookie cookie_id = new Cookie("id", id);
		Cookie cookie_rememberId = new Cookie("rememberId", "off"); // 기본값으로 off 설정
		cookie_id.setMaxAge(0);
		cookie_rememberId.setMaxAge(0);
		response.addCookie(cookie_id);
		response.addCookie(cookie_rememberId);
		out.println("아이디를 쿠키에서 해제했습니다.");
	}

if (id != null && pw != null) {
	out.println(id + "님 환영합니다.");
} else {
	out.println("로그인에 실패했습니다.");
}

// 자동 로그인
String rememberMe = request.getParameter("rememberMe");
Cookie cookieRememberMe = new Cookie("rememberMe", "");
Cookie cookieToken = new Cookie("token", "");
// 자동 로그인 체크 여부, 토큰 쿠키에 대한 경로 설정
cookieRememberMe.setPath("/");
cookieToken.setPath("/");
// 쿠키 유효기간 설정 - 초단위 --> 7일
cookieRememberMe.setMaxAge(7 * 60 * 60 * 24);
cookieToken.setMaxAge(7 * 60 * 60 * 24);
// 체크 여부에 따라 쿠키 생성 또는 삭제
if (rememberMe != null && rememberMe.equals("on")) {
	// 자동 로그인 체크 
	// - 토큰 발행
	String tokenValue = userDAO.refreshToken(id);
	// - 쿠키 생성
	cookieRememberMe.setValue(URLEncoder.encode(rememberMe, "UTF-8"));
	cookieToken.setValue(URLEncoder.encode(tokenValue, "UTF-8"));
} else {
	// 자동 로그인 미체크
	// 쿠키 삭제
	cookieRememberMe.setMaxAge(0);
	cookieToken.setMaxAge(0);
}

// 쿠키 전달
// 응답에 쿠키 등록
response.addCookie(cookieRememberMe);
response.addCookie(cookieToken);
// 자동 로그인 (끝)
%>





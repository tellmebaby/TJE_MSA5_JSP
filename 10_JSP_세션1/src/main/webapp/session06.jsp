<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 유효 여부 확인 및 무효화</title>
</head>
<body>
	<p><h4>---- 세션 무효화 전 ----</h4></p>
    <% 
        String user_id = (String) session.getAttribute("userID");
        String user_pw = (String) session.getAttribute("userPW");
        out.println("설정된 세션 속성 userID : " + user_id + "<br>");
        out.println("설정된 세션 속성 userPW : " + user_pw + "<br>");
		
        // isRequestedSessionIdValid()
        // : 해당 요청이 속한 session 이 유효한지 여부를 반환하는 메소드
        if(request.isRequestedSessionIdValid()) {
        	out.print("세션 유효");
        } else {
        	out.print("세션 안유효");
        }
	
        session.invalidate();
    %>
    <p><h4>---- 세션을 삭제한 후 ----</h4></p>
    <% 
	    if(request.isRequestedSessionIdValid()) {
	    	out.print("세션 유효");
	    } else {
	    	out.print("세션 안유효");
	    }
    %>
</body>
</html>
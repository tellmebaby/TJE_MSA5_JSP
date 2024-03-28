<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
	<h3>유효성 검사</h3>
	<!-- 
		onsubmit="return 여부"
		- 여부 : true 이면, submit(요청전송)
				false 이면, submit 안 함
	 -->
	 
	<form name="joinForm" onsubmit="return CheckJoin()" action="validation02_pro.jsp" method="post">
		<p>아이디 : <input type="text" name="id" maxlength="20" /></p>
		<p>비밀번호 : <input type="password" name="pwa" /></p>
		<p>이름 : <input type="text" name="name"/></p>
		<p>나이 : <input type="text" name="age" onkeyup="checkNumber()"/></p>
		<p><input type="submit" value="로그인"></p>
	</form>
	
	<script>
	
		// 회원가입 유효성 검사
		function CheckJoin() {
// 			alert("로그인 요청")
			let form = document.joinForm // name이 joinForm 인 폼 요소를 가져옴
			
			let id = form.id.value
			let pw = form.pwa.value
			
// 			alert(id)
// 			alert(pw)
			
			// 1. 아이디는 필수값, 6~20자 이내
			if( id == "" ) {
				alert('아이디를 입력해주세요')
				form.id.focus()			// id input 태그에 포커스
				return false
			}
			
			if( id.length < 6 ) {
				alert('아이디는 6자 이상으로 입력 가능합니다.')
				form.id.select()		// id 입력 값을 선택
				return false
			}
			
			
			// 2. 비밀번호는 필수값, 6자 이상
			// 비밀번호 입력여부 검증
			if( pw = "" ) {
				alert( '비밀번호를 입력해주세요')
				form.pwa.focus()			// id input 태그에 포커스
				return false 
			}
			// 비밀번호 글자 수 검증
			if( pw.length < 6 ) {
				alert('비번은 6자 이상으로 입력 가능합니다.')
				form.pwa.select()		// id 입력 값을 선택
				return false
			}
			
			
			
			
			
			// 3. 이름은 필수값, 첫글자는 숫자로 사용 불가
			let name = form.name.value
		
			if(name == "") {
			alert('이름을 입력해주세요')
			form.name.focus()
			return false                                        
			}
		
			// isNaN() : 숫자가 아니면 true
			if( !isNan( name.substr(0,1) ) ) {
			alert('이름은 숫자로 시작할 수 없습니다.')
			return false
			}
		
			// 나이 유효성 검사
			function checkNumber() {
			let form = document.joinForm
			
			console.log( event.keyCode )
			
				// 숫자가 아닌 경우
				if( !(event.keyCode >= 48 && event.keyCode <= 57 ) ){
				alert('숫자만 입력 가능합니다.')
				event.returnValue = false
				form.age.value = ''
				}
			
			}
			
		}
	
	</script>
	
</body>
</html>
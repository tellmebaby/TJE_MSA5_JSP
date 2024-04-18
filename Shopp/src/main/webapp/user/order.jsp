
<%@page import="shop.dto.Order"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop🛒 - ALOHA CLASS🌴</title>
<!-- 파비콘 -->
<link rel="icon" href="/static/img/logo.png" type="image/x-icon">
<!-- 썸네일 이미지 설정 -->
<meta property="og:image" content="https://i.imgur.com/yiTQ3EV.jpg">
<!-- 웹 페이지 설명 (선택 사항) -->
<meta property="og:description" content="ALOHA CLASS🌴 - 쇼핑몰 프로젝트">
<!-- 웹 페이지 URL -->
<meta property="og:url" content="">
<!-- 웹 페이지 제목 -->
<meta name="title" content="Shop🛒 - ALOHA CLASS🌴">
<meta property="og:title" content="Shop🛒 - ALOHA CLASS🌴">
<!-- 웹 페이지 타입 (웹사이트, 기사, 제품 등) -->
<meta property="og:type" content="website">
<!-- 검색어 -->
<meta name="keywords" content="쇼핑몰 프로젝트, 자바 웹개발, ALOHA CLASS, 알로하 클래스">
<meta name="robots" content="index, follow">
<!-- 사이트 맵 -->
<link rel="sitemap" href="/static/sitemap.xml">




	
    
<!-- bootstrap lib -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- Noto Sans font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&amp;display=swap">

<!-- material design icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link href="/static/css/style.css" rel="stylesheet">
</head>
<body>
<% 

		// ...
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String root = request.getContextPath();
	
		// 주문 내역 목록을 세션에서 가져오기
		OrderRepository orderDAO = new OrderRepository();
		List<Product> orderList = orderDAO.list(id);
		Order order = new Order();
		String orderPhone = order.getPhone();
		int orderCount = orderList.size();
		// 회원인 경우
		UserRepository userDAO = new  UserRepository();
		User loginUser = userDAO.login(id, pw);
	
	
	
	boolean login ;
	
	if(loginUser == null){
	// 로그인 실패
	login = false;
	out.print("로그인 실패했습니다.");
	}else{
	// 로그인 성공
	login = true;
	out.print("로그인 성공했습니다.");
	}
		
	%>
	<jsp:include page="/layout/header.jsp" />
	
	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
			      <li class="nav-item">
			        <a href="<%= root %>/user/index.jsp" class="nav-link link-body-emphasis">
			          마이 페이지
			        </a>
			      </li>
			      <li class="nav-item">
			        <a href="<%= root %>/user/update.jsp" class="nav-link link-body-emphasis">
			          회원정보 수정
			        </a>
			      </li>
			      <% }  %>
			      
			      <li>
			        <a href="#" class="nav-link active" aria-current="page" >
			          주문내역
			        </a>
			      </li>
			    </ul>
			    <hr>
			  </div>
		</div>
		
		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">주문 내역</h1>
				<div class="col-lg-6 mx-auto">
					<% if( !login ) { %>	
						<p class="lead mb-4">비회원 주문하신 경우, 전화번호와 주문 비밀번호를 입력해주세요.</p>
					<% } %>
				</div>
			</div>
			
			<!-- 주문 내역 영역 -->
			<div class="container shop m-auto mb-5">
					<form action="<%= root %>/user/order_pro.jsp" method="post">
					<% if( !login ) { %>
						<div class="mb-5">
							<table class="table">
								<tr>
									<td>전화번호 :</td>
									<td>
										<input type="text" class="form-control" name="phone" placeholder="- 생략하고 숫자만 입력해주세요.">
									</td>
								</tr>
								<tr>
									<td>주문 비밀번호 :</td>
									<td>
										<input type="password" class="form-control" name="orderPw" placeholder="주문 비밀번호를 입력해주세요.">
									</td>
								</tr>
							</table>
							<div class="btn-box d-grid gap-2">
								<button type="submit" class="btn btn-outline-primary btn-lg px-4 gap-3">조회</button>
							</div>
						</div>
					<% } %>
					</form>
				<% if( login || ( orderPhone != null && !orderPhone.isEmpty() ) ) { %>
				<!-- 주문 내역 목록 -->
				<table class="table table-striped table-hover table-bordered text-center align-middle">
					<thead>
						<tr class="table-primary">
							<th>주문번호</th>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<%
							int sum = 0;
							for(int i = 0 ; i < orderCount ; i++) {
								Product product = orderList.get(i);
								int total = product.getUnitPrice() * product.getQuantity();
								sum += total;
						%>
						<tr>
							<td><%= product.getOrderNo() %></td>			
							<td><%= product.getName() %></td>			
							<td><%= product.getUnitPrice() %></td>			
							<td><%= product.getQuantity() %></td>			
							<td><%= total %></td>			
							<td></td>			
						</tr>
						<%
							}
						%>
					</tbody>
					<tfoot>
						<%
							if( orderList.isEmpty() ) {
						%>
						<tr>
							<td colspan="6">추가된 상품이 없습니다.</td>	
						</tr>
						<% } else { %>
						<tr>
							<td></td>
							<td></td>
							<td>총액</td>
							<td id="cart-sum"><%= sum %></td>
							<td></td>
						</tr>
						<%
							}
						%>
					</tfoot>
				</table>
				
				<% } %>
			</div>
			
			<jsp:include page="/layout/footer.jsp" />
		</div>
	</div>
	
	
	
	<jsp:include page="/layout/script.jsp" />
	
	

	<script>
		
		let form = document.updateForm
		
		// 성별 선택
		let tempGender = document.getElementById('temp-gender')
		let radioFemale = document.getElementById('gender-female')
		let radioMale = document.getElementById('gender-male')
		// alert(tempGender.value)
		if( tempGender.value == '남' )		radioMale.checked = true
		if( tempGender.value == '여' )		radioFemale.checked = true
		
		
		// 생일 월 (select) 선택
		let tempMonth = document.getElementById('temp-month')
		let selectMonth = form.month
		selectMonth.value = tempMonth.value
		
		
		// 메일 도메인 (select) 선택
		let tempEmail2 = document.getElementById('temp-email2')
		let selectEmail2 = form.email2
		selectEmail2.value = tempEmail2.value
		
		
		// 탈퇴 체크
		function alertDel() {

			let form = document.updateForm

			let check = confirm('정말 탈퇴하시겠습니까?')

			if( check ) {
				form.action = 'delete.jsp'
				form.submit()
			}

		}
	
	</script>
	
</body>
</html>
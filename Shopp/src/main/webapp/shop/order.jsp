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
	
	
	


    

<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/shop/products.jsp">Product</a>
        </li>
      </ul>
       <ul class="navbar-nav d-flex align-items-center px-3">
       	
       	<!-- 비로그인 시 -->
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/login.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/join.jsp">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/order.jsp">주문내역</a>
        </li>
        
        <li class="nav-item">
	        <a class="nav-link position-relative" aria-current="page" href="/shop/cart.jsp">
	        	<i class="material-symbols-outlined">shopping_bag</i>
	        	<span class="cart-count">1</span>
	        </a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="/shop/products.jsp" method="get">
        <input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search" value="">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>





	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 주문 확인 영역 -->
	<div class="container order mb-5">
		<form action="complete.jsp" method="post">
		<!-- 배송정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문 형태 :</td>
					<td>비회원 주문</td>
				</tr>
				<tr>
					<td>성 명 :</td>
					<td>홍길동</td>
				</tr>
				<tr>
					<td>우편번호 :</td>
					<td>12345</td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td>서울특별시 강남구 신사동 123번지</td>
				</tr>
				<tr>
					<td>배송일 :</td>
					<td>20240417</td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td>01012345678</td>
				</tr>
				
				<tr>
					<td>주문 비밀번호 :</td>
					<td>
						<input type="password" class="form-control" name="orderPw">
					</td>
				</tr>
				
			</tbody></table>
		</div>
		
		<!-- 주문목록 -->
		<div class="cart-box">
			<table class="table table-striped table-hover table-bordered text-center align-middle">
				<thead>
					<tr class="table-primary">
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>자바 프로그래밍</td>			
						<td>50000</td>			
						<td>1</td>			
						<td>50000</td>			
						<td></td>			
					</tr>
					
				</tbody>
				<tfoot>
					
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td>50000</td>
						<td></td>
					</tr>
					
				</tfoot>
			</table>
	
		</div>
		
		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<div class="item">
				<a href="ship.jsp" class="btn btn-lg btn-success">이전</a>
				<!-- 취소 프로세스는 이어서... -->				
				<a href="" class="btn btn-lg btn-danger">취소</a>				
			</div>
			<div class="item">
				<input type="hidden" name="login" value="false">
				<input type="hidden" name="totalPrice" value="50000">
				<input type="submit" class="btn btn-lg btn-primary" value="주문완료">	
			</div>
		</div>
		</form>
	</div>
	
	
<footer class="container p-5">
	<p>copyright Shop</p>
</footer>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="../static/js/validation.js"></script> -->			<!-- 상대경로 -->
	<!-- 절대경로 -->
<script src="/static/js/validation.js"></script>























</body>
</html>
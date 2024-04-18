<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath(); 
%>
<!-- 파비콘 -->
<link rel="icon" href="<%= root %>/static/img/logo.png" type="image/x-icon">
<!-- 썸네일 이미지 설정 -->
<meta property="og:image" content="https://i.imgur.com/yiTQ3EV.jpg">
<!-- 웹 페이지 설명 (선택사항) -->
<meta property="og:description" content="ALOHA CLASS🌴 - 쇼핑몰 프로젝트">
<!-- 웹 페이지 URL -->
<meta property="og:url" content>
<!-- 웹 페이지 제목 -->
<meta name="title" content="Shop🛒 ALOHA CLASS🌴">
<meta property="og:title" content="Shop🛒 ALOHA CLASS🌴">
<!-- 웹 페이지 타입 (웹사이트, 기사, 제품 등) -->
<meta property="og:type"
	content="쇼핑몰 프로젝트, 자바 웹개발, ALOHA CLASS, 알로하 클래스">
<meta name="robots" content="index, follw">
<!-- 사이트 맵 -->
<link rel="sitemap" href="<%= root %>/static/sitemap.xml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionId = (String)session.getAttribute("id");
	System.out.println(sessionId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-red w3-card w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="/" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
			<%if(sessionId == null){ %>
			<a href="/loginForm.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">로그인</a>
			<%} %>
			<%if(sessionId != null){ %>
			<a href="/logout.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">로그아웃</a>
			<%} %>
				<a href="/dice.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">주사위</a> 
				<a href="/fortune.jsp"class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">오늘의 운세</a> 
				<a href="#"class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">개인정보수정</a>
		</div>
	</div>
</body>
</html>
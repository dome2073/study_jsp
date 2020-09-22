<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>랜덤 주사위</h1>
	
	
	<%
		int random1 = (int)(Math.random()*6)+1;
		int random2 = (int)(Math.random()*6)+1;
		
	%>
	<img src ="/img/dice<%=random1%>.jpg">
	<img src ="/img/dice<%=random2%>.jpg">
</body>
</html>
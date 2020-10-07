<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션 가져오기
	String sessionId = (String)session.getAttribute("id");
	//2. 세션이 없을 경우 접근 불가 
	if(sessionId == null) {
	  //2.1 --세션이 없을 경우 로그인페이지로 리다이렉트
		response.sendRedirect("/loginForm.jsp?url=dice");
	}
%>
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
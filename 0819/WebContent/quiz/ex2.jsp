<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	//쿠키를 받는 방법
	Cookie[] cookies = request.getCookies();
	

%>
<%@ include file ="header.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ex2.jsp</h1>
	
	<% 
	
	if(cookies==null || cookies.length ==0){%>
		<h2>아무 쿠키도 없음</h2>
	<%} else {
		for(int i=0; i< cookies.length;i++){
		Cookie cookie = cookies[i];	
		
	%>
			<h3><%=cookie.getName() %></h3>
			<h3><%=cookie.getValue() %></h3>
			<h3><%=cookie.getMaxAge() %></h3>
			<hr>
	<%}} %>
</body>
</html>
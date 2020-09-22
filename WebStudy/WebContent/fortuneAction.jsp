<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title></head>	
<body>
	<%
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
	%>
		
	<h1>오늘의 운세</h1>
	<h1>이름 : <%=name %></h1>
	<h1>생일 : <%=birth %></h1>
	<h1>성별 : <%=gender %></h1>
</body>
</html>
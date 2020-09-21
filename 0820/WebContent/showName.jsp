<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Object name = session.getAttribute("userName");
	if(name ==null){
		response.sendRedirect("hello.jsp");
		return;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=name%></h1>
</body>
</html>
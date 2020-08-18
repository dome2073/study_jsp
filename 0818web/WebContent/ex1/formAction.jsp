
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user = request.getParameter("user");
	String content = request.getParameter("content");
	
	String[] likes = request.getParameterValues("like");
	
%>

<h1> 이름 : <%=user %></h1>
<h1> 내용 : <%=content %></h1>
<h3> 좋아하는 언어 : <%=Arrays.toString(likes)%> </h3>
</body>
</html>
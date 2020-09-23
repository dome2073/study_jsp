<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	String remember = request.getParameter("remember");
	
	if(remember != null){
		//remember 을 체크 했을경우 쿠키 생성
		
		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);	
		response.sendRedirect("/");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 : <%=id %> </h1>
<h1>비밀번호 : <%=pw %> </h1>
<h1>아이디 기억 : <%=remember %> </h1>
<a href="/">메인으로 돌아가기</a>
</body>
</html>
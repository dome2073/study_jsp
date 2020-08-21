<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String boardno = request.getParameter("boardno");
	
	BoardService.getInstance().delete(boardno);
	
	response.sendRedirect("/board/list.jsp");
%>
</body>
</html>
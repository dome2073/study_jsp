<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="java.util.*" %>

<%
	String boardno = request.getParameter("boardno");

	BoardDTO dto = BoardService.getInstance().findByBoardNO(boardno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회페이지</title>
</head>
<body>
 <h1>Board Read Page</h1>
 
 	
 	<h1>번호 : <%=dto.getBoardno() %></h1>
	<h1>제목 : <%=dto.getTitle() %></h1>
	<h1>내용 : <%=dto.getContent() %></h1>
	<h1>작성자 : <%=dto.getWriter() %></h1>
		
 <a href="/board/list.jsp">목록으로</a>
	<a href="/board/modify.jsp?boardno=<%=dto.getBoardno() %>">수정/삭제</a>
</body>
</html>
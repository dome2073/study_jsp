<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*"%>
<%@ page import="org.zerock.dto.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String boardno = request.getParameter("boardno");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");

	//해당 boardno가 있는지 확인

	BoardDTO dto = new BoardDTO();
	dto.setBoardno(boardno);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	
	try{
		BoardService.getInstance().update(dto);
		response.sendRedirect("/board/read.jsp?boardno=" + dto.getBoardno());
	}catch(Exception e){
		response.sendRedirect("/error.jsp");
	}
	
	//해당 boardno가 있으면 update

	
	%>
</body>
</html>
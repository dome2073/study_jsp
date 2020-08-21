<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>   
<% 
	request.setCharacterEncoding("UTF-8");
%>

<%	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	
	System.out.println(dto);
	
	BoardService.getInstance().add(dto);
	
	response.sendRedirect("/board/list.jsp");
%>
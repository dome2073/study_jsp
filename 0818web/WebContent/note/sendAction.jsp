<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.zerock.note.*"%>
<%
	//post 방식의 한글 처리
	request.setCharacterEncoding("UTF-8");
	//from//to//content
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String content = request.getParameter("content");
	
	Note note = new Note(from, to, content);
	
	NoteService.getInstance().add(note);

	response.sendRedirect("/note/outbox.jsp?userNum="+from);

%>
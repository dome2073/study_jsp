<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String userNum = request.getParameter("userNum");
	System.out.println(userNum);
	//success 
	// src  /note/inbox?userNum=1
	
	response.sendRedirect("/note/inbox.jsp?userNum="+userNum);
	
%>
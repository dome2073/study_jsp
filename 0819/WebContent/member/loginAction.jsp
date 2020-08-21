<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="org.zerock.service.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	try{
		MemberDTO memberInfo= MemberService.INSTANCE.findByMember(id, pw);
		
		session.setAttribute("member", memberInfo);
		response.sendRedirect("/board/list.jsp");
	}catch(Exception e){
		System.out.println(e.getMessage());
		response.sendRedirect("/error.jsp");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	}
	
	
	
	
	
	
	
%>
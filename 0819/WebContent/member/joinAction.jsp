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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	try{
		MemberDTO dto = new MemberDTO(id,pw,name,email);
		MemberService.INSTANCE.insert(dto);
		response.sendRedirect("/member/login.jsp");
	}catch(Exception e){
		response.sendRedirect("/error.jsp");
	}
	
	
	
	
%>
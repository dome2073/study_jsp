<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.User"%>
<%@ page import= "Dao.UserDao" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%--  <jsp:useBean id="user" class="Model.User" scope="page"/> --%>

<%!boolean loginCheck(HttpServletRequest request, HttpSession session) {
	//1. 로그인 = 아이디와 비밀번호를 받는다 
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	boolean result = false;
	
	//2. 입력한 아이디의 정보를 조회한다.
	UserDao udao = UserDao.getInstance();
	
	//3. 입력한 아이디의 정보에서 비밀번호가 일치하는지 확인한다.
	int selectResult = udao.selectUserOne(id, pw);
	
	if(selectResult == 1){
		session.setAttribute("id", id);
		result = true;
	}
	return result;
}

void addCookie(HttpServletRequest request, HttpServletResponse response) {

	String id = request.getParameter("id");
	String remember = request.getParameter("remember");

	//비밀번호가 일치하지않아도 아이디저장은 가능함
	if (remember != null) {
		//remember 을 체크 했을경우 쿠키 생성

		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);

	}
}%>


<%	
	boolean logincheck = loginCheck(request, session);
	//이전 페이지의 정보
	String backUrl = request.getParameter("url");

	
	if(backUrl.equals("null"))
		backUrl = "/index";
	
	if (logincheck == true) {
		response.sendRedirect(backUrl + ".jsp");
	} else {
		response.sendRedirect("/loginForm.jsp");
	}

//logincheck ? response.sendRedirect("/") : response.sendRedirect("/loginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
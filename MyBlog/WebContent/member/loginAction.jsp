<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User"%>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%--  <jsp:useBean id="user" class="Model.User" scope="page"/> --%>

<%!int loginCheck(HttpServletRequest request, HttpSession session) {
	//1. 로그인 = 아이디와 비밀번호를 받는다 
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	int selectResult;
	
	//2. 입력한 아이디의 정보를 조회한다.
	UserDao udao = UserDao.getInstance();
	
	//3. 입력한 아이디의 정보에서 비밀번호가 일치하는지 확인한다.
	//일치할경우 1 --> 이전페이지 또는 index페이지로 이동
	//일치하지 않을경우 0 --> loginForm페이지로 이동후 msg출력(alert)
	
	selectResult = udao.selectUserOne(id, pw);
	
	if(selectResult == 1){
		session.setAttribute("id", id);
	}
	
	return selectResult;
}

void removeCookies(HttpServletRequest request,  HttpServletResponse response){
	//쿠키가 있는지 확인
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length >0){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				Cookie cookie = new Cookie("id",""); // 2. 쿠키를 생성
                cookie.setMaxAge(0); // 3. 쿠키의 유효시간을 0으로 변경(쿠키삭제)
                response.addCookie(cookie); // 4. 쿠키를 응답에 포함시킨다.      

                
			}
		}
	}
}


void addCookie(HttpServletRequest request, HttpServletResponse response) {

	String id = request.getParameter("id");
	String remember = request.getParameter("remember");
	
	//비밀번호가 일치하지않아도 아이디저장은 가능함
	if (remember != null) {
		//remember 을 체크 했을경우 쿠키 생성

		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);
		return ;
	}
	
	removeCookies(request, response);
}%>


<%	
	addCookie(request, response);
	int logincheck = loginCheck(request, session);
	//이전 페이지의 정보
	String backUrl = request.getParameter("url");

	if(backUrl.equals("null")) backUrl = "/index";

	if (logincheck == 1) {
		response.sendRedirect(backUrl + ".jsp");
	} else {
		//아이디와 비밀번호가 일치하지 않을경우 form으로 이동 후
		//alert 출력
		out.print("<script>alert('아이디 또는 일치하지않습니다'); location.href ='/member/loginForm.jsp'</script>");
	}
	
	

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
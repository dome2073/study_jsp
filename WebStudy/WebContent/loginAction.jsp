<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	boolean loginCheck(HttpServletRequest request, HttpSession session){
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		boolean result = false;
		//로그인 성공시(아이디랑 비밀번호가 일치할 경우) 세션 생성
		if(id.equals("asdf") && pw.equals("1234")){
			//remember 을 체크 했을경우 쿠키 생성
			session.setAttribute("id", id);
			
			result = true;
		}
		
		return result;
	}	
	
	void addCookie(HttpServletRequest request, HttpServletResponse response){

		String id = request.getParameter("id");
		String remember = request.getParameter("remember");
		
		//비밀번호가 일치하지않아도 아이디저장은 가능함
		if(remember != null){
			//remember 을 체크 했을경우 쿠키 생성
			
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);	
			
		}
	}
%>


<%	
	boolean logincheck = loginCheck(request, session);
	
	if(logincheck == true){
		response.sendRedirect("/");
	}else{
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
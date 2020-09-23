<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	response.sendRedirect("/loginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/">메인으로 이동</a>
</body>
</html>
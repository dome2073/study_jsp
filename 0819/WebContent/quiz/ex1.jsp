<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%			//   키  / 값
	//쿠키 생성  - 이름 / 값 (문자열 - 한글 안됨, 객체안됨)
	Cookie cookie = new Cookie("current", "123");
	
	//유통기한 지정가능 - default : 메모리상에서만 보관 => 브라우저 종료시 소멸
	cookie.setMaxAge(180); //초단위
	//개발자가 직접 response에 담아 보내야 한다.
	
	response.addCookie(cookie);                                                                
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
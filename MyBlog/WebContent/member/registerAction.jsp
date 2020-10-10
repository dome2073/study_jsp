<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "com.example.model.User" %>
<%@ page import= "com.example.dao.UserDao" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.DriverManager" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.ResultSet" %>
<%@ page import= "java.sql.SQLException" %>
 <jsp:useBean id="user" class="com.example.model.User" scope="page"/>
 <jsp:setProperty property="*" name="user"/>
<%
	//1. 유즈빈으로 사용자 요청저장
	
	//2. DB사용하기 위해 dao객체 생성
	UserDao udao = UserDao.getInstance();
	
	//3. DB쿼리실행
	//널체크 굳이 안해도됨
	//3.1 --해당 회원이 이미 존재하는지 확인
	int result = udao.selectUser(user.getUser_id()); 
	System.out.println(result);
	if(result == 1){
		//검색 결과 user가 있을경우.
		out.print("<script>alert('이미 존재하는 아이디입니다.'); location.href ='/member/registerForm.jsp'</script>");
	}else if(result == 0){
		//검색결과 유저가 없을 경우
		udao.insertUser(user);
		request.setAttribute("userInfo", user);
		pageContext.forward("/member/userInfo.jsp");
	}else if(result == -1){
		//예외처리
		out.print("<script>alert('데이터 오류입니다. 다시입력해주세요'); location.href ='/member/registerForm.jsp'</script>");
	}
	//4. action - 페이지이동 - main으로 x..
	//  userInfo로 유저 입력값 포워딩,,
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- <jsp:forward page="userInfo.jsp">
	<jsp:param value="user" name="userInfo"/>
</jsp:forward> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "Model.User" %>
<%@ page import= "Dao.UserDao" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.DriverManager" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.ResultSet" %>
<%@ page import= "java.sql.SQLException" %>
 <jsp:useBean id="user" class="Model.User" scope="page"/>
 <jsp:setProperty property="*" name="user"/>
<%
	UserDao udao = UserDao.getInstance();
	//1 . BeanSet 확인
	//2. DB쿼리실행
	if(user != null){
		udao.insertUser(user);
	}
	//3. action
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="userInfo.jsp">
	<jsp:param value="user" name="userInfo"/>
</jsp:forward>
</body>
</html>
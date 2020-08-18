<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX FILE</title>
</head>
<body>
<form action="formAction.jsp" method="post">
	<input type ="text" name="user">
	<input type ="text" name="content">
	
	<select name="like" multiple="multiple">
		<option value="C">C</option>
		<option value="C++">C++</option>
		<option value="JAVA">JAVA</option>
		<option value="C#">C#</option>
	</select>
	
	<input type="submit">
	<input type="reset">
</form>
</body>
</html>
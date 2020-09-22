<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>오늘의 운세</h1>
	<form action="ForturnAction" method="get">
		남자 <input type ="radio" name="gender" value="남자"/>
		여자 <input type ="radio" name="gender" value="여자"/>
		이름 <input type ="text" name="name"/>
		생년월일<input type ="text" name="birth"/>
		<input type ="submit"/>
	</form>
</body>
</html>
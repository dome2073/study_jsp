<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/ex1/inputResult.jsp" method="get" target="zeroFrame">
	<input type="text" name="name">
	<input type="text" name="age">
	<button>SUBMIT</button>
	

</form>

<iframe name="zeroFrame" style="display: none;">
</iframe>
</body>
</html>
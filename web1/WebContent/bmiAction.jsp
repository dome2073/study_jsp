<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		
		float height = Float.parseFloat(request.getParameter("height"));
		float weight = Float.parseFloat(request.getParameter("weight"));
		float sum = weight /(height * height) *10000;
		float bmi = Math.round((sum * 10) /10.0);
		
		String body ="";
		if(bmi >30){
			body ="비만";
		}else if(25<=bmi && bmi<=29){
			body="과체중";
		}else if(20<=bmi && bmi<=24){
			body="정상";
		}else{
			body="저체중";
		}
	
	%>
	<h1>키 : <%=height %></h1>
	<h1>몸무게 : <%=weight %></h1>
	<h1> bmi지수는 :<%= sum %></h1>
	<h1> <%=body%>입니다</h1>
</body>
</html>
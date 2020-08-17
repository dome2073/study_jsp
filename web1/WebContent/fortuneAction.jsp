<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%	
		String animal= request.getParameter("animal");
		
		
		String[] arr = {"대길", "소길", "소흉", "대흉"} ;
		int idx = (int)(Math.random() * arr.length);
	
	%>
	
	<h1> <%=animal %>띠의 운세는 <%=arr[idx] %></h1>
	
</body>
</html>
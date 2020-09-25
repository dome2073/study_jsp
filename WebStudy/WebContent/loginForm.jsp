<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//쿠키가 있으면 쿠키id를 반환해주는 메서드
	String getCookieId(HttpServletRequest request){
	
	Cookie[] cookies = request.getCookies();
	String CookieID = "";
	if(cookies != null && cookies.length >0){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				CookieID = cookies[i].getValue();
			}
		}
	}
		return CookieID;
	}
%>
<%	
	//쿠키가 있는지 확인
	String CookieID = getCookieId(request);

	//이전 페이지의 정보
	String backUrl= request.getParameter("url");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2>Login Form</h2>

<form action="/loginAction.jsp">


  <div class="container">
    <label for="uname"><b>Username</b></label>
   	<%if(CookieID != null){%>
   		<input type="text" placeholder="Enter Username" name="id" value="<%=CookieID %>" required>
   	<%}else{%> 
    <input type="text" placeholder="Enter Username" name="id"  required>
	<%} %>
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
        
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
     <a href="/cookieMove.jsp">쿠키삭제하기</a>
  </div>
  
  <input type ="hidden" name="url" value ="<%=backUrl%>">
</form>


</body>
</html>
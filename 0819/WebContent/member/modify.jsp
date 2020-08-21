<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../header.jsp"%>    
<%
	Object result = session.getAttribute("member");

	if(result == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
	
	
	
	%>	

        <div class="container-fluid">
        	<h1>회원정보수정</h1>
			<form action="joinAction.jsp" method="post"class="user">
               <div class="form-group">
                  <div class= "form-group">
                    <input type="text" name="id" value="<%=s_dto.getId() %>" readonly="readonly" class="form-control form-control-user" id="exampleFirstName" placeholder="아이디">
                  </div>
                 
                </div>
                
                <div class="form-group">
                   <div class="form-group">
                  <input type="password" name="pw" class="form-control form-control-user" id="exampleInputEmail" placeholder="change your password">
                </div>
                
                 <div class="form-group">
                  <input type="text" name="name" class="form-control form-control-user" id="exampleInputEmail" placeholder="change your name">
                </div>
                 <div class="form-group">
                  <input type="email" name="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="change your email">
                </div>
                 
                </div>
                <button class="btn btn-primary btn-user btn-block">
                  Register
                </button>
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
        </div>
<%@ include file ="../footer.jsp"%>         
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@page import="org.zerock.dto.*"%>
<%@page import="org.zerock.service.*"%>
<%@ page import="java.util.*"%>
<%
	Object result = session.getAttribute("member");

if (result == null) {
	response.sendRedirect("/member/login.jsp");
	return;
}

%>
<div class="container-fluid">
	<h1>쪽지보내기</h1>
	<form action="/note/sendAction.jsp" method="post">
		<div class="form-group">
			<label for="exampleInputEmail1">보내는사람</label>
			 <input type="text"name="from" readonly="readonly" class="form-control"id="exampleInputEmail1" aria-describedby="emailHelp" value='<%=s_dto.getId()%>'> 
			 <small id="emailHelp"class="form-text text-muted">We'll never share your emailwith anyone else.</small>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">받는사람</label> 
			<input type="text"name="to"class="form-control"id="exampleInputEmail1" aria-describedby="emailHelp"> 
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">내용</label>
			<textarea name="content" class="form-control"
				id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<%@ include file="../footer.jsp"%>

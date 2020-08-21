<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.zerock.dto.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	
	Object result = session.getAttribute("member");

	if(result == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
	MemberDTO dto = (MemberDTO)result;
%>
<%@ include file ="../header.jsp"%> 
	
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">게시물등록</h1>
			
		<form action="/board/registerAction.jsp" method="post">
		  <div class="form-group">
		    <label for="exampleInputEmail1">제목</label>
		    <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		    <label for="exampleInputEmail1">내용</label>
		    <textarea class="form-control" name="content" id="exampleInputEmail1" aria-describedby="emailHelp" style="height: 200px;"></textarea>
		    <label for="exampleInputEmail1">작성자</label>
		    <input type="text" name="writer" value=<%=dto.getId() %> readonly="readonly" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		  </div>
		  <button type="submit" class="btn btn-primary">등록</button>
		</form>

        </div>
        <!-- /.container-fluid -->
	<%@ include file ="../footer.jsp"%> 

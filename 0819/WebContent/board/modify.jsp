<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="java.util.*" %>

<%
	String boardno = request.getParameter("boardno");

	BoardDTO dto = BoardService.getInstance().findByBoardNO(boardno);
%>    
<%@ include file ="../header.jsp"%> 
	
	
    <div class="container-fluid">
	<h1>Board Modify page</h1>
	
	<form action="/board/modifyAction.jsp">
		제목 <input type="text" name="title" value="테스트" value=<%=dto.getTitle() %>><br>
		내용<br><textarea style="width:500px; height: 100px;" name="content" ><%=dto.getContent() %></textarea> <br/>		작성자 <input type="text" name="writer" disabled="disabled" value=<%=dto.getWriter() %>><br>
	
		<input type="hidden" name="boardno" value="<%=dto.getBoardno()%>">
		<button>수정</button>
	</form>
	
	<form action="/board/removeAction.jsp">
		<input type="hidden" name="boardno" value="<%=dto.getBoardno()%>">
		<button>삭제</button>
	</form>
	
	<div>
	<button><a href="/board/list.jsp">목록</a></button>
	</div>
	</div>
</body>
</html>
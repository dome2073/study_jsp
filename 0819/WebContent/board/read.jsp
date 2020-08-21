<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	Object result = session.getAttribute("member");

	if(result == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
%>
<%
	String id = request.getParameter("id");
	String boardno = request.getParameter("boardno");

	BoardDTO dto = BoardService.getInstance().findByBoardNO(boardno);
%>
<%@ include file ="../header.jsp"%> 
	
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">게시물 조회</h1>
			
			<h1>Board Read Page</h1>
 
 	
		 	<h1>번호 : <%=dto.getBoardno() %></h1>
			<h1>제목 : <%=dto.getTitle() %></h1>
			<h1>내용 : <%=dto.getContent() %></h1>
			<h1>작성자 : <%=dto.getWriter() %></h1>
				
			<a href="/board/list.jsp" class="btn btn-primary">목록</a>
			<%if(dto.getWriter().equals(s_dto.getId())){ %>
			<a href="/board/modify.jsp?boardno=<%=dto.getBoardno() %>"class="btn btn-primary">수정</a>
		<%} %>
        </div>
        <!-- /.container-fluid -->

     <%@ include file ="../footer.jsp"%> 
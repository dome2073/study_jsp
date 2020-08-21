<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@page import="org.zerock.dto.*"%>
<%@page import="org.zerock.service.*"%>
<%@page import="java.util.*"%>
<%
	Object result = session.getAttribute("member");

if (result == null) {
	response.sendRedirect("/member/login.jsp");
	return;
}

List<NoteDTO> list = NoteService.getInstance().sendList(s_dto.getId());
%>
<div class="container-fluid">
	<h1><%=s_dto.getId()%>님이 보낸 쪽지함
	</h1>

	<ul class="list-group">
		<%
			for (int i = 0; i < list.size(); i++) {
		%>
		<li
			class="list-group-item d-flex justify-content-between align-items-center">
			<%=list.get(i).getContent()%> <span
			class="badge badge-primary badge-pill"><%=list.get(i).getTo()%></span>
		</li>
		<%
			}
		%>

	</ul>
	
	<div style="margin-top:20px;"></div>
	<a href="/note/send.jsp" class="btn btn-primary">쪽지 보내기</a>
</div>

<%@ include file="../footer.jsp"%>

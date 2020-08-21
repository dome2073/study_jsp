<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.zerock.service.*" %>
<%@ page import="org.zerock.dto.*" %>
<%@ page import="java.util.*" %>

<%	
	
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	Object result = session.getAttribute("member");

	if(result == null){
		response.sendRedirect("/member/login.jsp");
		return;
	}
	
	
	int pageValue =1; 
	
	try{
		pageValue = Integer.parseInt(request.getParameter("page"));
		
	}catch(Exception e){
		pageValue = 1;
		
	}
	System.out.println("밖:" + pageValue);
	List<BoardDTO> list = BoardService.getInstance().getList2(pageValue);
	System.out.println("list:" +list);
	int total = BoardService.getInstance().getTotal();
	
	PageMaker pm = new PageMaker(request.getParameter("page"), total);

	
	//List<BoardDTO> list = BoardService.getInstance().getList();

	
%>

<%@ include file ="../header.jsp"%> 
	
	
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
                 
			for(int i=0; i<=list.size()-1; i++){%>
				
		<tr>
		<td><%=list.get(i).getBoardno()%></td>
		<td><a href="/board/read.jsp?boardno=<%=list.get(i).getBoardno()%>"><%=list.get(i).getContent()%></a></td>
		<td><%=list.get(i).getWriter()%></td>
		
		</tr>
		<%} %>
                    
                  </tbody>
                </table>
              </div>
            </div>
         	
         	
         	
          <nav aria-label="Page navigation example" style ="margin-left: 15px;">
			  <ul class="pagination">
			  	
			  	<%if(pm.isPrev()){%> <li class="page-item"><a class="page-link" href="/board/list.jsp?page=<%=pm.getStart()-1%>">이전</a></li><%} %>	
			  	<%
			  		for(int i=pm.getStart(); i<=pm.getEnd(); i++){%>
			    <li class="page-item"><a class="page-link" href="/board/list.jsp?page=<%=i%>"><%=i %></a></li>
			  	
			  	<%} %>
			   <%if(pm.isNext()){%> <li class="page-item"><a class="page-link" href="/board/list.jsp?page=<%=pm.getEnd()+1%>">다음</a></li><%} %>
			  </ul>
		</nav>

          </div>
 
			  <a href="/board/register.jsp" class="btn btn-primary">등록</a>
        </div>
        <!-- /.container-fluid -->

     
      <!-- End of Main Content -->
     
      <!-- Footer -->
      <%@ include file ="../footer.jsp"%>

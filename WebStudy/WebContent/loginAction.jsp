<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.User"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
 <jsp:useBean id="user" class="Model.User" scope="page"/>

<%!
	private static User selectUser(String userId,String pw) {
	User user = new User();
	// TODO Auto-generated method stub
	String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String DB_USER = "student";
	String DB_PASSWORD = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String query = "select * from user_info where user_id = ? and user_pw = ?"; //실행할 쿼리

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
		pstmt = conn.prepareStatement(query); // Statement를 가져온다.
		
		pstmt.setString(1,userId);
		pstmt.setString(2,pw);
		
		rs = pstmt.executeQuery(); // SQL문을 실행한다.
		
		
		while(rs.next()){
//			System.out.println("1");
//			System.out.println(rs.getString("user_id") + " "); 
//			System.out.println(rs.getString("password") + " ");
//			System.out.println(rs.getString("name") + " "); 
//			System.out.println(rs.getString("email") + " "); 
//			System.out.println(rs.getString("in_date") + " ");
//			System.out.println(rs.getString("up_date") + " ");
			
			user.setUser_id(rs.getString("user_id"));
			user.setUser_pw(rs.getString("password"));
			user.setUser_name(rs.getString("name"));
			user.setUser_email(rs.getString("email"));
			user.setIn_date(rs.getString("in_date"));
			user.setUp_date(rs.getString("up_date"));
			
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
		
		
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
		}

	}
	
	//예외처리 X
	
	return user;
}
%>


<%!boolean loginCheck(HttpServletRequest request, HttpSession session) {
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	boolean result = false;
	
	//로그인 성공시(아이디랑 비밀번호가 일치할 경우) 세션 생성
	if (id.equals("asdf") && pw.equals("1234")) {
		//remember 을 체크 했을경우 쿠키 생성
		session.setAttribute("id", id);

		result = true;
	}

	return result;
}

void addCookie(HttpServletRequest request, HttpServletResponse response) {

	String id = request.getParameter("id");
	String remember = request.getParameter("remember");

	//비밀번호가 일치하지않아도 아이디저장은 가능함
	if (remember != null) {
		//remember 을 체크 했을경우 쿠키 생성

		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);

	}
}%>


<%	
	boolean logincheck = loginCheck(request, session);
	//이전 페이지의 정보
	String backUrl = request.getParameter("url");

if (logincheck == true) {
	response.sendRedirect(backUrl + ".jsp");
} else {
	response.sendRedirect("/loginForm.jsp");
}

//logincheck ? response.sendRedirect("/") : response.sendRedirect("/loginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
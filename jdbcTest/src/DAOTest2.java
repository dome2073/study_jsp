import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class DAOTest2 {
	public static void main(String[] args) {
		
		//생성자로 객체 생성
		User u = new User("ff22f2", "정대윤", "1234", "aaa@aaa.com");
		System.out.println(u);
		
		
		//2. User 객체를 매갠수로 받아 DB의 user_info테이블에 insert하는 insertUser()메서드
		insertUser(u);
	}
	
	//2. User 객체를 매갠수로 받아 DB의 user_info테이블에 insert하는 insertUser()메서드
	static int insertUser(User u) {
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";
		int SQLSTATUS = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "insert into user_info (USER_ID, PASSWORD, NAME, EMAIL) values(?,?,?,?)"; //실행할 쿼리

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.
			
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_name());
			pstmt.setString(4, u.getUser_email());
			
			pstmt.executeUpdate(); // SQL문을 실행한다.

			SQLSTATUS = 1;
			return SQLSTATUS;
			
		} catch (Exception e) {
			e.printStackTrace();
			SQLSTATUS = -1;
			return SQLSTATUS;
		} finally {
			try {

				pstmt.close();
				conn.close();
			} catch (SQLException e) {
			}

		}
	}
}

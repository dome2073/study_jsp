
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class DAOTest6 {
	public static void main(String[] args) {

//		//생성자로 객체 생성
//		User u = new User("ff22f2", "정대윤", "1234", "aaa@aaa.com");
//		System.out.println(u);

		// 2. User 객체를 매갠수로 받아 DB의 user_info테이블에 insert하는 insertUser()메서드
		// insertUser(u);

		// 3. User객체를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 update하는 updateUser()메서드를 작성
		// updateUser(u); //객체 u 에저장된 user_id와 동일한 행의 정보를 update

		// 4. user_id를 매개변수로 받아 user_info테이블에서 해당 사용자의정보를 가져오는 selectUser()메서드

		// 4 +. user_id를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 가져오고
//		User u = selectUser("ff22f");
//		System.out.println(u);
//		// 5. 객체u에 저장된 user_id와 동일한 행의 정보를 delete하는메서드
//		deleteUser(u.getUser_id());

//		u = selectUser("ff22f"); // null 이 나와야한다.
//		System.out.println(u);
		
		//6. user_info테이블에 있는 모든 행을 반환하는 selectAllUser()메서드
		List<User> list = selectAllUsers();

	    System.out.println(list);
	}
	private static List<User> selectAllUsers() {
		// TODO Auto-generated method stub
		List<User> userList = new ArrayList<User>();
		// TODO Auto-generated method stub
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from user_info"; // 실행할 쿼리

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

//			pstmt.setString(1, userId);

			rs = pstmt.executeQuery(); // SQL문을 실행한다.

			while (rs.next()) {
				User user = new User();
//				System.out.println("-------------------------------------");
//				System.out.println(rs.getString("user_id") + " "); 
//				System.out.println(rs.getString("password") + " ");
//				System.out.println(rs.getString("name") + " "); 
//				System.out.println(rs.getString("email") + " "); 
//				System.out.println(rs.getString("in_date") + " ");
//				System.out.println(rs.getString("up_date") + " ");
//				
//				System.out.println("-------------------------------------");
				user.setUser_id(rs.getString("user_id"));
				user.setUser_pw(rs.getString("password"));
				user.setUser_name(rs.getString("name"));
				user.setUser_email(rs.getString("email"));
				user.setIn_date(rs.getString("in_date"));
				user.setUp_date(rs.getString("up_date"));
				userList.add(user);
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

		// 예외처리 X

		return userList;
	}
	// 5. 객체u에 저장된 user_id와 동일한 행의 정보를 delete하는메서드
	private static int deleteUser(String user_id) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";
		int SQLSTATUS = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "delete from user_info where user_id = ?"; // 실행할 쿼리

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1,user_id);

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

	// select - executeQuery
	// 4. user_id를 매개변수로 받아 user_info테이블에서 해당 사용자의정보를 가져오는 selectUser()메서드
	private static User selectUser(String userId) {
		User user = new User();
		// TODO Auto-generated method stub
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from user_info where user_id = ?"; // 실행할 쿼리

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery(); // SQL문을 실행한다.

			while (rs.next()) {
//				System.out.println("1");
//				System.out.println(rs.getString("user_id") + " "); 
//				System.out.println(rs.getString("password") + " ");
//				System.out.println(rs.getString("name") + " "); 
//				System.out.println(rs.getString("email") + " "); 
//				System.out.println(rs.getString("in_date") + " ");
//				System.out.println(rs.getString("up_date") + " ");

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

		// 예외처리 X

		return user;
	}

	// update , insert - executeUpdate()
	// 3. User객체를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 update하는 updateUser()메서드를 작성
	private static int updateUser(User u) {
		// TODO Auto-generated method stub
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";
		int SQLSTATUS = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "update user_info set user_id = '변경' where user_id = ?"; // 실행할 쿼리

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, u.getUser_id());

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

	// update , insert - executeUpdate()
	// 2. User 객체를 매갠수로 받아 DB의 user_info테이블에 insert하는 insertUser()메서드
	static int insertUser(User u) {
		String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String DB_USER = "student";
		String DB_PASSWORD = "1234";
		int SQLSTATUS = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "insert into user_info (USER_ID, PASSWORD, NAME, EMAIL) values(?,?,?,?)"; // 실행할 쿼리

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




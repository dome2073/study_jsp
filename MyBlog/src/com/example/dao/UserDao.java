package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.User;


public class UserDao {

	private static UserDao userdao;

	Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public void setConnection(Connection conn) {
		// TODO Auto-generated method stub
		this.conn = conn;
	}
	// 싱글턴 패턴
	// 생성자를 private로
	private UserDao() {
		
	}
	public static UserDao getInstance() {
		if (userdao == null) {
			userdao = new UserDao();
		}
		return userdao;
	}
	
	//로그인
	public int selectUserOne(String id, String pw) {
		User user = new User();
		int result =0;
		
		String query = "select * from user_info where user_id = ? and password = ?"; // 실행할 쿼리

		try {
			
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery(); // SQL문을 실행한다.

			while (rs.next()) {
				result =1;
				System.out.println("1");
				System.out.println(rs.getString("user_id") + " "); 
				System.out.println(rs.getString("password") + " ");
				System.out.println(rs.getString("name") + " "); 
				System.out.println(rs.getString("email") + " "); 
				System.out.println(rs.getString("in_date") + " ");
				System.out.println(rs.getString("up_date") + " ");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		} finally {
			try {
				rs.close();
				pstmt.close();

			} catch (SQLException e) {
			}

		}
		return result;
	}
	
	//모든유저정보
	public List<User> selectAllUsers() {
		// TODO Auto-generated method stub
		List<User> userList = new ArrayList<User>();

		String query = "select * from user_info"; // 실행할 쿼리

		try {

			
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.
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

			} catch (SQLException e) {
			}

		}

		// 예외처리 X

		return userList;
	}

	// 5. 객체u에 저장된 user_id와 동일한 행의 정보를 delete하는메서드
	public int deleteUser(String user_id) {

		int SQLSTATUS = 0;

		String query = "delete from user_info where user_id = ?"; // 실행할 쿼리

		try {

			
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, user_id);

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
			} catch (SQLException e) {
			}

		}
	}
	public  User selectUserInfo(String userId) {
		User user = new User();

		String query = "select * from user_info where user_id = ?"; // 실행할 쿼리

		try {

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
				
			} catch (SQLException e) {
			}

		}

		// 예외처리 X

		return user;
	}
	// select - executeQuery
	// 4. user_id를 매개변수로 받아 user_info테이블에서 해당 사용자의정보를 가져오는 selectUser()메서드
	public int selectUser(String userId) {
		int result =0;

		String query = "select * from user_info where user_id = ?"; // 실행할 쿼리

		try {

			
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery(); // SQL문을 실행한다.

			while (rs.next()) {
				result = 1;
				System.out.println(rs.getString("user_id") + " "); 
				System.out.println(rs.getString("password") + " ");
				System.out.println(rs.getString("name") + " "); 
				System.out.println(rs.getString("email") + " "); 
				System.out.println(rs.getString("in_date") + " ");
				System.out.println(rs.getString("up_date") + " ");

//				user.setUser_id(rs.getString("user_id"));
//				user.setUser_pw(rs.getString("password"));
//				user.setUser_name(rs.getString("name"));
//				user.setUser_email(rs.getString("email"));
//				user.setIn_date(rs.getString("in_date"));
//				user.setUp_date(rs.getString("up_date"));

			}

		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
			}

		}

		// 예외처리 X

		return result;
	}

	// update , insert - executeUpdate()
	// 3. User객체를 매개변수로 받아 user_info테이블에서 해당 사용자의 정보를 update하는 updateUser()메서드를 작성
	public int updateUser(User u) {
		// TODO Auto-generated method stub

		int SQLSTATUS = 0;

		String query = "update user_info set name = ? where user_id = ?"; // 실행할 쿼리

		try {

			pstmt = conn.prepareStatement(query); // Statement를 가져온다.

			pstmt.setString(1, u.getUser_name());
			pstmt.setString(2, u.getUser_id());


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
			} catch (SQLException e) {
			}

		}

	}

	// update , insert - executeUpdate()
	// 2. User 객체를 매갠수로 받아 DB의 user_info테이블에 insert하는 insertUser()메서드
	public int insertUser(User u) {

		int SQLSTATUS = 0;
		System.out.println("여기");

		String query = "insert into user_info (USER_ID, PASSWORD, NAME, EMAIL) values(?,?,?,?)"; // 실행할 쿼리

		try {

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
			} catch (SQLException e) {
			}

		}
	}

	
}

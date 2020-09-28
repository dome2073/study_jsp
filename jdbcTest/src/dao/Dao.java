package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {

	protected static Connection conn;
	protected static PreparedStatement pstmt;
	protected static ResultSet rs;
	
	protected static String tableName ="user_info";
	protected static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	protected static String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	protected static String DB_USER = "student";
	protected static String DB_PASSWORD = "1234";

	// 싱글턴 패턴
	// 생성자를 private로
	Dao() {
		this(null,"");
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	Dao(String tableName){
		this(null,tableName);
	}
	Dao(Connection conn, String tableName){
		this.tableName = tableName;
		
		//추가
		try(conn){
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 설정한다.
			pstmt = conn.prepareStatement(query); // Statement를 가져온다.
			rs = pstmt.executeQuery(); // SQL문을 실행한다.
		}
		
	}
	void close(AutoCloseable... asc) {
		
	}

}

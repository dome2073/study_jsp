package com.example.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.junit.Test;

import com.example.dao.UserDao;
import com.example.model.User;
import com.example.util.ApplicationListener;

public class DaoTest {

	UserDao udao = UserDao.getInstance();
	ServletContextEvent sce;
	@Test
	void ii() {
		System.out.println("zz");
	}
	
	@Test
	void user_insert() {
		System.out.println("zz");
		ApplicationListener ac = new ApplicationListener();
		
		ac.contextInitialized(sce);
		UserDao udao = UserDao.getInstance();
		//insert시(회원가입) 주의사항
		//1. 데이터가 notnull필드에 null값이 들어오면 안된다
		User u = new User(null, "1234", "정대윤", "wjdeodbs@aaa.com");

		assertEquals(udao.insertUser(u), -1);
		
		u = new User("user01", "1234", null, "abc@abc.com");
		
		assertEquals(udao.insertUser(u), -1);
		
		u = new User("user01", "1234", "정대윤", "abc@abc.com");
		
		assertEquals(udao.insertUser(u), 1);
		
		String selectID = udao.selectUserInfo(u.getUser_id()).getUser_id();
		
		assertTrue(selectID.equals("user01"));
		
		udao.deleteUser(selectID);
		
		//2. pk가 중복되는(id)값이 들어오면 안된다.
		u = new User("user01", "1234", "정대윤", "abc@abc.com");
		
		udao.insertUser(u);
		
		int in_Result = udao.insertUser(u);
		assertTrue(in_Result == -1); //사실 select로 조회 후 insert하는게 맞음
		
		udao.deleteUser(u.getUser_id());
		
		//3. 필드에 유효한 값이 들어와야한다.
		u = new User("user010101010101010010101", "1234", "정대윤", "abc@abc.com");
		//js에서 정규화처리 해야함
		in_Result = udao.insertUser(u); 
		assertTrue(in_Result == -1);
		
		ac.contextInitialized(sce);
		//		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
//		User u = new User();
	
	}
	
	@Test
	void user_update() {
		
		//update시 주의사항
		
		//1. 변경할 값이 있어야한다. 
		
		//2. where절 값이 생략되면 안된다.
		
		//3. not null값을 null로 바꾸면 안된다.
		
		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
		udao.insertUser(u);
		
		System.out.println("변경 전 : " +udao.selectUser("aaa001")); 
		
		User u2 = new User("aaa001", "1234567", "정대윤123", "wjdeodbs@aaa.com");
		udao.updateUser(u2); //예제는 아이디를 바꾸는것이여서.. //이름변경으로..
		
		//이름만 변경하는것으로..
		System.out.println("변경 후 "+ udao.selectUser(u2.getUser_id()));
		
		assertTrue(udao.selectUserInfo(u2.getUser_id()).getUser_name().equals(u2.getUser_name()));
		
		udao.deleteUser(u2.getUser_id());
	}
	@Test
	void user_select() {
		User user = new User();
//		user = udao.selectUser("test111");
		System.out.println(user);
	}
	
	@Test
	void user_login() {
		
//		String myinput_id = "";
//		String password ="";
//		assertEquals(udao.selectUserOne(myinput_id, password), 0);
		
		//아이디랑 비밀번호가 틀렸을 경우
		String myinput_id = "eodbs11";
		String password = "1234";
		assertEquals(udao.selectUserOne(myinput_id, password), 0); 
		
		//아이디랑 비밀번호가 일치할 경우
		myinput_id = "test111";
		password = "1234";
		
		assertEquals(udao.selectUserOne(myinput_id, password), 1);
		
	}
	
	@Test
	void user_delete() {
		udao.deleteUser("test116");
		System.out.println(udao.selectAllUsers());
	}

}

package com.example.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.example.dao.UserDao;
import com.example.model.User;

class test {
	
	UserDao udao = UserDao.getInstance();

	@Test
	void user_insert() {
		
		//insert시(회원가입) 주의사항
		//1. 데이터가 notnull필드에 null값이 들어오면 안된다
		User u = new User(null, "1234", "정대윤", "wjdeodbs@aaa.com");
		
		udao.insertUser(u);
		//2. pk가 중복되는(id)값이 들어오면 안된다.
		
		//3. 필드에 유효한 값이 들어와야한다.
		
		//4. insert 하려는 필드의 개수가 일치해야한다.
		
		
//		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
//		User u = new User();
	
	}
	
	@Test
	void user_update() {
		
		//update시 주의사항
		
		//1. 변경할 값이 있어야한다. (대상이 없는 대상이면 안된다)
		
		//2. where절 값이 생략되면 안된다.
		
		//3. not null값을 null로 바꾸면 안된다.
		
		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
		udao.updateUser(u, "aaaa001");
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

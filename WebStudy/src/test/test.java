package test;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import Dao.UserDao;
import Model.User;

class test {
	
	UserDao udao = UserDao.getInstance();

	@Test
	void user_insert() {
//		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
		User u = new User();
	
		udao.insertUser(u);

	}
	
	@Test
	void user_update() {
		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
		udao.updateUser(u, "aaaa001");
	}
	@Test
	void user_select() {
		User user = new User();
		user = udao.selectUser("test111");
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

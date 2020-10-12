package com.example.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.example.dao.UserDao;
import com.example.model.User;
import com.example.util.ApplicationListener;

public class test {
	
	@Test
	public void test() {
		System.out.println();
	}
	
	@Test
	void user_insert() {
		
		
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
		
		//		User u = new User("aaa001", "1234", "정대윤", "wjdeodbs@aaa.com");
//		User u = new User();
	
	}
}

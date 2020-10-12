package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.example.dao.UserDao;


public class ApplicationListener implements ServletContextListener {
	Connection conn;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("실행");
		ServletContext sc = sce.getServletContext();
		
		try {
			
			Class.forName(sc.getInitParameter("DRIVER"));
			conn = DriverManager.getConnection(
					sc.getInitParameter("URL"),
					sc.getInitParameter("USER"),
					sc.getInitParameter("PASSWORD")
			);
			System.out.println(conn);
			
			UserDao udao = UserDao.getInstance();
			udao.setConnection(conn);
			

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("종료");
		 try {
	            conn.close();
	        } catch (SQLException e) { }
	}
	
}

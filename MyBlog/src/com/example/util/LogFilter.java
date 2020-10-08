package com.example.util;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "LogFilter", urlPatterns = {"/dice.jsp"})
public class LogFilter implements Filter {
	public void init(FilterConfig config) throws ServletException {

		// filter초기화 작업 작성
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)

			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest)request;

    	HttpSession session = httpRequest.getSession(true);
    	
    	//로그인했을경우
    	// 2. 다음 filter가 작업을 할 수 있게 요청과 응답을 전달(그대로 사용)    	
    	if(session != null) {
    		chain.doFilter(request, response);
    	}else {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/loginForm.jsp");
    		dispatcher.forward(request,response);
    	}
	}
	
	public void destroy() {

		// filter가 제거되기 전에 수행되어야 할 마무리 작업 작성
	}

} // end

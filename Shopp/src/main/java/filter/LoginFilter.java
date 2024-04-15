package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LoginFilter implements Filter{

	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFilter 초기화");
		this.filterConfig = filterConfig;
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("InitParamFilter 수행...");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		if( id.equals(param1) && passwd.equals(param2) )
			message = "로그인 성공했습니다.";
		else {
			message = "로그인 실패했습니다.";
			// 관리자 계정 admin/1234 가 일치하지 않으면 메인화면으로 이동
			
			// 포워드
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
		
		writer.println(message);
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("LoginFilter 해제...");
		
	}

}

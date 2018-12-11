package com.example.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class MyWrapperFilter implements Filter {
	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {   
		AllUpperCaseWrapper mywrapper = 
				new AllUpperCaseWrapper((HttpServletRequest)request);
		chain.doFilter(mywrapper, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
}

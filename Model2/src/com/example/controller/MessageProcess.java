package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcess implements Controller {

	@Override
	public String myservice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("USERNAME", "한지민");
		request.setAttribute("USERAGE", 24);
		request.setAttribute("USERPHONE", "010-1234-5678");
		return "/messageView.jsp";
	}
}

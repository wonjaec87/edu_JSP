package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostDemoServlet")
public class PostDemoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("username");
		int userage = Integer.parseInt(req.getParameter("userage"));
		String userphone = req.getParameter("userphone");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		String result = "<strong>" + username + "</strong>님!";
		result += "<em>" + userage + "살</em>";
		result += "<u>" + userphone + "</u>";
		out.println(result);
		out.close();
	}

}

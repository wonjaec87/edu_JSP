package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.SelectController;
import com.example.libs.model.EmployeeDTO;

public class IndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/xml");
		PrintWriter out = res.getWriter();
		//SelectController sc = new SelectController();
		//Vector<EmployeeDTO> vector = sc.select();
		out.println("<result>");
		out.println("<code>success</code>");
		out.println("<data>");
		out.println("{");
		out.println("count : 5, ");
		out.println("message : 'Hello, World'");
		out.println("}");
		out.println("</data>");
		out.println("</result>");
		out.close();
	}
}












/*package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.SelectController;
import com.example.libs.model.EmployeeDTO;

public class IndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/xml");
		PrintWriter out = res.getWriter();
		//SelectController sc = new SelectController();//얘가 컨트롤러 갔다 오자
		//Vector<EmployeeDTO> vector = sc.select();//sc의 select를 호출하면 벡터가 넘어와
		//String str = "{"; //json의 시작은 중괄호
		//str += "'count' : 5, " + //키가 count : 값은 5
		//		   "'message' : 'Hello, World'";
		//str += "}";
		//out.println(str);  //여긴 json방식
		
		out.println("<result>");
		out.println("<code>success</code>");
		out.println("<data>");
		out.println("{");
		out.println("count : 5, ");
		out.println("message : 'Hello, World'");
		out.println("}");
		out.println("</data>");
		out.println("</result>");
		out.close();
	}

}*/
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("userpasswd");
	
	if(userid.equals("test") && passwd.equals("1213")){
		session.setAttribute("userid", userid);
	}
%>
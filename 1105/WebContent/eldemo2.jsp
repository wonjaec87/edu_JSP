<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie c1 = new Cookie("USERNAME", "한지민");
	response.addCookie(c1);
	Cookie c2 = new Cookie("USERGENDER", "female");
	response.addCookie(c2);
	Cookie c3 = new Cookie("USERAGE", "24");
	response.addCookie(c3);
%>
<h1>Cookie 3개가 잘 설정됐습니다.</h1>
<a href="eldemo3.jsp">Cookie GET</a>
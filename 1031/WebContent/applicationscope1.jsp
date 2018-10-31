<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = (String)application.getAttribute("username");
	int userage = (Integer)application.getAttribute("userage");
%>
<h1>Application Scope</h1>
<ul>
	<li>Username : <%=username %></li>
	<li>User age : <%=userage %></li>
</ul>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
%>
<ul>
	<li>Name : <%=username %></li>
	<li>Age : <%out.println(userage); %></li>
</ul>
<%
	/* int dan = Integer.parseInt(request.getParameter("dan"));
	for(int i = 1 ; i < 10 ; i++ ){
		out.println(dan + " x " + i + " = " + dan * i + "<br />");
	} */
%>
<br />
<%--<%=1+2+3+4+5+6+7+8+9+10 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));
%>
	<% for(int i = 1 ; i < 10 ; i++){ %>
	<%=dan%> x <%=i%>  = <%=dan * i %><br />
	<% } %>
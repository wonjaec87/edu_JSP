<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.example.dao.StudentDaoImpl"/>
<%
	String hakbun = request.getParameter("hakbun");
	dao.delete(hakbun);
	response.sendRedirect("/SungjukMgmt/");
%>
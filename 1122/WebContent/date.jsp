<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar" %>
<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH) + 1;
	//int day = now.get(Calendar.DAY_OF_MONTH);
	int day = now.get(Calendar.DATE);
	out.println("Today is " + year + "년 " + month + "월 " + day + "일.");
%>
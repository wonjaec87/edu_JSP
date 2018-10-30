<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true" %>
<div><img src="images/1.jpg"></div>
<div> 서버 오류남..............</div>
<%
	if(exception instanceof ArithmeticException){
		out.println("ArithmeticException");
	}else if(exception instanceof NullPointerException){
		out.println("NullPointerException");
	}else if(exception instanceof java.io.IOException){
		out.println("IOException");
	}else if(exception instanceof java.sql.SQLException){
		out.println("SQLException");
	}else{
		out.println("Exception");
	}
%>
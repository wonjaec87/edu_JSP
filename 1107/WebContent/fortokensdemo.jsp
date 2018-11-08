<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Scanner" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mytoken" value="사과, 배. 딸기-포도/복숭아, 레몬" />
<c:forTokens items="${mytoken}" delims=",./-" var="i">
	${i}&nbsp;&nbsp;&nbsp;
</c:forTokens>



<%
	//String str = "1101           한송이    78    87   55   77";
	//1. 
	//String [] array = str.split("\\s+");
	//2.
	//java.util.StringTokenizer st = new java.util.StringTokenizer(str, "");
	//3. 
	//Scanner scan = new Scanner(str).useDelimiter("\\s+");
%>
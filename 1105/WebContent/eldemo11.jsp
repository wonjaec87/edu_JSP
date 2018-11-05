<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="aaa" uri="/WEB-INF/tlds/mytld.tld" %>
<% 
	Date today = new Date();
	pageContext.setAttribute("today", today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	오늘은 <b>${aaa:formatDate(today)}</b>
</body>
</html>
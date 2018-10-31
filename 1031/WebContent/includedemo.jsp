<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 여기는 includedemo.jsp입니다.</h1>
	<%-- <% pageConttext.include("/date.jsp"); %> --%>
	<%@ include file="/date.jsp" %>
	<hr />
	<%@ include file="/Lion.html" %>
	<h3> 페이지의 끝</h3>
</body>
</html>
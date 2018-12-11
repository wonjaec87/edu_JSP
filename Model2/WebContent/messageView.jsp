<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="result" value="${requestScope.result}" />  --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 MVC 페이지</title>
</head>
<body>
	<h1>결과페이지</h1>
	<ul>
		<li>이름 : ${requestScope.USERNAME}</li>
		<li>나이 : ${requestScope.USERAGE} </li>
		<li>전화번호 :  ${requestScope.USERPHONE}</li>
	</ul>
</body>
</html>
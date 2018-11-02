<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="login" class="com.example.libs.model.LoginBean" scope="session" />
    <%
    if(login.isVerified()){  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 페이지</title>
</head>
<body style='backgroud-color:orange'>
	<jsp:getProperty name="login" property="userid" />님!<br />
	<p style='color:green'> 회원입니다. </p>
	<a href="logout.jsp"> 로그아웃 </a>
</body>
</html>
<% }else {%>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 페이지</title>
</head>
<body style='backgroud-color:red'>
<script>
alert("로그인하세요");
location.href = "login.html";
</script>	
	<p style='color:white'> 비회원입니다. </p>
</body>
</html>
<%} %>

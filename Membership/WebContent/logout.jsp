<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<c:if test="${empty sessionScope.userid}">
	<script>
		alert("반드시 로그인을 먼저 하셔야 로그아웃을 하실 수 있습니다.");
		location.href ="login.html";
	</script>
</c:if>
<c:if test="${not(empty sessionScope.userid)}">
	<script>
		alert("서비스에 만족하십니까? \n${sessionScope.username}님!!다음에 다시 방문해 주십시오.");
		location.replace("index.html");
	</script>
</c:if>
<% 
	session.invalidate();
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 1L);
%>
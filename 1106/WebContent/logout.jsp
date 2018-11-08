<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="session" />
<!DOCTYPE html>
<%  if(!login.isVerified()){  %>
	<script>
		alert("반드시 로그인을 먼저 하셔야 로그아웃을 하실 수 있습니다.");
		location.href ="login.html";
	</script>
<% }else{ %>
	<script>
		alert("서비스에 만족하십니까? \n<%=login.getUserid()%>님!!다음에 다시 방문해 주십시오.");
		location.replace("login.html");
	</script>
<% 
	}
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 1L);
%>
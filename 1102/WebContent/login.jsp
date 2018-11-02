<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.example.libs.model.LoginBean" scope="session" />

<%
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("passwd");
	if(userid.equals("wonjae") && passwd.equals("1234")){
		%>
		<jsp:setProperty property="userid" name="login" value="<%= userid %>" />
		<jsp:setProperty property="verified" name="login" value="true" />
		<script>
		alert("로그인성공")
		</script>
		<a href="secure.jsp"> 회원전용 페이지로</a>
		<%}else { %>
		<script>
		alert("Login 실패");
		</script>
		<a href="login.html"> 로그인 페이지로</a>
		<%}%>
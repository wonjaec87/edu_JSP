<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Cookie Update</h1>
<%
	session.setAttribute("username", "손호준");
	session.setAttribute("usergender", "male");
	session.setAttribute("userage", "33");

%>
<h2> Session 3개가 모두 수정됬습니다.</h2>
<button onclick="javascript:history.back();">돌아가기</button>
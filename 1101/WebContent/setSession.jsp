<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Session Create</h1>    
    
<%
	session.setAttribute("username", "한지민");
	session.setAttribute("usergender", "female");
	session.setAttribute("userage", 24);
%>
<h2>Session 3개가 생성됐습니다.</h2>
<button onclick="javascript:history.back();">돌아가기</button>
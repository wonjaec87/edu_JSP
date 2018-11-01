<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1> Set cookie</h1>
<%
	Cookie c1 = new Cookie("USERNAME","한지민");
	response.addCookie(c1);
	Cookie c2 = new Cookie("USERGENDER","femail");
	response.addCookie(c2);
	Cookie c3 = new Cookie("USERAGE","24");
	response.addCookie(c3);

%>
<h2> Cookie 3개가 생성됬습니다.</h2>
<button onclick="javascript:history.back();">돌아가기</button>
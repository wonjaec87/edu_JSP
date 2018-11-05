<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Cookie Get</h1>
<ul>
	<li>이름 : ${cookie.USERNAME.value}</li>
	<li>성별 : ${cookie["USERGENDER"].value} </li>
	<li>나이 :  ${cookie["USERAGE"]["value"]}</li>
	<li>Session ID : ${cookie["JSESSIONID"].value}</li>
</ul>
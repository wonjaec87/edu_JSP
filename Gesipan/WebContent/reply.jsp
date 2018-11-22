<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.controller.Util" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<c:set var="gesipan" value="${sc.select(param.idx)}" />
<c:set var="grp" value="${param.grp}" />
<c:set var="lev" value="${param.lev}" />
<c:set var="step" value="${param.step}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 답변하기</title>
</head>
<body>
	<h1>게시판 글 답변하기</h1>
	<form action="/Gesipan/reply_ok.jsp" method="post">
		<input type="hidden" name="p_idx" value="${param.idx}" />
		<input type="hidden" name="p_grp" value="${grp}" />
		<input type="hidden" name="p_lev" value="${lev}" />
		<input type="hidden" name="p_step" value="${step}" />
		<ul style="list-style-type: none;margin:10px 0px">
			<li>Name : <input type="text" name="name" value="${sessionScope.name}" /></li>
			<li>Password : <input type="password" name="passwd" /></li>
			<li>Email : <input type="email" name="email" size="50" />
			<li>Title : <input type="text" name="title" size="50" 
			        value="${Util.reconvert(gesipan.getTitle(), false)}"/></li>
			<li>Contents : <textarea name="contents" rows="10" cols="50">${Util.concat(Util.reconvert(gesipan.getContents(), true))}</textarea></li>
			<li><button type="submit">답변하기</button>&nbsp;&nbsp;&nbsp;
					<button type="reset">다시하기</button></li>
		</ul>
	</form>
</body>
</html>
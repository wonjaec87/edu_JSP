<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성하기</title>
</head>
<body>
	<h1>게시판 글 작성하기</h1>
	<form action="/Gesipan/write_ok.jsp" method="post" enctype="multipart/form-data">
		<ul style="list-style-type: none;margin:10px 0px">
			<li>Name : <input type="text" name="name" value="${sessionScope.name}" /></li>
			<li>Password : <input type="password" name="passwd" /></li>
			<li>Email : <input type="email" name="email" size="50" /></li>
			<li>Title : <input type="text" name="title" size="50" /></li>
			<li>File : <input type="file" name="filename" size="50" /></li>
			<li>Contents : <textarea name="contents" rows="5" cols="50"></textarea></li>
			<li><button type="submit">작성하기</button>&nbsp;&nbsp;&nbsp;
					<button type="reset">다시하기</button></li>
		</ul>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<jsp:useBean id="uc" class="com.example.libs.controller.UpdateController" />
<c:set var="gesipan" value="${sc.select(param.idx)}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용보기</title>
<link rel="stylesheet" href="css/style.css" />
<style type="text/css">
	table {
		width:50%; margin-left:auto;   margin-right:auto;
	}
	table:nth-of-type(1) th{
		width:20%; background-color:navy;
		color:white;
	}
	table:nth-of-type(1) td:nth-of-type(1){
		width:35%;
	}
	table:nth-of-type(2) > tr:nth-child(1) > td {
		text-align:center;
	}
	table:nth-of-type(2) td:nth-of-type(2) {
		text-align:left;
	}
</style>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$("#btnList").click(function(){
				location.href = "index.html";
			});
			$("#btnDelete").click(function(evt){
				var x = evt.screenX;
				var y = evt.screenY;
				window.open("delete.jsp?idx=" + ${param.idx} , "_blank", 
						"left=" + x +", top=" + y + ", width=400,height=300");
			});
			$("#btnUpdate").click(function(){
				location.href = "update.jsp?idx=" + ${param.idx};
			});
			$("#btnReply").click(function(){
				location.href = "reply.jsp?idx=" + ${param.idx}+"&grp=" + ${gesipan.getGrp()} + "&lev=" + ${gesipan.getLev()} + "&step=" + ${gesipan.getStep()};
			});
		});
	</script>
</head>
<body>
	<h1>${param.idx}번 글 내용</h1>
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><a href="mailto:${gesipan.getEmail()}">${gesipan.getName()}</a></td>
			<th>번호</th><td>${param.idx}</td>
		</tr>
		<tr>
			<th>작성날짜</th><td>${gesipan.getWritedate()}</td>
			<th>조회수</th><td>${gesipan.getReadnum()}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				<a href="download.jsp?idx=${param.idx}&filename=${gesipan.getFilename()}">${gesipan.getFilename()}</a>
			</td>
		</tr>
	</table><br />
	<table border='1'>
		<tr>
			<td>${gesipan.getTitle()}</td>
		</tr>
		<tr>
			<td>${gesipan.getContents()}</td>
		</tr>
		<tr>
			<td>
				<button id="btnList" type="button">목록으로</button>
				<button id="btnUpdate" type="button">수정하기</button>
				<button id="btnDelete" type="button">삭제하기</button>
				<button id="btnReply" type="button">답변하기</button>
			</td>
		</tr>
	</table>
</body>
</html>
${	uc.readnumUpdate(param.idx) }




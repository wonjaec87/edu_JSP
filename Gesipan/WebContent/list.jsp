<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<c:set var="vector" value="${sc.selectAll()}" />
<c:set var="count" value="${vector.size()}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXAMPLE.COM 고객 상담 페이지</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<h1>EXAMPLE.COM의 고객 상담 Q&A</h1>
	<table border='0'>
		<tr>
			<td><a href="write.jsp">입력하기</a></td>
			<td>[${count}]</td>
		</tr>
	</table>
	<table border='1'>
		<thead>
			<tr>
				<th style="width:10%">번호</th><th style="width:15%">작성자</th>
				<th style="width:50%">제목</th><th style="width:15%">작성날짜</th>
				<th style="width:10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${vector eq null}">
				<tr><td colspan="5" style="text-align:center">데이터가 없습니다.</td></tr>
			</c:if>
			<c:if test="${count ne 0}">
				<c:forEach var="row" items="${vector}">
					<tr>
						<td>${row.getIdx()}</td>
						<td><a href="mailto:${row.getEmail()}">${row.getName()}</a></td>
						<td style="text-align:left"><a href="view.jsp?idx=${row.getIdx()}">${row.getTitle()}</a></td>
						<td>${row.getWritedate()}</td>
						<td>${row.getReadnum()}</td>
					</tr>
				</c:forEach>
			</c:if>		
		</tbody>
	</table>
</body>
</html>

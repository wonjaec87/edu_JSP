<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<fmt:requestEncoding value="utf-8" />

<jsp:setProperty property="name" name="gesipan" value="${param.name}" />
<jsp:setProperty property="passwd" name="gesipan" value="${param.passwd}" />
<jsp:setProperty property="email" name="gesipan" value="${param.email}" />
<%
	String title = request.getParameter("title");
	title = title.replace("<", "&lt;");
	title = title.replace(">", "&gt;");
	title = title.replace("'", "''");   //single quotation --> single single quotation
	gesipan.setTitle(title);
	
	String contents = request.getParameter("contents");
	contents = contents.replace("<", "&lt;");
	contents = contents.replace(">", "&gt;");
	contents = contents.replace("'", "''");
	contents = contents.replace("\r\n", "<br />");
	gesipan.setContents(contents);
%>
<c:if test="${empty param.filename}">
	<jsp:setProperty property="filename" name="gesipan" value="" />
</c:if>
<c:if test="${not(empty param.filename)}">
	<jsp:setProperty property="filename" name="gesipan" value="${param.filename}" />
</c:if>

<c:set var="row" value="${ic.insert(gesipan)}" />
<c:if test="${row eq 1}">
	<script>
		//alert("Insert Success");
		location.href = "index.html";
	</script>
</c:if>
<c:if test="${row ne 1}">
	<script>
		//alert("Insert Failure");
		history.back();
	</script>
</c:if>








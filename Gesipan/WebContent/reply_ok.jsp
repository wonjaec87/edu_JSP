<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.libs.controller.Util" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="uc" class="com.example.libs.controller.UpdateController" />
<fmt:requestEncoding value="utf-8" />
<jsp:setProperty name="gesipan" property="name" value="${param.name}" />
<jsp:setProperty name="gesipan" property="passwd" value="${param.passwd}" />
<jsp:setProperty name="gesipan" property="email" value="${param.email}" />
<jsp:setProperty name="gesipan" property="title" value="${Util.convert(param.title, false)}" />
<jsp:setProperty name="gesipan" property="contents" value="${Util.convert(param.contents, true)}" />
<c:if test="${empty param.filename}">
	<jsp:setProperty property="filename" name="gesipan" value="" />
</c:if>
<c:if test="${not(empty param.filename)}">
	<jsp:setProperty property="filename" name="gesipan" value="${param.filename}" />
</c:if>
<jsp:setProperty name="gesipan" property="grp" value="${param.p_grp}" />
<jsp:setProperty name="gesipan" property="lev" value="${param.p_lev + 1}" />
${uc.updateStep(param.grp, param.p_step) ; ''}
<jsp:setProperty name="gesipan" property="step" value="${param.p_step + 1}" />
<c:set var="row" value="${ic.insertReply(gesipan) }" />
<c:if test="${row eq 1}">
	<script>location.href = "index.html";</script>
</c:if>
<c:if test="${row ne 1}">
	<script>
		alert("Insert Fail");
		history.back();
	</script>
</c:if>






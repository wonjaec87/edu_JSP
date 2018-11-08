<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="now" value="<%=new java.util.Date() %>" />
KST : ${now}<br />
<fmt:timeZone value="Hongkong">
	<fmt:formatDate value="${now}" type="both" 
	dateStyle="full" timeStyle="full"/>
	GMT : ${now1}
</fmt:timeZone>
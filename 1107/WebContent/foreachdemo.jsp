<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map, java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="array" value="<%=new int[]{3,4,5,6,7} %>" />

<c:forEach items = "${array}" var="i">
	<c:out value="${i}" />&nbsp;&nbsp;&nbsp;
</c:forEach><br />

<%
	Map<Integer, String> map = new HashMap<Integer, String>();
	map.put(1, "이승엽");   map.put(2, "김연경");
	map.put(3, "류현진");   map.put(4, "손홍민");
%>
<c:set var="PLAYERS" value="<%=map%>" />
<c:forEach items="${PLAYERS}" var="i">
	${i.key} = ${i.value}<br />
</c:forEach>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <% for(int i = 1 ; i <= 7 ; i++){ %>
<font color="blue" size="<%=i%>">Hello, World</font><br />
<% } %> --%>

<c:forEach begin="1" end="7" var="i">
	<font color="blue" size="${i}">Hello, World</font><br />
</c:forEach>
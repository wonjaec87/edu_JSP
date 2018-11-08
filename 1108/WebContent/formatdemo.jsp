<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="salary" value="1575678" />
Salary : <%=String.format("%,d", 1575678)%><br />
Salary : <%
	java.util.Formatter fmt = new java.util.Formatter();
	out.println(fmt.format("%,d", new Integer(1575678)));
%> <br />
Salary : <fmt:formatNumber type="currency" value="${salary}" currencySymbol="￦"/>
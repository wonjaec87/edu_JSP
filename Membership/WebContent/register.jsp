<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.MemberVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="utf-8" />

<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<%
	String zipcode = request.getParameter("zippost1") + "-" + request.getParameter("zippost2");
	MemberVO member = new MemberVO(request.getParameter("username"),
			                       request.getParameter("userid"), request.getParameter("passwd"), 
			                       request.getParameter("email"), zipcode, 
			                       request.getParameter("address1"),
			                       request.getParameter("address2"));
	int row = ic.insertMember(member);
	pageContext.setAttribute("row", row);
%>
<c:if test="${row eq 1}">
	<script>
		alert("Insert Success");
		location.href = "index.html";
	</script>
</c:if>
<c:if test="${row ne 1}">
	<script>
		alert("Insert Failure");
		history.back();
	</script>
</c:if>









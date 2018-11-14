<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:useBean id="dc" class="com.example.libs.controller.DeleteController" />

<c:set var="row" value="${dc.deleteMember(sessionScope.userid)}" />
<c:if test="${row eq 1}">
	<%
		session.invalidate();  //세션 정보 모두 지우기, 반드시 해야 할 것
	%>
	<c:redirect url="index.html"/>
</c:if>
<c:if test="${row ne 1}">
	<script>
		alert("서버의 잠시 이상이 발생하여 다시 삭제 요청드립니다.");
		history.back();
	</script>
</c:if>
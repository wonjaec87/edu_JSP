<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="uc" class="com.example.libs.controller.UpdateController" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="utf-8" />
<jsp:setProperty property="userid" name="member" value="${sessionScope.userid}"/>
<jsp:setProperty property="email" name="member" value="${param.email}"/>
<jsp:setProperty property="zipcode" name="member" value="${param.zippost1}-${param.zippost2}"/>
<jsp:setProperty property="address1" name="member" value="${param.address1}" />
<jsp:setProperty property="address2" name="member" value="${param.address2}" />
<c:set var="row" value="${uc.updateMember(member)}" />
<c:if test="${row eq 1}">
	<c:redirect url="index.html" />
</c:if>
<c:if test="${row ne 1}">
	<script>
		history.back();
	</script>
</c:if>


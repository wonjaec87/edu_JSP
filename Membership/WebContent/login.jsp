<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.MemberVO" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="flag" value="${sc.loginMember(param.userid, param.userpasswd)}" />

<c:if test="${flag eq 1}">
<%
	session.setAttribute("userid", request.getParameter("userid"));
	MemberVO member = sc.selectMember(request.getParameter("userid"));
	session.setAttribute("username", member.getUsername());
%>
	<script>
		alert("${sessionScope.username}(${param.userid})님! 환영합니다.");
		location.href = "index.html";
	</script>
</c:if>
<c:if test="${flag eq -1}">
	<script>
		alert("입력하신 아이디는 존재하지 않습니다.\n확인 후 다시 입력해 주세요.");
		history.back();
	</script>
</c:if>
<c:if test="${flag eq 0}">
	<script>
		alert("비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해 주세요.");
		history.back();
	</script>
</c:if>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8"/>

<sql:setDataSource driver="org.mariadb.jdbc.Driver" 
	url="jdbc:mariadb://192.168.56.4:3306/test" user="root" 
	password="121213" var="conn" />

<%--시도 구군 모두 선택하지 않았을 때 --%>
<c:if test="${param.listSido eq '--선택--' and param.listGugun eq '--선택--'}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE dong LIKE CONCAT('%',?,'%')  
	<sql:param value="${param.keyword}"/>
	</sql:query>
</c:if>	

<%-- 시도는 선택하고 구군을 선택하지 않았을 때 --%>
<c:if test="${param.listSido ne '--선택--' and param.listGugun eq '--선택--'}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE sido = ? AND dong LIKE CONCAT('%',?,'%')  
		<sql:param value="${param.listSido}"/>
		<sql:param value="${param.keyword}"/>
	</sql:query>
</c:if>
	
<%--시도도 선택하고 구군도 선택한 경우 --%>	
<c:if test="${param.listSido ne '--선택--' and param.listGugun ne '--선택--'}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE sido = ? AND gugun = ? AND dong LIKE CONCAT('%',?,'%')
		<sql:param value="${param.listSido}"/>
		<sql:param value="${param.listGugun}"/>
		<sql:param value="${param.keyword}"/>
	</sql:query>
</c:if>	
	
<result>
	<c:forEach items="${rs.getRows()}" var="row">
		<record>
			<zipcode>${row.zipcode}</zipcode>
			<sido>${row.sido}</sido>
			<gugun>${row.gugun}</gugun>
			<dong>${row.dong}</dong>
			<bunji>${row.bunji}</bunji>
		</record>
	</c:forEach>
</result>	
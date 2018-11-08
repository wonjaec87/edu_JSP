<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<sql:setDataSource driver="org.mariadb.jdbc.Driver" 
   url="jdbc:mariadb://192.168.56.4:3306/test" user="root" 
   password="121213" var="conn" />

<!-- 시도 구군 모두 선택 안할때 -->
<c:if test="${empty(param.listSido) && empty(param.listGugun)}">
   <sql:query dataSource="${conn}" var="rs"
      sql="SELECT zipcode,sido,gugun,dong,bunji FROM zipcode WHERE dong LIKE CONCAT('%',?,'%')">
      <sql:param value="${param.keyword }"/>
</sql:query>
</c:if>

<!-- 시도 선택 & 구군 선택 안할때 -->
<c:if test="${empty(param.listGugun)}">
   <sql:query dataSource="${conn}" var="rs"
      sql="SELECT zipcode,sido,gugun,dong,bunji FROM zipcode WHERE sido = ? AND dong LIKE CONCAT('%',?,'%')">
         <sql:param value="${param.listSido }"/>
         <sql:param value="${param.keyword }"/>
   </sql:query>
</c:if>

<!-- 시도 구군 모두 선택 -->
<c:if test="${not(empty(param.listSido)) && not(empty(param.listGugun))}">
   <sql:query dataSource="${conn}" var="rs"
      sql="SELECT zipcode,sido,gugun,dong,bunji FROM zipcode WHERE sido = ? AND gugun = ? AND dong LIKE CONCAT('%',?,'%')">
         <sql:param value="${param.listSido }"/>
         <sql:param value="${param.listGugun }"/>
         <sql:param value="${param.keyword }"/>
   </sql:query>
</c:if>

<result>
   <c:forEach items="${rs.getRows() }" var="row">
      <record>
         <zipcode>${row.zipcode}</zipcode>
         <sido>${row.sido}</sido>
         <gugun>${row.gugun}</gugun>
         <dong>${row.dong}</dong>
         <bunji>${row.bunji}</bunji>
      </record>
   </c:forEach>
</result>
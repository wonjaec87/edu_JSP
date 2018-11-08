<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="DBDRIVER" value="org.mariadb.jdbc.Driver" scope="page" />
<c:set var="DBURL" value="jdbc:mariadb://192.168.56.4/world" scope="request" />
<c:set var="DBUSER" value="root" scope="session" />
<c:set var="DBPWD" value="javamariadb" scope="application" />

<jsp:forward page="setdemo4.jsp" />
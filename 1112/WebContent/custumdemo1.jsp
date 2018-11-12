<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="easy" uri="/WEB-INF/tlds/ccc.tld" %>
<h1> 속성이있는 SimpleTag</h1>


<easy:dataFormatter header="states" items="Alaska, Alabama, Geogia, California" />
<easy:dataFormatter header="">
	<jsp:attribute name="items" >
		Korea, Japan, China, United State America, United Kingdom
	</jsp:attribute>
	</easy:dataFormatter>
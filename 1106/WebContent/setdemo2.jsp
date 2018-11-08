<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="pb" class="com.example.libs.ProductBean" />
<c:set target="${pb}" property="name" value="신라면" />
<c:set target="${pb}" property="price" value="1000" />

<ul>
	<li>상품 이름 : <jsp:getProperty property="name" name="pb"/></li>
	<li>상품 가격 : ${pb.price}</li>
</ul>
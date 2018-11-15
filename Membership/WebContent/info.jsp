<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<c:set var="member" target="${member}" value="${sc.selectMember(sessionScope.userid)}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>IT 전문 쇼핑몰 EXAMPLE.COM에 오신 것을 환영합니다.</title>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$('#btnZipsearch').click(function(){
				var win1 = window.open('/Membership/zipsearch.jsp', '_blank', 'left=1000,top=100,width=800,height=800');
			});
			$("#btnHome").click(function(){
				location.href = "index.html";
			});
		});
	</script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<style type="text/css">
		.jumbotron {
			background-image:url("images/main.jpg");
			color:#fff;
		}
		input[type='text'], input[type='email']{
			padding-left:10px;
		}
		ul > li { padding : 3px 0px;}
	</style>
</head>
<body>
	<div class="container">
	<div class="jumbotron">
		<h1 class="display-3">안녕하세요!</h1>
		<p class="lead">IT 전용 쇼핑몰 EXAMPLE.COM에서 새로운 경험을 맛보세요.</p>
		<hr class="my-4">
		<p>쇼핑몰의 새 강자 EXAMPLE.COM이 해결하겠습니다.</p>
	</div>
	<h1>${sessionScope.username}(${sessionScope.userid})님! 정보</h1>
	<form action="/Membership/update.jsp" method="post" name="myform">
		<ul>
			<li>Email : <input type="email" name="email" value="${member.getEmail()}" required="required" size="40"></li>
			<c:if test="${fn:length(member.getZipcode()) eq 7}">
				<li>Zippost : 
				<input type="text" name="zippost1" 
					value="${fn:substring(member.getZipcode(), 0, 3)}" readonly="readonly" size="5"> - 
				<input type="text" name="zippost2" 
					value="${fn:substring(member.getZipcode(), 4, 7)}" readonly="readonly" size="5">
					<input type="button" id="btnZipsearch" value="우편번호검색"></li>
			</c:if>
			<c:if test="${fn:length(member.getZipcode()) eq 1}">
				<li>Zippost : 
				<input type="text" name="zippost1" readonly="readonly" size="5"> - 
				<input type="text" name="zippost2" readonly="readonly" size="5">
					<input type="button" id="btnZipsearch" value="우편번호검색"></li>
			</c:if>
			<li>Address : <input type="text" name="address1" value="${member.getAddress1()}" readonly="readonly" size="50"></li>
			<li>Address1 : <input type="text" value="${member.getAddress2()}" name="address2"></li>
			<li><button type="submit"  class="btn btn-info btn-lg">수정하기</button>&nbsp;&nbsp;
				<button type="reset" class="btn btn-success btn-lg">다시하기</button>&nbsp;&nbsp;
				<button type="button" id="btnHome" class="btn btn-primary btn-lg">홈으로</button></li>
		</ul>
	</form>
	</div>
</body>
</html>
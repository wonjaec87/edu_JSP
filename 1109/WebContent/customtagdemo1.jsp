<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mylib" uri="/WEB-INF/tlds/mytld.tld" %>


  <h1>원하시는  날짜 시간 형식을 선택해주세요</h1>
  <form>
  	<input type="radio" name="type" value="kr">한국 <br />
  	<input type="radio" name="type" value="us">미국 <br />
  	<input type="radio" name="type" value="jp">일본 <br />
  	<input type="radio" name="type" value="cn">중국 <br />
  	<input type="radio" name="type" value="uk">영국 <br />
  	<input type="radio" name="type" value="fr">프랑스 <br />
  	<input type="radio" name="type" value="de">독일<br />
  	<input type="submit" value="전송" />
  	
  </form>
<!--  속성이 있고 body는 없는 tag -->
<hr size='2' color='blue' width='50%' />

지금은 <mylib:mystyle type="${param.type}" />
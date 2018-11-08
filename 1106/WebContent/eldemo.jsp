<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" %>

  <%--   ${ answer = "Hellow world"; ''}
    
    ${answer} --%>
    
    ${ result = (a,b) -> a+b ;''} 
    ${result(4,8)}
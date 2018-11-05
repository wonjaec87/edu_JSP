<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap" %>
<%
	//Map 계열
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("박찬호", "야구선수");
	map.put("손홍민", "축구선수");
	map.put("김연경", "배구선수");
	map.put("문경은", "농구선수");
	session.setAttribute("PLAYER", map);
%>
${param.name} ----> ${PLAYER[param.name]}
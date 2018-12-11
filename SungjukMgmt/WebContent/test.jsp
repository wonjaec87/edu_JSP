<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.example.dao.SqlSessionFactoryBean" %>
<%
	SqlSession sqlSession = SqlSessionFactoryBean.getInstance();
	out.println(sqlSession);
%>    
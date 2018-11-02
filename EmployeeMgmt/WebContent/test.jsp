<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<%@ page import="com.example.libs.model.EmployeeDTO" %>
<jsp:useBean id="select" class="com.example.libs.controller.SelectController" />
<%
	Vector<EmployeeDTO> vector = select.select();
%>    
<result>
	<code>success</code>
	<data>
		{
			"count" : <%=vector.size()%>,
			"message" : "Hello, World"
		}
	</data>
</result>
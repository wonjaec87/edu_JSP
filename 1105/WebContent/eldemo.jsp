<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL(Expression Language)
	1. JSP2.0/JSTL1.0 규약에서 소개된 기술
	2. ECMAScipt(JavaScript)와 Xpath의 개념을 도입
	3. EL에서는 .과 ['']은 같은 개념이다.    ${expresss.a} --> ${express["a"]}
	4. NULL에 관대하고, 자동형변환을 제공한다.
	5. <%=7 %>  ${7}
	6. EL에서는 <% %>, <%! %>, <%= %> 사용불가
	7. 표현방법
	   ${object.propertyName}  or ${object["propertyName"]}
	   <%=member.getName() %>
	   <jsp:getProperty name="member" property="name" />
	   ${member.name}









 --%>
<%-- Num1 : <%=request.getParameter("num1") %><br />
Num2 : <%=request.getParameter("num2") %><br /> --%>

<%-- Num1 : ${param.num1}<br />
Num2 : ${param["num2"]} --%>

<%-- <%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
%>
<%=num1 %> + <%=num2 %> = <%=num1 + num2 %> --%>

<%-- ${param.num1} + ${param.num2} = ${param.num1 + param.num2} --%>

<%-- <%=	request.getHeader("user-agent") %> --%>
${header["user-agent"]}









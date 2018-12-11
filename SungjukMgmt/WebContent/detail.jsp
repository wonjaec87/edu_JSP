<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.vo.StudentVO" %>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List" %>
<jsp:useBean id="dao" class="com.example.dao.StudentDaoImpl" />
<%
	String hakbun = request.getParameter("hakbun");
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("hakbun", hakbun);
	dao.read(map);
	List<StudentVO> list = (List<StudentVO>)map.get("result");
	StudentVO student = list.get(0);
%>
{
	"code" : "success",
	"data" : <%=student %>
}
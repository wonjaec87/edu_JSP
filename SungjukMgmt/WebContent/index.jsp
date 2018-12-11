<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.example.dao.SqlSessionFactoryBean" %>
<%@ page import="java.util.List, com.example.vo.StudentVO" %>
<%@ page import="java.util.Map, java.util.HashMap" %>
<jsp:useBean id="dao" class="com.example.dao.StudentDaoImpl" />

<%
	Map<String, Object> map = new HashMap<String, Object>();
	dao.readAll(map);
	List<StudentVO> list = (List<StudentVO>)map.get("results"); 
	String str = "";
	for(StudentVO studentVo : list){
		str += studentVo.toString() + ",";
	}
	if(str.length() > 0) str = str.substring(0, str.length() - 1);
%>  
{
	"code" : "success",
	"data" : [<%=str %>]
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.vo.StudentVO" %>
<jsp:useBean id="dao" class="com.example.dao.StudentDaoImpl" />
<jsp:useBean id="std" class="com.example.vo.StudentVO">
	<jsp:setProperty name="std" property="*" />
</jsp:useBean>
<%
	calc(std);
	dao.update(std);
	response.sendRedirect("/SungjukMgmt/");
%>

<%!
	private void calc(StudentVO studentVo){
		int sum = studentVo.getKor() + studentVo.getEng() + studentVo.getMat() + studentVo.getEdp();
		double avg = sum / 4.;
		char grade = (avg <= 100 && avg >= 90) ? 'A' :
								(avg < 90 && avg >= 80) ? 'B' :
									(avg < 80 && avg >= 70) ? 'C' :
										(avg < 70 && avg >= 60) ? 'D' : 'F';
		studentVo.setSum(sum);
		studentVo.setAvg(avg);
		studentVo.setGrade(grade);
	}
%>
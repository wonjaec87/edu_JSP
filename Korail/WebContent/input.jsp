<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.libs.model.KorailDTO" %>
<jsp:useBean id="insert" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="calc" class="com.example.libs.controller.CalcController" /> 

<%
   String tsc = request.getParameter("tsc");
   String pcode = request.getParameter("pcode");
   String pn = request.getParameter("pn");
   String hcode = request.getParameter("hcode");
   
   KorailDTO kor = new KorailDTO(tsc, pcode, pn, hcode);
   //calc.calc(kor);
   int row = insert.insert(kor);
   if(row == 1){
%>
   <script>
      alert("Insert Success");
      location.href = "list.jsp";
   </script>
<% }else{ %>
   <script>
      //alert("Data Insert Failure");
      history.back();
   </script>
<% } %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.example.libs.model.KorailDTO" %>
<jsp:useBean id="select" class="com.example.libs.controller.SelectController" />
<jsp:useBean id="kodto" class="com.example.libs.model.KorailDTO" />
<%
String tsc = request.getParameter("tsc");
String pcode = request.getParameter("pcode");
String pn =request.getParameter("pn");
String hcode = request.getParameter("hcode");
   int count = 0;
   Vector<KorailDTO> vector = select.select();
   KorailDTO emp = new KorailDTO(tsc, pcode, pn, hcode);
   if(vector == null) count = 0;
   else count = vector.size();
   
%>   
<!DOCTYPE html>
<link rel="stylesheet" href="css/style.css" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>금일 지역별 예약 현황</title>
</head>
<h1> 금일 지역별 예약 현황 </h1>
<body>
<hr />

<table border=1>
   <% if(emp.getPlace() == "대구 "){ %>
   <caption><지역 = 대구></caption>
   <thead>
      <tr>
         <th>번호</th><th>지역</th><th>성별</th><th>열차명</th><th>좌석</th><th>할증종류</th><th>할인액</th><th>차비</th>
      </tr>
   </thead>
   <tbody>
   <% 
               for(int i = 0 ; i < count ; i++){   
                  KorailDTO ko = vector.elementAt(i);
         %>
            <tr> 
               <td><%=ko.getNum() %></td>
               <td><%=String.format("%,d", ko.getPlace()) %></td> 
               <td><%=String.format("%,d", ko.getGender()) %></td>
               <td><%=String.format("%,d", ko.getTname()) %></td>
               <td><%=String.format("%,d", ko.getSeat()) %></td>
               <td><%=String.format("%,d", ko.getHcode()) %></td>
               <td><%=String.format("%,d", ko.getDiscount()) %></td>
               <td><%=String.format("%,d", ko.getCarfee()) %></td>
            </tr>      
          <%  } %>
          <%  } %>
   </tbody>
</table>
<%-- label>  지역 차비의 합 = <%= %></label>

<table border=1>
   <% if(emp.getPlace() == "서울 "){ %>
   <caption><지역 = 서울></caption>
   <thead>
      <tr>
         <th>번호</th><th>지역</th><th>성별</th><th>열차명</th><th>좌석</th><th>할증종류</th><th>할인액</th><th>차비</th>
      </tr>
   </thead>
   <tbody>
   <% 
               for(int i = 0 ; i < count ; i++){   
                  KorailDTO ko = vector.elementAt(i);
         %>
            <tr> 
               <td><%=ko.getNum() %></td>
               <td><%=String.format("%,d", ko.getPlace()) %></td> 
               <td><%=String.format("%,d", ko.getGender()) %></td>
               <td><%=String.format("%,d", ko.getTname()) %></td>
               <td><%=String.format("%,d", ko.getSeat()) %></td>
               <td><%=String.format("%,d", ko.getHcode()) %></td>
               <td><%=String.format("%,d", ko.getDiscount()) %></td>
               <td><%=String.format("%,d", ko.getCarfee()) %></td>
            </tr>      
          <%  } %>
          <%  } %>
   </tbody>
</table>
<label>  지역 차비의 합 = <%= %></label>


<table border=1>
   <% if(emp.getPlace() == "부산 "){ %>
   <caption><지역 = 부산></caption>
   <thead>
      <tr>
         <th>번호</th><th>지역</th><th>성별</th><th>열차명</th><th>좌석</th><th>할증종류</th><th>할인액</th><th>차비</th>
      </tr>
   </thead>
   <tbody>
   <% 
               for(int i = 0 ; i < count ; i++){   
                  KorailDTO ko = vector.elementAt(i);
         %>
            <tr> 
               <td><%=ko.getNum() %></td>
               <td><%=String.format("%,d", ko.getPlace()) %></td> 
               <td><%=String.format("%,d", ko.getGender()) %></td>
               <td><%=String.format("%,d", ko.getTname()) %></td>
               <td><%=String.format("%,d", ko.getSeat()) %></td>
               <td><%=String.format("%,d", ko.getHcode()) %></td>
               <td><%=String.format("%,d", ko.getDiscount()) %></td>
               <td><%=String.format("%,d", ko.getCarfee()) %></td>
            </tr>      
          <%  } %>
          <%  } %>
   </tbody>
</table>
<label>  지역 차비의 합 = <%= %></label>

<table border=1>
   <% if(emp.getPlace() == "광주 "){ %>
   <caption><지역 = 광주></caption>
   <thead>
      <tr>
         <th>번호</th><th>지역</th><th>성별</th><th>열차명</th><th>좌석</th><th>할증종류</th><th>할인액</th><th>차비</th>
      </tr>
   </thead>
   <tbody>
   <% 
               for(int i = 0 ; i < count ; i++){   
                  KorailDTO ko = vector.elementAt(i);
         %>
            <tr> 
               <td><%=ko.getNum() %></td>
               <td><%=String.format("%,d", ko.getPlace()) %></td> 
               <td><%=String.format("%,d", ko.getGender()) %></td>
               <td><%=String.format("%,d", ko.getTname()) %></td>
               <td><%=String.format("%,d", ko.getSeat()) %></td>
               <td><%=String.format("%,d", ko.getHcode()) %></td>
               <td><%=String.format("%,d", ko.getDiscount()) %></td>
               <td><%=String.format("%,d", ko.getCarfee()) %></td>
            </tr>      
          <%  } %>
          <%  } %>
   </tbody>
</table>
<label>  지역 차비의 합 = <%= %></label> --%>
</body>
</html>
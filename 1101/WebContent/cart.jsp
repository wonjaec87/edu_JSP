<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Mall</title>
</head>
<body>
	<jsp:include page="menu.html" />
	<% 
	request.setCharacterEncoding("utf-8");
	String item = request.getParameter("item");
	String type = request.getParameter("type");
	Vector<String> cart = null;
	if( item != null){
		cart = (Vector<String>)session.getAttribute("mycart");
		if(cart == null){ //세션이 처음 만들어졌다면
		cart = new Vector<String>(1,1);
		cart.addElement(item);
		session.setAttribute("mycart", cart);
		}else{
			if(type.equals("add")) cart.addElement(item);
			else if(type.equals("remove")) cart.removeElement(item);
		}
	}
	%>
	<% if(cart != null){ %>
	<h2> 현재 Cart에 <%= cart.size() %> 개의 cd가 담겨있습니다.</h2>
	<ol>
		<% for(int i =0; i < cart.size(); i++){ %>
		<li><%= cart.elementAt(i) %></li>
		<%} %>
	</ol>
	<%} %>
	<% if(cart != null && cart.size() > 0){ %>
	<hr />
	<jsp:include page="remove.jsp" />
	<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>구구단</title>
	</head>
	<body>
	<h1>구구단</h1>
	<table border="1">
	<thead>
	<tr>
		<% for(int i=2; i< 10; i++){ %>
		<th><%= i %> 단 </th>
		<% } %>
		</tr>
		</thead>
		<tbody>
		<tr>
			<% for(int i=2; i< 10; i++){ %>
			<td>
			<% for(int j=1; j< 10; j++){ %>
				<%=i%> x <%= j %> = <%= i*j %><br />
				<% } %>
				</td>
				<% } %>
		</tbody>
		</table>
	</body>
</html>
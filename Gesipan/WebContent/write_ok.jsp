<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<fmt:requestEncoding value="utf-8" />
<%
	String saveDirectory = application.getRealPath(".") + "/files";
	int maxPostSize = 1024 * 1024 * 10;   //10MB
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, 
				maxPostSize, "utf-8", new DefaultFileRenamePolicy());
	
	gesipan.setName(mr.getParameter("name"));
	gesipan.setPasswd(mr.getParameter("passwd"));
	gesipan.setEmail(mr.getParameter("email"));
	String title = mr.getParameter("title");
	title = title.replace("<", "&lt;");
	title = title.replace(">", "&gt;");
	title = title.replace("'", "''");   //single quotation --> single single quotation
	gesipan.setTitle(title);
	
	String contents = mr.getParameter("contents");
	contents = contents.replace("<", "&lt;");
	contents = contents.replace(">", "&gt;");
	contents = contents.replace("'", "''");
	contents = contents.replace("\r\n", "<br />");
	gesipan.setContents(contents);
	
	String filename = mr.getFilesystemName("filename");
	if(filename == null) filename = "";
	gesipan.setFilename(filename);
%>
<c:set var="row" value="${ic.insert(gesipan)}" />
<c:if test="${row eq 1}">
	<script>
		//alert("Insert Success");
		location.href = "index.html";
	</script>
</c:if>
<c:if test="${row ne 1}">
	<script>
		//alert("Insert Failure");
		history.back();
	</script>
</c:if>








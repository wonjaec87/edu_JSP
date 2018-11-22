<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.io.BufferedInputStream" %>
<%@ page import="java.io.FileInputStream, java.io.BufferedOutputStream" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String filename = sc.getFilename(idx); //실제로 유저가 다운로드받을 파일이름
	String filename1 = request.getParameter("filename");
	String saveDirectory = application.getRealPath(".") + "/files";
	File file = new File(saveDirectory, filename);
	if(file.exists()){
		response.setHeader("Content-Disposition", "attachment;filename=" + filename1 + ";");
		BufferedInputStream bis = null;
		bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = null;
		bos = new BufferedOutputStream(response.getOutputStream());
		byte [] buffer = new byte[512];
		int count = 0;
		while((count = bis.read(buffer)) > 0){
			bos.write(buffer, 0, count);
		}
		bis.close();
		bos.close();
	}else{  //파일이 없다면
%>
	<script>
		alert("파일이 없습니다.");
		history.back();
	</script>
<% } %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

User Address : ${pageContext.request.remoteAddr}<br />
<%-- pageContext.getRequest().getRemoteAddr() --%>
User Method : ${pageContext.request.method }<br />
User Method : ${pageContext["request"].method }<br />
User Method : ${pageContext["request"]["method"] }
<%-- pageContext.getRequest().getMethod() --%>

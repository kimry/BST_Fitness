<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
UsersDto user = (UsersDto)request.getSession().getAttribute("login");

String content = (String)request.getAttribute("content");
System.out.println(content);
%>
<jsp:include page="menu.jsp" flush="false"/>
<jsp:include page="<%=content %>" flush="false"/>

<%
String msg = (String)request.getParameter("msg");
System.out.println(msg);
if(msg!=null)
{
	%>
	<script>
	alert("<%= msg%>");
	</script>
	<%
}
%>
</body>
</html>
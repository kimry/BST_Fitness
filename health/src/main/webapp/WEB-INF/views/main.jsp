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
String id = user.getId();
%>
<p>main</p>
<a href="moveTrainnerList.do">TrainnerList</a>
<a href="moveMypage.do">My page</a>
<a href="qnalist.do">Q&A</a>
</body>
</html>
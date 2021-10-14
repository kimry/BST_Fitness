<%@page import="java.util.ArrayList"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerList page</title>
</head>
<%
ArrayList<TrainnersDto> trainnerList = (ArrayList<TrainnersDto>)request.getAttribute("trainnerList");
%>
<body>
<div align="center">
<table>
	<%
	for(var i=0;i<=trainnerList.size()/4;i++)
	{
		%>
		<tr>
		<%
		for(var j=i*4;j<(i+1)*4;j++)
		{
			%>
			<td></td>
			<%
		}
		for(var j=i*4;j<(i+1)*4;j++)
		{
			%>
			<td>
			이름 : <%=trainnerList.get(j).getName() %><br>
			 : <%=trainnerList.get(j).getField() %>
			</td>
			<%
		}
		%>
		</tr>
		<%
	}
	%>
	<tr>
	</tr>
</table>
</div>
</body>
</html>
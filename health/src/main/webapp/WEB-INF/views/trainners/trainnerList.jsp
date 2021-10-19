<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerList page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%
List<TrainnersDto> trainnerList = (List<TrainnersDto>)request.getAttribute("trainnerList");
%>
<body>
<div align="center">
<p>TrainnerList Page</p>
<table border="1">
<tr>
<%
for(int i=0;i<trainnerList.size();i++)
{
	
	%>
	<td>
	<img class="trainner" id="<%=trainnerList.get(i).getTid() %>" src="resources/images/trainer/<%=trainnerList.get(i).getTid() %>.jpg" width="200px" height="200px" onerror="this.src='resources/images/trainer/null.jpg'"><br>
	이름 : <%=trainnerList.get(i).getName()%><br>
	분야 : <%=trainnerList.get(i).getField()==1?"pt트레이너":"필라테스" %>
	</td>
	<%
	if(i%4==3&&i!=0&&i!=trainnerList.size()-1)
	{
		%>
		</tr>
		<tr>
		<%
	}
}
%>
</tr>
</table>
</div>
<script type="text/javascript">
$('.trainner').click(function() {
	location.href="moveTrainnerView.do?tid="+this.id;
});
</script>
</body>
</html>
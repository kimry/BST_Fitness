<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.ReviewsDto"%>
<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerView Page</title>
</head>
<body>
<%
UsersDto user = (UsersDto)session.getAttribute("login");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
List<ReviewsDto> reviewList = (List<ReviewsDto>)request.getAttribute("reviewList");
%>
<div align="center">
<p>TrainnerView Page</p>
<table border="1">
	<tr>
		<td><img src="resources/images/trainer/<%=trainner.getTid() %>.jpg" width="400px" height="400px" onerror="this.src='resources/images/trainer/null.jpg'"></td>
	</tr>
	<tr>
		<td>
		이름 : <%= trainner.getName()%><br><br>
		분야 : <%= trainner.getField()==1?"pt트레이너":"필라테스"%><br><br>
		양력 :<br><%= trainner.getCareer().replace("\n","<br>")%><br><br>
		한마디 :<br><%= trainner.getContent().replace("\n","<br>")%><br><br>
		</td>
	</tr>
</table>
<table>
	<col width="400px">
	<tr>
		<td align="right"><input type="button" value="리뷰작성" onclick="moveReviewWrite()"></td>
	</tr>
</table>
<br>
<p>Reply Page</p>
<table border="1">
	<col><col width="400px"><col><col><col><col><col>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>평점</th>
		<th>추천</th>
		<th>비추천</th>
	</tr>
	<%
	for(int i=0;i<reviewList.size();i++)
	{
		%>
		<tr>
			<td><%=reviewList.get(i).getRnum() %></td>
			<td><a href="moveReviewView.do?rnum=<%=reviewList.get(i).getRnum()%>"><%=reviewList.get(i).getTitle() %></a></td>
			<td><%=reviewList.get(i).getMid() %></td>
			<td><%=reviewList.get(i).getWdate() %></td>
			<td><%=reviewList.get(i).getGrade() %></td>
			<td><%=reviewList.get(i).getRcm() %></td>
			<td><%=reviewList.get(i).getOps() %></td>
		</tr>
		<%
	}
	%>
</table>
</div>
<script type="text/javascript">
function moveReviewWrite(){
	<%
	if(user.getAuth()==2)
	{
		%>
		alert("트레이너는 리뷰를 남길 수 없습니다.");
		return false;
		<%
	}
	else
	{
		%>
		location.href="moveReviewWrite.do?tid=<%=trainner.getTid()%>";
		<%
	}
	%>
}
</script>
</body>
</html>
<%@page import="com.one.health.dto.ReviewsDto"%>
<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainer");
MembersDto member = (MembersDto)request.getAttribute("member");
ReviewsDto review = (ReviewsDto)request.getAttribute("review");
%>
<div align="center">
<p>ReviewWrite Page</p>
<table border="1">
	<tr>
		<th>제목</th>
		<td><input type="text" value="<%=review.getTitle()%>" size="48"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" value="<%=member.getName() %>"></td>
	</tr>
	<tr>
		<th>트레이너</th>
		<td><input type="text" value="<%=trainner.getName() %>"></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><input type="text" value="<%=review.getWdate() %>"></td>
	</tr>
	<tr>
		<th>평점</th>
		<td><a><%=review.getGrade() %></a>
		</td>
	</tr>
	<tr>
		<th>리뷰</th>
		<td><textarea name="content" cols="50" rows="14"><%=review.getContent() %></textarea>
	</tr>
</table>
<br>
<input type="button" value="돌아가기" onclick="rtnTrainnerView()">
<table>
	<tr>
		<td>
		<input type="button" value="추천" onclick="upRcm()">
		<input type="button" value="비추천" onclick="upOps()">
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
function rtnTrainnerView(){
	location.href="moveTrainnerView.do?tid=<%=review.getTid() %>";
}

function upRcm(){
	location.href="upRcm.do?rnum=<%=review.getRnum()%>";
}

function upOps(){
	location.href="upOps.do?rnum=<%=review.getRnum()%>";
}
</script>
</body>
</html>
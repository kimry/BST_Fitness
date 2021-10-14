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
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
%>
<div align="center">
<p>TrainnerView Page</p>
<table border="1">
	<tr>
		<td><img src="resources/images/<%=trainner.getTid() %>.jpg" width="400px" height="400px"></td>
	</tr>
	<tr>
		<td>
		이름 : <%= trainner.getName()%><br><br>
		분야 : <%= trainner.getField()==1?"pt트레이너":"필라테스"%><br><br>
		양력 : <%= trainner.getCareer()%><br><br>
		한마디 : <%= trainner.getContent()%><br><br>
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
</table>
</div>
<script type="text/javascript">
function moveReviewWrite(){
	location.href="moveReviewWrite()?tid=<%=trainner.getTid()%>";
}
</script>
</body>
</html>
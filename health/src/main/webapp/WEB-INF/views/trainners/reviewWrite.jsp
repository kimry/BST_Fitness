<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewWrite Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<%
UsersDto user = (UsersDto)session.getAttribute("login");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
%>
<script type="text/javascript">
function check(){
	if($('#title').val().trim().length==0)
	{
		alert("제목을 입력해주세요.");
		$('#title').focus();
	}else if($('#content').val().trim().length==0){
		alert("리뷰를 입력해주세요.");
		$('#content').focus();
	}else{
		return true;
	}
	return false;
}
</script>



<div align="center">
<p>ReviewWrite Page</p>
<form action="reviewWrite.do?tid=<%=trainner.getTid() %>&mid=<%=user.getId() %>" method="post" onsubmit="return check()">
<input type="hidden" value="<%=user.getName() %>">
<input type="hidden" value="<%=trainner.getName() %>">
<table border="1">
	<tr>
		<th>제목</th>
		<td><input type="text" id="title" name="title" size="48"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=user.getName() %></td>
	</tr>
	<tr>
		<th>트레이너</th>
		<td><%=trainner.getName() %></td>
	</tr>
	<tr>
		<th>평점</th>
		<td>
		<select id="grade" name="grade">
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5" selected>5점</option>
		</select>
		<a id="gradeText">꼭 다시 받고 싶어요!!</a>
		</td>
	</tr>
	<tr>
		<th>리뷰</th>
		<td><textarea id="content" name="content" cols="50" rows="14"></textarea>
	</tr>
</table>
<br>
<input type="submit" value="리뷰작성" >
<input type="button" value="돌아가기" onclick="rtn()">
</form>
</div>
<script type="text/javascript">
function rtn(){
	location.href="moveTrainnerView.do?tid=<%= trainner.getTid()%>";
}
$(document).ready(function(){
	$('#grade').on('change', function(){
		var num=Number($('#grade option:selected').val());
		if(num==1){
			$('#gradeText').text("다신 받기 싫어요!!");
		} else if(num==2){
			$('#gradeText').text("별로였어요!!");
		}else if(num==3){
			$('#gradeText').text("평범해요.");
		}else if(num==4){
			$('#gradeText').text("좋았어요!!");
		}else if(num==5){
			$('#gradeText').text("꼭 다시 받고 싶어요!!");
		}
	});
});
</script>
</body>
</html>
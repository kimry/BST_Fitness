<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
table.type1 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;

}

table.type1 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type1 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>
<%
UsersDto dto = (UsersDto)session.getAttribute("login");
if(dto == null){
%>
	<script type="text/javascript">
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>
<%
}
%>

<h1>글추가</h1>

<div align="center">

<form action="qnawriteAf.do" method="post" onsubmit="return check()">

<table class="type1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50px" value="<%=dto.getId() %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50px" id="content" name="content"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="글쓰기" id="writeSuccess">
	</td>	
</tr>

</table>

</form>


</div>

<script type="text/javascript">
function check(){
	if($('#title').val().trim().length==0){
		alert("제목을 입력해주세요.");
		$('#title').focus();
	}else if($('#content').val().trim().length==0){
		alert("내용을 입력해주세요.");
		$('#content').focus();
	}else{
		return true;
	}
	return false;
}
</script>

</body>
</html>
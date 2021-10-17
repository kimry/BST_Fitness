<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int qnum = (Integer)request.getAttribute("qnum");
QnaDto qna = (QnaDto)request.getAttribute("qna");
%>

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

<h2>부모글</h2>

<div align="center">

<table class="type1">
<col width="200"><col width="500">
<tr>
	<th>작성자</th>
	<td><%=qna.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=qna.getTitle() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=qna.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=qna.getReadcount() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="15" cols="80" readonly="readonly"><%=qna.getContent() %></textarea>
	</td>
</tr>
</table>
</div>

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

<h2>답글</h2>
<div align="center">
<form action="qnaanswerAf.do" method="post" onsubmit="return check()">
<input type="hidden" name="qnum" value="<%=qna.getQnum() %>">
<table class="type1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50" readonly="readonly" value="<%=dto.getId()%>">
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
		<input type="submit" id="qnaanswer" value="답글작성완료">
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
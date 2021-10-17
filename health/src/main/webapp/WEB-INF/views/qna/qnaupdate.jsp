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
</head>
<body>

<h2>글 수정</h2>

<div align="center">
<form action="qnaupdateAf.do" method="post" onsubmit="return check()">
<input type="hidden" name="qnum" value="<%=qna.getQnum() %>">
<table border="1">
<col width="200px"><col width="400px">
<tr>
	<th>작성자</th>
	<td><%=qna.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" size="100" value="<%=qna.getTitle() %>">
	</td>
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
	<th>정보</th>
	<td><%=qna.getRef() %>-<%=qna.getDepth() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="19" cols="90" id="content" name="content"><%=qna.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="글수정">
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
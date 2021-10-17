<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
QnaDto qna = (QnaDto)request.getAttribute("qna");
UsersDto user = (UsersDto)request.getAttribute("user");
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

<h2>상세 글 보기</h2>

<div align="center">

<table class="type1">


<tr>
	<th>작성자</th>
	<td><%=qna.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=qna.getTitle().replaceAll("\"", "&#34;") %></td>
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
		<textarea rows="15" cols="90" readonly="readonly"><%=qna.getContent() %></textarea>
	</td>
</tr>

</table>

<button type="button" class="btn btn-info" onclick="location.href='qnalist.do'">글목록</button>
<%
if(user.getAuth() == 2){
%>
	<button type="button" onclick="answerQna(<%=qna.getQnum() %>)">답글</button>
<%
}
%>

<%
if(qna.getId().equals( dto.getId() )){
	%>
	<button type="button" onclick="updateQna(<%=qna.getQnum() %>)">수정</button>	
	<button type="button" onclick="deleteQna(<%=qna.getQnum() %>)">삭제</button>
	<%
}
%>

</div>

<br><br><br><br>

<script type="text/javascript">
function answerQna(qnum) {
	location.href = "moveQnaAnswer.do?qnum=" + qnum;
}
function updateQna(qnum) {	
	location.href = "qnaupdate.do?qnum=" + qnum;
}
function deleteQna(qnum) {
	location.href = "qnadelete.do?qnum=" + qnum;
}
</script>






</body>
</html>
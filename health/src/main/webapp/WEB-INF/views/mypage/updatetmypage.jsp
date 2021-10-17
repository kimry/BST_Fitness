<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
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
	text-align: left;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>

<h1>트레이너 수정페이지</h1>

<div align="center">
<form action="UpdateTrainnerAf.do" method="post">
<input type="hidden" name="tid" value="<%=trainner.getTid() %>">
<table class="type1">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="id" name="id" size="50px" value="<%=user.getId()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>비밀번호</th>
	<td>
		<input type="password" id="pw" name="pw" size="50px" value="<%=user.getPw()%>" >
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" id="name" name="name" size="50px" value="<%=user.getName()%>">
	</td>
</tr>
<tr>
	<th>나이</th>
	<td>
		<input type="text" id="age" name="age" size="50px" value="<%=user.getAge()%>">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text" id="email" name="email" size="50px" value="<%=user.getEmail()%>">
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>
		<input type="text" id="phone" name="phone" size="50px" value="<%=user.getPhone()%>">
	</td>
</tr>
<tr>
	<th>field</th>
	<td>
		<select name="field" id="sel">
			<option value="0">선택해주세요</option>
			<option value="1">PT Trainner</option>
			<option value="2">FL Trainner</option>
		</select>
	</td>
</tr>
<tr>
	<th>career</th>
	<td>
		<textarea rows="10" cols="50px" id="career" name="career"><%=trainner.getCareer()%></textarea>
	</td>
</tr>
<tr>
	<th>content</th>
	<td>
		<textarea rows="10" cols="50px" id="content" name="content"><%=trainner.getCareer()%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="수정완료" id="updateSuccess">
	</td>
</tr>

</table>
</form>
</div>

<script>
$(document).ready(function(){
	if(<%=trainner.getField()%> == 1){
		$("#sel").val("1").prop("selected", true);
	}else if(<%=trainner.getField()%> == 2){
		$("#sel").val("2").prop("selected", true);
	}else{
		$("#sel").val("0").prop("selected", true);
	}
	
  $("#updateSuccess").mouseover(function(){
    if($("#pw").val().trim() == "" ){
    	alert('비밀번호를 입력해 주세요');
    	$("#pw").focus();
    }else if($("#name").val().trim() == "" ){
    	alert('이름을 입력해 주세요');
    	$("#name").focus();
    }else if($("#age").val().trim() == "" ){
    	alert('나이를 입력해 주세요');
    	$("#age").focus();
    }else if(isNaN($("#age").val().trim()) == true ){
    	alert('나이를 숫자로만 입력해 주세요');
    	$("#age").focus();
    }else if($("#email").val().trim() == "" ){
    	alert('이메일 주소를 입력해 주세요');
    	$("#email").focus();
    }else if($("#phone").val().trim() == "" ){
    	alert('휴대전화 번호를 입력해 주세요');
    	$("#phone").focus();
    }else if($("#field").val().trim() == "" ){
    	alert('field를 입력해 주세요');
    	$("#field").focus();
    }else if($("#career").val().trim() == "" ){
    	alert('career를 입력해 주세요');
    	$("#career").focus();
    }else if($("#content").val().trim() == "" ){
    	alert('content를 입력해 주세요');
    	$("#content").focus();
    }
  });
  $("#updateSuccess").click(function(){
	    
	  $.cookie("userId", $("#id").val().trim(), { expires:7, path:'./' });
	  alert('수정이 완료 되었습니다');

	  });
});
</script>


</body>
</html>
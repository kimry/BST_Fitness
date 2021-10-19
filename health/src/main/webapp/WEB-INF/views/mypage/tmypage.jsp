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

<h1>트레이너 마이페이지</h1>

<div align="center">

<table class="type1">

<tr>
	<th>사진</th>
	<td><img src="resources/images/trainer/<%=trainner.getTid() %>.jpg" width="400px" height="400px" onerror="this.src='resources/images/trainer/null.jpg'" ><br>
         <form action="upload.do" method="post" enctype="multipart/form-data">
         	<input type="file" name="fileload">  
         	<input type="submit" value="업로드">
         </form>
     </td>
	
</tr>
<tr>
	<th>아이디</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getId()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getName()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>나이</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getAge()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>이메일</th>
	<td>
		<input type="text"  size="50px" value="<%=user.getEmail()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td>
		<input type="text" size="50px" value="<%=user.getPhone()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>field</th>
	<td>
		<%if(trainner.getField() == 1){
		%>
		<input type="text" size="50px" value="PT Trainner" readonly="readonly">
		<%
		}else if(trainner.getField() == 2){
		%>
		<input type="text" size="50px" value="FL Trainner" readonly="readonly">
		<%
		}else{
		%>
		<input type="text" size="50px" value="수정해 주세요" readonly="readonly">
		<%
		}
		%>
	</td>
</tr>
<tr>
	<th>career</th>
	<td>
		<textarea rows="10" cols="50px" readonly="readonly"><%=trainner.getCareer()%></textarea>
	</td>
</tr>
<tr>
	<th>content</th>
	<td>
		<textarea rows="10" cols="50px" readonly="readonly"><%=trainner.getContent()%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" onclick="updateTrainner('<%=user.getId() %>')">정보수정</button>
	</td>
</tr>

</table>

</div>

<script type="text/javascript">
function updateTrainner(id){

    let password = prompt('비밀번호를 입력해주세요.');
    if(password==="<%=user.getPw()%>"){
  	 	alert('인증 되었습니다');
		location.href = "moveUpdateTrainner.do?id="+id;
    } else {
		alert('인증에 실패 했습니다');
		location.href = "moveTrainerMypage.do";
    }
    
}

</script>


</body>
</html>
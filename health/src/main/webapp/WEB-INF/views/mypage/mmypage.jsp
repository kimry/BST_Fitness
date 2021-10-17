<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
MembersDto member = (MembersDto)request.getAttribute("member");
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

<h1>고객 마이페이지</h1>

<div align="center">

<table class="type1">

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
	<th>퍼스널트레이닝 포인트</th>
	<td>
		<input type="text" size="50px" value="<%=member.getPtpoint()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>필라테스 포인트</th>
	<td>
		<input type="text" size="50px" value="<%=member.getFlpoint()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>RENT</th>
	<td>
		<input type="text" size="50px" value="<%=member.getRent()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="button" onclick="updateMember('<%=user.getId() %>')">정보수정</button>
	</td>
</tr>

</table>

</div>

<script type="text/javascript">
function updateMember(id){

    let password = prompt('비밀번호를 입력해주세요.');
    if(password==="<%=user.getPw()%>"){
  	 	alert('인증 되었습니다');
		location.href = "moveUpdateMember.do?id="+id;
    } else {
		alert('인증에 실패 했습니다');
		location.href = "moveMemberMypage.do";
    }
    
}

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
String msg = (String)request.getAttribute("msg");
if(msg!=null)
{
	System.out.println(msg);
	%>
	<script type="text/javascript">
	alert("똑같은 아이디가 존재합니다.");
	</script>
	<%
}
%>
<script type="text/javascript">
</script>


<div align="center">
<p>SignUp page</p>
<form action="signup.do" method="post" onsubmit="return check()">
<table border="1">
	<tr>
		<th>ID</th>
		<td><input type="text" id="id" name="id"></td>
	</tr>
	<tr>
		<th>PW</th>
		<td><input type="password" id="pw" name="pw"></td>
	</tr>
	<tr>
		<th>PW확인</th>
		<td><input type="password" id="pwc"></td>
	</tr>
	<tr>
		<th>회원종류</th>
		<td><select name="auth">
				<option value="1">고객</option>
				<option value="2">트레이너</option>
			</select></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" name="name"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="text" id="age" name="age"></td>
	</tr>
	<tr>
		<th>e-mail</th>
		<td><input type="text" id="email" name="email"></td>
	</tr>
	<tr>
		<th>phone</th>
		<td><input type="text" id="phone" name="phone"></td>
	</tr>
</table>
<input type="submit" value="회원가입">
<input type="button" value="돌아가기" onclick="moveLogin()">
</form>
</div>
<script type="text/javascript">
function moveLogin(){
	location.href = "moveLogin.do";
}
function check(){
	if($('#id').val().trim().length==0){
		alert("ID를 입력해주세요.");
		$('#id').focus();
	} 
	else if($('#pw').val().trim().length==0){
		alert("PW를 입력해주세요.");
		$('#pw').focus();
	}else if($('#pw').val()!==$('#pwc').val()){
		alert("PW가 서로 다릅니다.");
		$('#pw').focus();
	}else if($('#name').val().trim().length==0){
		alert("이름을 입력해주세요.");
		$('#age').focus();
	}else if($('#age').val().trim().length==0){
		alert("나이를 입력해주세요.");
		$('#age').focus();
	}else if(isNaN($('#age').val())){
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
	}else if($('#email').val().trim().length==0){
		alert("e-mail을 입력해주세요.");
		$('#email').focus();
	}else if($('#phone').val().trim().length==0){
		alert("전화번호를 입력해주세요.");
		$('#phone').focus();
	}else{
		return true;
	}
	return false;
}
</script>
</body>
</html>
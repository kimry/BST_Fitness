<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp page</title>
</head>
<body>
<div align="center">
<p>SignUp page</p>
<form action="signup.do" method="post">
<table border="1">
	<tr>
		<th>ID</th>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<th>PW</th>
		<td><input type="password" name="pw"></td>
	</tr>
	<tr>
		<th>PW확인</th>
		<td><input type="password"></td>
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
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<th>e-mail</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<th>phone</th>
		<td><input type="text" name="phone"></td>
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
</script>
</body>
</html>
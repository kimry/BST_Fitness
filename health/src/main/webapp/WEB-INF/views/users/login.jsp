<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid;
	padding: 10px;	
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
</head>
<body>

<h2>login page</h2>

<div class="center">

<form action="login.do" method="post">

<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="id" name="id" size="20"><br>
		<input type="checkbox" id="chk_save_id">save id
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="login">
		<button type="button" onclick="signup">회원가입</button>
	</td>
</tr>

</table>
</form>
</div>

<script type="text/javascript">
function signup() {
	location.href = "member?param=signup";
}
/*
	session : java -> server 회원정보, 방문회수 = Object
	cookie : javascript -> client id저장 = String
*/

let user_id = $.cookie("userId");
if(user_id != null){
	$("#id").val( user_id );
//	$("#chk_save_id").attr("checked", "checked");
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function() {
//	alert('check click');	
	if( $("#chk_save_id").is(":checked") ){
		
		if( $("#id").val().trim() == "" ){
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);
		}
		else{
			$.cookie("userId", $("#id").val().trim(), { expires:7, path:'./' });	
		}		
	}
	else{
		$.removeCookie("userId", { path:'./' });
	}
});

</script>


</body>
</html>












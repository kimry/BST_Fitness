<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>SignUp page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
body{
	font-size: 14px;
	background: rgb(219,226,226);
}
.center{
	position: absolute;
	top: 20%;
	left: 38%;
	transform: traslate(-50%,-50%);
	width: 500px;
	height: 650px;
	background: white;
	border-radius: 15px;
	box-shadow: 12px 12px 22px grey;
}
.signup-container{

	width: 100%;
}
h1{
	text-align: center;
	margin-bottom: 30px;
	margin-top: 30px;
}
.btn1{
	border: none;
	outline: none;
	height: 30px;
	width: 200px;
	background-color: black;
	color: white;
	border-radius: 4px;
	font-weight: bold;
}
.btn1:hover {
	background: white;
	border: 1px solid;
	color: black;
}
span{
	width: 28%;
}

</style>

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

<div class="center">
<div class="signup-container d-flex align-items-center justify-content-center">
	<form class="singup-form" action="signup.do" method="post" onsubmit="return check()">
		<h1>SIGN UP</h1>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
  			<input type="text" id="id" name="id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
  			<input type="password" id="pw" name="pw" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">비밀번호확인</span>
  			<input type="password" id="pwc" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<select class="form-select mb-3" aria-label="Default select example" name="auth">
  			<option selected>회원유형 선택</option>
  			<option value="1">고객</option>
  			<option value="2">트레이너</option>
		</select>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
  			<input type="text" id="name" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">나이</span>
  			<input type="text" id="age" name="age" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">e-mail</span>
  			<input type="text" id="email" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		<div class="input-group mb-3">
  			<span class="input-group-text" id="inputGroup-sizing-default">phone</span>
  			<input type="text" id="phone" name="phone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		</div>
		
		<div class="row">
			<div class="col-lg-6">
				<input type="submit" value="회원가입" class="btn1 mt-3 mb-2 p-1" style="height:50px">
			</div>
			<div class="col-lg-6">
				<input type="button" value="돌아가기" onclick="moveLogin()" class="btn1 mt-3 mb-2 p-1" style="height:50px">
			</div>
		</div>

	</form>

</div>
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
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

<title>login</title>

<style type="text/css">
*{
	padding-top:15px;
	margin: 0;
	box-sizing: border-box;
}
body{
	background: rgb(219,226,226);
}
.row{
	background: white;
	border-radius: 30px;
	box-shadow: 12px 12px 22px grey;
}
img{
	margin-top:70px;
}
.btn1{
	border: none;
	outline: none;
	height: 50px;
	width: 100%;
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
.btn2{
	border: none;
	outline: black;
	height: 50px;
	width: 58.5%;
	background-color: white;
	color: black;
	border-radius: 4px;
	font-weight: bold;
}
.btn2:hover {
	background: black;
	border: 1px solid;
	color: white;
}
</style>

</head>
<body>

	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-8 px-5">
					<img alt="그림없음" src="./resources/images/login.jpg" class="img-fluid">
				</div>
				<div class="col-lg-4 pt-5" style="width:200;">
					<h1 class="font-weight-bold py-3">Login</h1>
					<h4>Sign into your account</h4>
					<form action="login.do" method="post">
						<div class="form-row">
							<div class="col-lg-7">
								<input type="text" id="id" name="id" placeholder="Userid" class="form-control my-2 p-2">
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<input type="password" name="pw" placeholder="Password" class="form-control my-2 p-2">
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<input type="checkbox" id="chk_save_id">  SAVE ID
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<input type="submit" value="login" class="btn1 mt-3 mb-2 p-2">
							</div>
						</div>
						<button type="button" class="btn2 mt-3 mb-5 p-2" onclick="signup()">회원가입</button>
					</form>
				</div>
			</div>
	
		</div>
	
	</section>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

<script type="text/javascript">
function signup() {
	location.href = "moveSignup.do";
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












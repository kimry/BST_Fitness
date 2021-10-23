<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버쉽 예약 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<style type="text/css">

.container{
width: 1000px;
margin-top: 100px;
padding-left: 0;
}

#header{
border-top: 2px solid #000;
width: 1000px;
font-size: 20px;
margin: 0;
padding: 0;
bs-gutter-x: 1.5rem;
}

.membership_title strong{
font-size: 3rem;
}
.membership_title p {
	margin-top:5px;
	font-size; 1.4rem;
}
.submit{
width: 1000px;
}

#selector{
border-bottom: 2px solid #000;
margin-top:5px;
border-top:1px solid #D5D5D5;
}
table.type1 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-bottom: 1px solid #000000;

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
	text-align: center;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>
<%
UsersDto user = (UsersDto)request.getSession().getAttribute("login");
%>

<div class="container">
<form action ="membership.do" method="post">
	<div class="membership_title">
		<strong>회원권 등록</strong>
			<p>회원권 등록 페이지입니다.
	</div>

	<div class="row" id="header" align="center">
		<div class="col">기간<br></div>
		<div class="col">PT여부<br></div>
		<div class="col">횟수<br></div>
	</div>
	<div class="row" id="selector" align="center">
		<div class="col" ><br>
			<input type="hidden" name="mbsId" value="<%=user.getId() %>">
			<input type="hidden" name="mbsName" value="<%=user.getName() %>">
			<select class="list-group" id = "time" name="time" size="3"  style="height:231px; width: 220px; text-align:center;">
				<option class="list-group-item list-group-item-light active" data-bs-toggle="list" value = "0" selected>없음</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "1">1일권</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "2">1개월</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "3">3개월</option>	
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "4">6개월</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "5">1년</option>
			</select><br>
		</div>	
		<div class="col"><br>
			<select class="list-group" id="Todo" name = "Todo" size="3" style="height:231px; width: 220px; text-align:center;">
				<option class="list-group-item list-group-item-light active" data-bs-toggle="list" value = "0" selected>없음</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "1">PT</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "2">필라테스</option>
			</select><br>
		</div>
		<div class="col"><br>
			<select class="list-group" id="point" name = "point" size="3" style="height:231px; width: 220px; text-align:center;">
				<option class="list-group-item list-group-item-light active" data-bs-toggle="list" value = "0" selected>0회</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value ="1">10회</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value ="2">20회</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value ="3">30회</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value ="4">50회</option>
			</select>
		</div>
	</div>


<div class="container" id="submit" style="margin-top:30px;">
	<div class="row">
		<div class="col" align="center" style="font-size: 20px">
			<a><b>가격 : </b></a>&nbsp;<a id="priceText"><b>0</b></a>
			<input type="hidden" name="price" id="price" value="0" readonly="readonly"><br>
			<input type = "hidden" name="ptpoint" id= "ptpoint" value="0" readonly="readonly">
			<input type = "hidden" name="flpoint" id= "flpoint" value="0" readonly="readonly">
		</div>
		<div class="col" align="center">
			<button type="submit" class="btn btn-dark" align="right">선택완료</button>
		</div>
	</div>
</div>
</form>

</div>
<br><br><br><br>
<div align="center">
<table style="margin: auto; width: 1000px;">
<tr>
<td valign="top">
&nbsp;&nbsp;&nbsp;&nbsp;<b>헬스 회원권</b>
<table class="type1" border="1" style="margin: 20px; font-size: 16px;">
	<tr>
		<th>1일</th>
		<td>5,000원</td>
	</tr>
	<tr>
		<th>1개월</th>
		<td>50,000원</td>
	</tr>
	<tr>
		<th>3개월</th>
		<td>100,000원</td>
	</tr>
	<tr>
		<th>6개월</th>
		<td>200,000원</td>
	</tr>
	<tr>
		<th>1년</th>
		<td>300,000원</td>
	</tr>
</table>
</td>
<td valign="top">
&nbsp;&nbsp;&nbsp;&nbsp;<b>PT / 필라테스</b>
<table class="type1" border="1" style="margin: 20px; font-size: 16px;">
	<tr>
		<th>10회</th>
		<td>100,000원</td>
	</tr>
	<tr>
		<th>20회</th>
		<td>200,000원</td>
	</tr>
	<tr>
		<th>30회</th>
		<td>300,000원</td>
	</tr>
	<tr>
		<th>50회</th>
		<td>400,000원</td>
	</tr>

</table>
</td>
</tr>
</table>

<script type="text/javascript">
let ptpoint = 0;
let flpoint = 0;
let membershipprice = 0;
let ptprice = 0;
$(document).ready(function(){
	$('#time').on('change', function(){
	let time = $('#time option:selected').val();
		switch(time){
			case "0":
				membershipprice =  0;
				break;
			case "1":
				membershipprice = 5000;
				break;
			case "2":
				membershipprice = 50000;
				break;
			case "3":
				membershipprice = 100000;
				break;
			case "4":
				membershipprice = 200000;
				break;
			case "5":
				membershipprice = 300000;
				break;
		}	
		$("#price").val(ptprice + membershipprice); 
		$("#priceText").text(ptprice + membershipprice);
	});
	$('#Todo').on('change', function(){
		let point= $('#point option:selected').val();
		$("#point option:eq(0)").prop("selected", true);
		ptprice = 0;
		flpoint = 0;
		ptpoint = 0;
		$("#ptpoint").val(ptpoint);
		$("#flpoint").val(flpoint);
		$("#price").val(ptprice + membershipprice); 
		$("#priceText").text(ptprice + membershipprice);
	});
	$('#point').on('change', function(){
		let point= $('#point option:selected').val();
		if($('#Todo').val()!=0){
			switch(point){
				case "0":
					ptprice = 0;
					flpoint = 0;
					ptpoint = 0;
					$("#priceText").text(ptprice + membershipprice);
					break;
				case "1":
					ptprice = 100000;
					if($('#Todo').val() == 1){
						ptpoint = 10;
						flpoint = 0;
					}
					else if($('#Todo').val() == 2){
						flpoint = 10;
						ptpoint = 0;
					} 
					break;
				case "2":
					ptprice = 200000;
					
					if($('#Todo').val() == 1){
						ptpoint = 20;
						flpoint = 0;
					}
					else if($('#Todo').val() == 2){
						flpoint = 20;
						ptpoint = 0;
					} 
					break;
				case "3":
					ptprice = 300000;
					if($('#Todo').val() == 1){
						ptpoint = 30;
						flpoint = 0;
					}
					else if($('#Todo').val() == 2){
						flpoint = 30;
						ptpoint = 0;
					} 
					break;
				case "4":
					ptprice = 400000;
					if($('#Todo').val() == 1){
						ptpoint = 50;
						flpoint = 0;
					}
					else if($('#Todo').val() == 2){
						flpoint = 50;
						ptpoint = 0;
					} 
					break;
			}
		}
		$("#ptpoint").val(ptpoint);
		$("#flpoint").val(flpoint);
		$("#price").val(ptprice + membershipprice); 
		$("#priceText").text(ptprice + membershipprice);
	});		
});


</script> 

</body>
</html>
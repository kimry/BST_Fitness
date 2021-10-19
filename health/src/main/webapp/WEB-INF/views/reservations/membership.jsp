<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Membership Reservation Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
UsersDto user = (UsersDto)request.getSession().getAttribute("login");
%>

<div align="center">
<h2>Membership Reservation</h2>
<form action ="membership.do" method="post">

<input type = "hidden" name="ptpoint" id= "ptpoint">
<input type = "hidden" name="flpoint" id= "flpoint">
<input type = "hidden" name="price" id= "price">

<table border="1">
<tr>
	<th>기간</th>
	<th>PT여부</th>
	<th>횟수</th>
</tr>
<tr>
	<td>
			<input type="hidden" name="mbsId" value="<%=user.getId() %>">
			<input type="hidden" name="mbsName" value="<%=user.getName() %>">
			<!-- <input type="text" name="id" value="1" size="20"> -->
			<select id = "time" name="time">
				<option value = "0">없음</option>
				<option value = "1">1일권</option>
				<option value = "2">한달</option>
				<option value = "3">3개월</option>	
				<option value = "4">6개월</option>
				<option value = "5">1년</option>
			</select>
		</td> 

 	 <td>
		<select id="Todo" name = "Todo">
			<option value = "0">없음</option>
			<option value = "1">PT</option>
			<option value = "2">필라테스</option>
		</select>
	</td>
	<td>
		<select id="point" name = "point">
			<option value = "0">0회</option>
			<option value ="1">10회</option>
			<option value ="2">20회</option>
			<option value ="3">30회</option>
			<option value ="4">50회</option>
		</select>
		 
	</td> 
</tr>

</table>



<input type="submit" value="선택완료" >
</form>
</div>



<script type="text/javascript">
$(document).ready(function(){
	let ptpoint = 0;
	let flpoint = 0;
	let membershipprice = 0;
	let ptprice = 0;
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
		}); 
	
		$('#point').on('change', function(){
			let point= $('#point option:selected').val();
			switch(point){
			case "0":
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
			
			$("#ptpoint").val(ptpoint);
			$("#flpoint").val(flpoint);
		
			$("#price").val(ptprice + membershipprice); 
		});
		
		


});


</script> 

</body>
</html>
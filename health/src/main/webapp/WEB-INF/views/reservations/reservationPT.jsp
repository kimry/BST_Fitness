<%@page import="java.time.LocalDate"%>
<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)session.getAttribute("login");
MembersDto member = (MembersDto)request.getAttribute("member");
List<TrainnersDto> trainerList = (List<TrainnersDto>)request.getAttribute("pt");
List<TrainnersDto> pilatesList = (List<TrainnersDto>)request.getAttribute("pl");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT예약창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $.datepicker.setDefaults({
      dateFormat: 'yyyy-mm-dd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년',
   	  minDate: "+1D",
   	  onSelect: function (dateText, inst) {
   		  	console.log($('#ptdateR').val());
   		    console.log(dateText);
   			$('#ptdateR').val(dateText.substring(4,14)); 
   	  }
  });
  $(function() {
    $( "#ptdate" ).datepicker();
    
  });
  </script> 


<style type="text/css">

.PTReservation{
width: 1200px;
margin-top: 100px;
align:center;
margin-left: auto;
margin-right: auto;
}

#header{
border-top: 2px solid #000;
border-bottom: 2px solid #000;
width: 100%;
font-size: 20px;
}
.PTTitle strong{
font-size: 3rem;
}
.PTTitle p {
	margin-top:5px;
	font-size; 1.4rem;
}

#main{
margin-top: 10px;
margin-bottom: 10px;
font-size:20px;
}

#ptdate{
margin-bottom: 20px;
}

.PTTitle{
border-bottom: 2px solid #000;
}

#table{
border-top: 1px solid #D5D5D5;
border-bottom : 2px solid #000;
}


</style> 
</head>

<body>
<%
UsersDto dto = (UsersDto)session.getAttribute("login");
if(dto == null){
%>
   <script type="text/javascript">
   alert('로그인 해 주십시오');
   location.href = "login.jsp";
   </script>
<%
}
%>
<div class="PTReservation">
<form action="addPT.do?mid=<%=user.getId() %>" method="post">
	<div class="PTTitle">
		<strong>PT예약 페이지</strong>
		<p>멤버십 예약 페이지입니다.
	</div>
	<div class="row" id="main" align="center">
		<div class="col">분야</div>
		<div class="col">강사</div>
		<div class="col">날짜</div>
		<div class="col">시간</div>
	</div>
	<div class="row" id="table" align="center">
		<div class="col">
			<br><select class="list-group" id="field" name="field" size="3" style="height:295px; width: 220px; text-align:center;" >
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "1" selected>PT</option>
				<option class="list-group-item list-group-item-light" data-bs-toggle="list" value = "2">필라테스</option>
			</select> 
		</div>
		<div class="col" >
			<br><select class="list-group" id="tid" name="tid" size="3" style="height:295px; width: 220px; text-align:center;" >
			    <%for(int i=0;i<trainerList.size();i++){
			   		if(i==0)
			   		{%>
			   			<option class="list-group-item list-group-item-action" data-bs-toggle="list" value="<%=trainerList.get(i).getTid() %>" selected><%=trainerList.get(i).getName()%></option> 
			   		<%}
			   		else
			   		{
			   			%>
			   			<option class="list-group-item list-group-item-action" data-bs-toggle="list" value="<%=trainerList.get(i).getTid() %>"><%=trainerList.get(i).getName()%></option>	
			   			<%
			   		}
			    }%>
		    </select>  
		</div>
		<div class="col" >
			<br><div id="ptdate"></div> 
			<input type="hidden" id="ptdateR" name="ptdate" value="<%=LocalDate.now().plusDays(1)%>">
		</div>
		<div class="col" id="times" >
			<br><select class="list-group" id="times" name="times" size="10"  style="height:295px; width: 220px; text-align:center;">
			     <option class="list-group-item list-group-item-action " data-bs-toggle="list" value="6" selected>06:00</option>
			     <%
				    for(int j=7;j<10;j++){ 
				    %>
						<option class="list-group-item list-group-item-action" data-bs-toggle="list" value="<%=j%>">0<%=j%>:00</option>
					<%
					}
					for(int k=10;k<22;k++)
					{ 
					%>
						 <option class="list-group-item list-group-item-action" data-bs-toggle="list" value="<%=k%>"><%=k%>:00</option>
					<%
				}%> 
	    	</select>
	    </div>
	</div>
<br>

<br>
<div class="container">
	<div class="row" id="point">
		<div class="col" style="font-size: 17px; text-align: left; margin-left: 150px; ">
			<a><b>잔여 PT 포인트 : <%=member.getPtpoint() %></b></a><br>
			<a><b>잔여 필라테스 포인트 : <%=member.getFlpoint() %></b></a>
		</div>
		<div class="col" align="center" style="margin-left: 0; padding-left: 0">
			<button type="submit" class="btn btn-dark">예약완료</button>
		</div>
	</div>
</div>
</form>
</div>


<script type="text/javascript">
/*
$("#ptdate").datepicker({
    onSelect: function() { 
    	console.log($(this).datepicker('getDate'));
        $('#ptdateR').val($(this).datepicker('getDate')); 
    }
});
*/
function rtnmin(){
	return date.toISOString().substring(0,10);
}
$(document).ready(function(){
	$('#field').on('change', function(){
		var num=Number($('#field option:selected').val());
		$("#tid").children('option').remove();
		if(num==1){
			<%for(int i=0;i<trainerList.size();i++){
		   		if(i==0)
		   		{%>
		   		var option = $("<option class='list-group-item list-group-item-action' data-bs-toggle='list' value='<%=trainerList.get(i).getTid() %>' selected><%=trainerList.get(i).getName() %></option>");
		    	$('#tid').append(option);
		   		<%}
		   		else
		   		{
		   			%>
		   			var option = $("<option class='list-group-item list-group-item-action' data-bs-toggle='list' value='<%=trainerList.get(i).getTid() %>'><%=trainerList.get(i).getName() %></option>");
			    	$('#tid').append(option);
		   			<%
		   		}
		    }%>
		} else if(num==2){
			<%for(int i=0;i<pilatesList.size();i++){
		   		if(i==0)
		   		{%>
			   		var option = $("<option class='list-group-item list-group-item-action' data-bs-toggle='list' value='<%=pilatesList.get(i).getTid() %>' selected><%=pilatesList.get(i).getName() %></option>");
			    	$('#tid').append(option);
		   		<%}
		   		else
		   		{
		   			%>
		   			var option = $("<option class='list-group-item list-group-item-action' data-bs-toggle='list' value='<%=pilatesList.get(i).getTid() %>'><%=pilatesList.get(i).getName() %></option>");
			    	$('#tid').append(option);	
		   			<%
		   		}
		    }%>
		}
	});
});
</script>

</body>
</html>
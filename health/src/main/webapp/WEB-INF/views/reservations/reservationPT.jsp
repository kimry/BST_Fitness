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
<form action="addPT.do?mid=<%=user.getId() %>" method="post">
<table border="1">
<col><col width="100">
<tr>
   <th colspan="4">예약</th>
</tr>
<tr>
   <th>분야</th>
   <th>강사</th>
   <th>날짜</th>
   <th>시간</th>
</tr>
<tr>   

	<th>
    <select id="field">
    	<option value="1">PT</option>
    	<option value="2">필라테스</option>
    </select>
    </th>
   
    <th>
    <select id="tid" name="tid">
    <%for(int i=0;i<trainerList.size();i++){
   		if(i==0)
   		{%>
   			<option value="<%=trainerList.get(i).getTid() %>" selected><%=trainerList.get(i).getName()%></option> 
   		<%}
   		else
   		{
   			%>
   			<option value="<%=trainerList.get(i).getTid() %>"><%=trainerList.get(i).getName()%></option>	
   			<%
   		}
    }%>
    </select>
    </th>
    
    <th>
    <input type="date" id="ptdate" name="ptdate" min="<%=LocalDate.now().plusDays(1)%>">
    </th>
   
    <th>
    <select name="time">
    <option value="6">06:00</option>
    <option value="7">07:00</option>
    <option value="8">08:00</option>
    <option value="9">09:00</option>
    <option value="10">10:00</option>
    <option value="11">11:00</option>
    <option value="12">12:00</option>
    <option value="13">13:00</option>
    <option value="14">14:00</option>
    <option value="15">15:00</option>
    <option value="16">16:00</option>
    <option value="17">17:00</option>
    <option value="18">18:00</option>
    <option value="19">19:00</option>
    <option value="20">20:00</option>
    <option value="21">21:00</option>
    </select>
    </th>

</tr>
</table>
<br>
<button type="submit">예약완료</button>
</form>

<a>잔여 PT 포인트 : <%=member.getPtpoint() %></a><br>
<a>잔여 필라테스 포인트 : <%=member.getFlpoint() %></a>
<script type="text/javascript">
date = new Date();
date.setDate(date.getDate()+1);
$('#ptdate').val(date.toISOString().substring(0,10));

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
		   		var option = $("<option value='<%=trainerList.get(i).getTid() %>' selected><%=trainerList.get(i).getName() %></option>");
		    	$('#tid').append(option);
		   		<%}
		   		else
		   		{
		   			%>
		   			var option = $("<option value='<%=trainerList.get(i).getTid() %>'><%=trainerList.get(i).getName() %></option>");
			    	$('#tid').append(option);
		   			<%
		   		}
		    }%>
		} else if(num==2){
			<%for(int i=0;i<pilatesList.size();i++){
		   		if(i==0)
		   		{%>
			   		var option = $("<option value='<%=pilatesList.get(i).getTid() %>' selected><%=pilatesList.get(i).getName() %></option>");
			    	$('#tid').append(option);
		   		<%}
		   		else
		   		{
		   			%>
		   			var option = $("<option value='<%=pilatesList.get(i).getTid() %>'><%=pilatesList.get(i).getName() %></option>");
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
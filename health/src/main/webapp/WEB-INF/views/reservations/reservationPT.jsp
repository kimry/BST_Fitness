<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)session.getAttribute("login");
List<TrainnersDto> trainerList = (List<TrainnersDto>)request.getAttribute("pt");
List<TrainnersDto> pilatesList = (List<TrainnersDto>)request.getAttribute("pl");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT예약창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
table {
  width: 80%;
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
<form action="addPT.do?mid=<%=user.getId() %>" method="post">
<table border="1">
<tr>
   <th colspan="4">예약</th>
</tr>
<tr>
   <th height="80">종목</th>
   <th>선생님</th>
   <th>날짜</th>
   <th>시간</th>
</tr>
<tr>   

   <th height="400">
   <button type="button" id="health" onclick="getTrainer()">헬스</button><br><br>
   <button type="button" id="pilates" onclick="getPilates()">필라테스</button>
   </th>
   
   <th>
   <select id="tid" name="tid" size="10">
   <%for(int i=0;i<trainerList.size();i++){%>
   <option value="<%=trainerList.get(i).getTid() %>"><%=trainerList.get(i).getName()%></option> 
   <%}%>
   </select>
   </th>
   
   <th>
   <input type="date" name="ptdate" value="sysdate">
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
<button type="button" onclick="location.href='trainnerList.jsp'">트레이너리스트</button>
<button type="button" onclick="location.herf='main.jsp'">메인화면</button>

<script type="text/javascript">
function getTrainer(){
   $("#tid").children('option').remove();
   <%
   for(int i=0;i<trainerList.size();i++)
   {
      %>
      var option = $("<option value='<%=trainerList.get(i).getTid() %>'><%=trainerList.get(i).getName() %></option>");
      $('#tid').append(option);
      <%
   }
   %>
}
function getPilates(){
   $("#tid").children('option').remove();
   <%
   for(int i=0;i<pilatesList.size();i++)
   {
      %>
      var option = $("<option value='<%=pilatesList.get(i).getTid() %>'><%=pilatesList.get(i).getName() %></option>");
      $('#tid').append(option);
      <%
   }
   %>
}
</script>

</body>
</html>
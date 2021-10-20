<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerList page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<style type="text/css">
img{
margin-left: 18px;
margin-right: 18px;
margin-top:18px;
}

</style>
</head>
<%
List<TrainnersDto> trainnerList = (List<TrainnersDto>)request.getAttribute("trainnerList");
%>
<body>
<div align="center">
<h1>트레이너 리스트</h1>
<div class=container>
	<div class=row>
	<%
	for(int i=0;i<trainnerList.size();i++)
	{
		%>
		<div class="col">
			<div class="card" style="width: 18rem;">
			  <img class="card-img-top" src="/trainer/<%=trainnerList.get(i).getTid() %>.jpg" style="width:250px;height:250px" height= alt="Card image cap" onerror="this.src='resources/images/trainer/null.jpg'">
			  <div class="card-body">
			    <p class="card-text">
			 	 <p>이름 : <%=trainnerList.get(i).getName()%></p>
			    <p>분야 : <%=trainnerList.get(i).getField()==1?"pt트레이너":"필라테스" %></p>
			    <button class="btn btn-dark" onclick="moveView()" id="<%=trainnerList.get(i).getTid() %>" >자세히 보기</button>
			  </div>
			</div>
		</div>
		<%
		if(i%4==3)
		{
			%>
			</div>
			<div class='row'>
		
			<% 
		}
	}
	for(int i=trainnerList.size()%4;i<4;i++)
	{
		%>
		<div class="col">
			<div style="width: 18rem;">
			</div>
		</div>
		<%
	}
	%>
	</div>
</div>


<script type="text/javascript">
$('.btn').click(function()  {
	location.href="moveTrainnerView.do?tid="+this.id;
});


</script>

</body>
</html>
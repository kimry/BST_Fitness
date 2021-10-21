<%@page import="com.one.health.dto.ReviewsDto"%>
<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="./css/reviewView.css">
</head>
<body>
<%
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainer");
MembersDto member = (MembersDto)request.getAttribute("member");
ReviewsDto review = (ReviewsDto)request.getAttribute("review");
%>

<div class="Rboard_wrap">
	<div class="Rboard_title">
		<strong>리뷰 페이지</strong>
		<p>좋은 리뷰는 저희 BST 센터의 발전에 큰 도움이 됩니다.</p>
	</div>
	<div class="Rboard_write_wrap">
		<div class="Rboard_write">
			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd><%=review.getTitle().replaceAll("\"", "&#34;") %></dd>
				</dl>
			</div>
			<div class="info">
				<dl>
					<dt>아이디</dt>
					<dd><%=member.getName() %></dd>
				</dl>
				<dl>
					<dt>트레이너</dt>
					<dd><%=trainner.getName() %></dd>
				</dl>
				<dl>
					<dt>작성일</dt>
					<dd><%=review.getWdate() %></dd>
				</dl>
				<dl>
					<dt>평점</dt>
					<dd><%=review.getGrade() %></dd>
				</dl>
				<dl>
					<dt>추천</dt>
					<dd><%=review.getRcm() %></dd>
				</dl>
				<dl>
					<dt>비추천</dt>
					<dd><%=review.getOps() %></dd>
				</dl>
				
			</div>
			<div class="cont">
				<textarea id="content" readonly="readonly" name="content" cols="50" rows="14"><%=review.getContent() %></textarea>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col" align="left"> 
			<input type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" value="돌아가기" onclick="rtnTrainnerView()">
		</div>
		<div class="col" align="right">
		<input type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" value="추천" onclick="upRcm()">
		<input type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" value="비추천" onclick="upOps()">
		</div>
	</div>
</div>


<script type="text/javascript">
function rtnTrainnerView(){
	location.href="moveTrainnerView.do?tid=<%=review.getTid() %>";
}

function upRcm(){
	location.href="upRcm.do?rnum=<%=review.getRnum()%>";
}

function upOps(){
	location.href="upOps.do?rnum=<%=review.getRnum()%>";
}
</script>
</body>
</html>
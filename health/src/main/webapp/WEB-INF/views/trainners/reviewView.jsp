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

<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: inherit;
}

.Rboard_wrap {
    width: 1000px;
    margin: 100px auto;
}

.Rboard_title {
    margin-bottom: 30px;
    font-size: 12px;
}

.Rboard_title strong {
    font-size: 35px;
}

.Rboard_title p {
    margin-top: 5px;
    font-size: 17px;
}


.Rboard_list {
    width: 100%;
    border-top: 2px solid #000;
}

.Rboard_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.Rboard_list > div.top {
    border-bottom: 1px solid #999;
}

.Rboard_list > div:last-child {
    border-bottom: 1px solid #000;
}

.Rboard_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 16px;
}

.Rboard_list > div.top > div {
    font-weight: 600;
}

.Rboard_list .num {
    width: 10%;
}

.Rboard_list .title {
    width: 60%;
    text-align: left;
}

.Rboard_list .top .title {
    text-align: center;
}

.Rboard_list .writer {
    width: 10%;
}

.Rboard_list .date {
    width: 10%;
}

.Rboard_list .count {
    width: 10%;
}

.Rboard_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.Rboard_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
}

.Rboard_page a.bt {
    padding-top: 10px;
    font-size: 15px;
    letter-spacing: -1px;
}

.Rboard_page a.num {
    padding-top: 9px;
    font-size: 15px;
}

.Rboard_page a.num.on {
    border-color: #000;
    background: #000;
    color: #fff;
}

.Rboard_page a:first-child {
    border-left: 1px solid #ddd;
}

.Rboard_view {
    width: 100%;
    border-top: 2px solid #000;
}

.Rboard_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.Rboard_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.Rboard_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.Rboard_view .info dl:first-child {
    padding-left: 0;
}

.Rboard_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.Rboard_view .info dl:first-child::before {
    display: none;
}

.Rboard_view .info dl dt,
.Rboard_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}


.Rboard_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.Rboard_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.Rboard_write {
    border-top: 2px solid #000;
}

.Rboard_write .title,
.Rboard_write .info {
    padding: 15px;
}

.Rboard_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.Rboard_write .title dl {
    font-size: 0;
}

.Rboard_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.Rboard_write .title dt,
.Rboard_write .title dd,
.Rboard_write .info dt,
.Rboard_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 17px;
}

.Rboard_write .title dt,
.Rboard_write .info dt {
    width: 100px;
}

.Rboard_write .title dd {
    width: calc(100% - 100px);
}

.Rboard_write .title input[type="text"],
.Rboard_write .info input[type="text"],
.Rboard_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.Rboard_write .title input[type="text"] {
    width: 80%;
}

.Rboard_write .cont {
    border-bottom: 1px solid #000;
}

.Rboard_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}
</style>
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
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewWrite Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

<style type="text/css">
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

.board_wrap {
    width: 1000px;
    margin: 100px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 35px;
}

.board_title p {
    margin-top: 5px;
    font-size: 17px;
}


.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 16pxrem;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 10%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 15px;
}

.board_page a.num.on {
    border-color: #000;
    background: #000;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}

.board_view {
    width: 100%;
    border-top: 2px solid #000;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}


.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #000;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    
    font-size: 0;
}
.board_write #info2 {
    border-bottom: 2px solid #000;
    
    font-size: 0;
}
.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 17px;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
}

.board_write .cont textarea {
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
UsersDto user = (UsersDto)session.getAttribute("login");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
%>
<script type="text/javascript">
function check(){
	if($('#title').val().trim().length==0)
	{
		alert("제목을 입력해주세요.");
		$('#title').focus();
	}else if($('#content').val().trim().length==0){
		alert("리뷰를 입력해주세요.");
		$('#content').focus();
	}else{
		return true;
	}
	return false;
}
</script>





<form action="reviewWrite.do?tid=<%=trainner.getTid() %>&mid=<%=user.getId() %>" method="post" onsubmit="return check()">
<input type="hidden" value="<%=user.getName() %>">
<input type="hidden" value="<%=trainner.getName() %>">
<div class="board_wrap">
<div class="board_title">
	<strong>리뷰 작성</strong>
	<p>좋은점과 개선점을 솔직하게 작성해주세요.</p>
</div>

	<div class="board_write">
		<div class="title">
			<dl>
				<dt>제목</dt>
				<dd><input style="width: 885px;" type="text" placeholder="제목 입력" id="title" name="title"></dd>
			</dl>	
		</div>
		<div class="info">
			<dl>
				<dt>작성자</dt>
				<dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id" placeholder="글쓴이 입력" value="<%=user.getName() %>" readonly="readonly"></dd>
			</dl>	
		</div>
		<div class="info">
			<dl>
				<dt>트레이너</dt>
				<dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id" placeholder="글쓴이 입력" value="<%=trainner.getName() %>" readonly="readonly"></dd>
			</dl>	
		</div>
		<div class="info" id="info2">
			<dl>
				<dt>평점</dt>
				<dd>
				<select id="grade" name="grade" class="form-select-sm" aria-label="Default select example">
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5" selected>5점</option>					
				</select>
				<a id="gradeText">꼭 다시 받고 싶어요!!</a>
				</dd>
			</dl>	
		</div>
		<div class="cont">
        	<textarea placeholder="내용 입력" id="content" name="content" style="font-size: 15px;"></textarea>
        </div>
	</div>
	<div class="bt_wrap">
    	<input type="submit" value="글쓰기"  style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">
		<input type="button" value="돌아가기" onclick="rtn()" style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">
    </div>
  </div>
  </form>  

<script type="text/javascript">
function rtn(){
	location.href="moveTrainnerView.do?tid=<%= trainner.getTid()%>";
}
$(document).ready(function(){
	$('#grade').on('change', function(){
		var num=Number($('#grade option:selected').val());
		if(num==1){
			$('#gradeText').text("다신 받기 싫어요!!");
		} else if(num==2){
			$('#gradeText').text("별로였어요!!");
		}else if(num==3){
			$('#gradeText').text("평범해요.");
		}else if(num==4){
			$('#gradeText').text("좋았어요!!");
		}else if(num==5){
			$('#gradeText').text("꼭 다시 받고 싶어요!!");
		}
	});
});
</script>
</body>
</html>
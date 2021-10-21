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
<link rel="stylesheet" type="text/css" href="./css/reviewWrite.css">

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
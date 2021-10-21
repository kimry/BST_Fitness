<%@page import="com.one.health.dto.rDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.ReviewsDto"%>
<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainnerView Page</title>
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

.board_wrap {
    width: 800px;
    margin: 30px auto;
}

.board_title {
    margin-bottom: 15px;
    margin-top: 15px;
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
    font-size: 16px;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 5%;
}

.board_list .title {
    width: 45%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 16%;
}

.board_list .count {
    width: 8%;
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
    font-size: 15px;
}

.board_view .info dl dt {

}

.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 15px;
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
    border-bottom: 1px solid #000;
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
    font-size: 15px;
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
List<rDto> reviewList = (List<rDto>)request.getAttribute("reviewList");
%>

<div class="container mt-5">
	<div class="row">
		<div class="col" >
			
				<div id=view class="card" style="width:420px;">
	  			<img src="resources/images/trainer/<%=trainner.getTid() %>.jpg" style="width: 360px; height: 360px; margin: 7%"
	   					onerror="this.src='resources/images/trainer/null.jpg'" class="card-img-top" alt="...">
	  			<div class="card-body">
	    			<p class="card-text">   
	  			<div class="card-header" style="font-size:1.4rem;"><strong>소개</strong></div>    
				  <ul class="list-group list-group-flush">
				  <li class="list-group-item" style="font-size:1.4rem;">이름 : <%= trainner.getName()%></li>
				    <li class="list-group-item" style="font-size:1.4rem;">분야 : <%= trainner.getField()==1?"pt트레이너":"필라테스"%></li> 
				    <li class="list-group-item" style="font-size:1.4rem;">약력 : <%= trainner.getCareer().replace("\n","<br>")%></li>
				    <li class="list-group-item" style="font-size:1.4rem;">한마디 : <%= trainner.getContent().replace("\n","<br>")%></li>
				  </ul><br>
	  			</div>
				</div>			
		</div>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->		
		<div class="col">			
			<div class="board_wrap">
        <div class="board_title">
            <strong>트레이너 리뷰</strong>
            <p>마음껏 표현해 주세요 !!</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">작성자</div>
                    <div class="date">작성일</div>
                    <div class="count">평점</div>
                    <div class="count">추천</div>
                    <div class="count">비추천</div>
                </div>
                
                <%for(int i=0;i<reviewList.size();i++)
			{%>	
				<div>
                    <div class="num"><%=reviewList.get(i).getRnum() %></div>
                    <div class="title"><a href="moveReviewView.do?rnum=<%=reviewList.get(i).getRnum()%>"><%=reviewList.get(i).getTitle() %></a></div>
                    <div class="writer"><%=reviewList.get(i).getName() %></div>
                    <div class="date"><%=reviewList.get(i).getWdate().substring(0,10) %></div>
                    <div class="count"><%=reviewList.get(i).getGrade() %></div>
                    <div class="count"><%=reviewList.get(i).getRcm() %></div>
                    <div class="count"><%=reviewList.get(i).getOps() %></div>
               </div>  
                  <%
			}
			%>  
            </div>
			<button onclick="moveReviewWrite()" type="button" style="float:right; margin: 5px;" class="btn btn-dark">리뷰작성</button>
        </div>
    </div>			
		</div>
	</div>
	  
</div>

<script type="text/javascript">
function moveReviewWrite(){
	<%
	if(user.getAuth()==2)
	{
		%>
		alert("트레이너는 리뷰를 남길 수 없습니다.");
		return false;
		<%
	}
	else
	{
		%>
		location.href="moveReviewWrite.do?tid=<%=trainner.getTid()%>";
		<%
	}
	%>
}
</script>
</body>
</html>
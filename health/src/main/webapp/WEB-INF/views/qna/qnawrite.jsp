<%@page import="com.one.health.dto.UsersDto"%>
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
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


<style type="text/css">
* {
    margin: 0;
    padding: 0;
}

html {
    font-size: 12px;
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
    font-size: 3rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.4rem;
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
    font-size: 1.4rem;
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
    font-size: 1.4rem;
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
    font-size: 1.4rem;
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



<div class="board_wrap">
<form action="qnawriteAf.do" method="post" onsubmit="return check()">
        <div class="board_title">
            <strong>글쓰기</strong>
            <p>내용을 상세하게 써주시면 빠른 답변이 가능합니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input style="width: 885px;" type="text" placeholder="제목 입력" id="title" name="title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>아이디</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id" placeholder="글쓴이 입력" value="<%=dto.getId() %>" readonly="readonly"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" id="content" name="content" style="font-size: 15px;"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="글쓰기"  style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">
            </div>
        </div>
        </form>
    </div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

<script type="text/javascript">
function check(){
	if($('#title').val().trim().length==0){
		alert("제목을 입력해주세요.");
		$('#title').focus();
	}else if($('#content').val().trim().length==0){
		alert("내용을 입력해주세요.");
		$('#content').focus();
	}else{
		return true;
	}
	return false;
}
</script>

</body>
</html>
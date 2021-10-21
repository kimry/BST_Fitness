<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int qnum = (Integer)request.getAttribute("qnum");
QnaDto qna = (QnaDto)request.getAttribute("qna");
%>

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
<link rel="stylesheet" type="text/css" href="./css/qnaanswer.css">

</head>
<body>
<div class="container">
<div class="row">
<div class="col-lg-6">
<div class="board_wrap">
        <div class="board_title">
            <strong>상세글보기</strong>
            <p>답글을 위한 내용 입니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl style="margin-bottom: 27px;">
                        <dt>제목</dt>
                        <dd><%=qna.getTitle().replaceAll("\"", "&#34;") %></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>아이디</dt>
                        <dd><%=qna.getId() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=qna.getWdate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd><%=qna.getReadcount() %></dd>
                    </dl>
                </div>
                
                <div class="cont">
                    <textarea style="font-size: 17px;" readonly="readonly"><%=qna.getContent() %></textarea>
                </div>
            </div>
        </div>
    </div>
</div>
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
<div class="col-lg-6">
<div class="board_wrap">
<form action="qnaanswerAf.do?qnum=<%=qnum %>" method="post" onsubmit="return check()">
        <div class="board_title">
            <strong>답글</strong>
            <p>글에 대한 답변내용을 기재해 주세요.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input style="width: 475px; height: 37px; margin-bottom: 1px;" type="text"  id="title" name="title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>아이디</dt>
                        <dd><input style="height:30px; width:50px; margin-top:20px; margin-bottom:20px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=dto.getId() %>" readonly="readonly"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" id="content" name="content" style="font-size: 15px;"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="글쓰기" id="qnaanswer" style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">
            </div>
        </div>
        </form>
    </div>

</div>
</div>
</div>
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
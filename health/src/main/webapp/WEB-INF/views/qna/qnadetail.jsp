<%@page import="com.one.health.dto.UsersDto"%>
<%@page import="com.one.health.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
QnaDto qna = (QnaDto)request.getAttribute("qna");
UsersDto user = (UsersDto)request.getAttribute("user");
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
<link rel="stylesheet" type="text/css" href="./css/qnadetail.css">

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
        <div class="board_title">
            <strong>상세글보기</strong>
            <p>하단에 메뉴를 선택해주세요</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
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
            <div class="bt_wrap">
                <button type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" onclick="location.href='qnalist.do'">글목록</button>
						<%
						if (user.getAuth() == 2) {
						%>
						<button type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" onclick="answerQna(<%=qna.getQnum()%>)">답글</button>
						<%
						}
						%>

						<%
						if (qna.getId().equals(dto.getId())) {
						%>
						<button type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" onclick="updateQna(<%=qna.getQnum()%>)">수정</button>
						<button type="button" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark mt-1" onclick="deleteQna(<%=qna.getQnum()%>)">삭제</button>
						<%
						}
						%>
					</div>
        </div>
    </div>



<script type="text/javascript">
function answerQna(qnum) {
	location.href = "moveQnaAnswer.do?qnum=" + qnum;
}
function updateQna(qnum) {	
	location.href = "qnaupdate.do?qnum=" + qnum;
}
function deleteQna(qnum) {
	location.href = "qnadelete.do?qnum=" + qnum;
}
</script>






</body>
</html>
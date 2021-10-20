<%@page import="com.one.health.dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String search = (String)request.getAttribute("search");
if(search == null) search = "";
String choice = (String)request.getAttribute("choice");

int qnaPage = (int)request.getAttribute("qnaPage");
int pageNumber = (int)request.getAttribute("pageNumber");

List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnalist");	

System.out.println("search:"  +  search);
System.out.println("choice:"  +  choice);
System.out.println("qnaPage:"  +  qnaPage);
System.out.println("pageNumber:"  +  pageNumber);


%> 

<%!
// 댓글 깊이와 image를 추가하는 함수
public String arrow(int depth){
	String rs = "<img src='./resources/images/arr.png' width='20px' height='20px'>";
	String nbsp = "&nbsp;&nbsp;&nbsp;";			
	
	String ts = "";
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0 ? "":ts + rs;
}

public String dot3(String title){
	String str = "";
	if(title.length() >= 30){
		str = title.substring(0,30);
		str += "...";
	}else{
		str = title;
	}
	
	return str;
}
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
    margin: 50px auto;
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

<script type="text/javascript">
$(document).ready(function() {
	// 검색어가 있는 경우
	let search = "<%=search %>";
	if(search == "") return;
	
	// select 처리
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");	
});
</script>

</head>
<body>

<div class="board_wrap">
        <div class="board_title">
            <strong>Q&A게시판</strong>
            <p>궁금하신 점 글로 작성해주시면 답변 드립니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">작성자</div>
                    <div class="count">조회수</div>
                </div>
                <%
				if(list == null || list.size() == 0){ 
				%>
				<div>
                    <div class="num"> - </div>
                    <div class="title"><a href="view.html">작성된 글이 업습니다.</a></div>
                    <div class="writer"> - </div>
                    <div class="count"> - </div>
                </div>
				<%
				}else{
					
					for(int i = 0;i < list.size(); i++){
						QnaDto qna = list.get(i);
				%>
					<div>
                    <div class="num"><%=(i + 1) %></div>
                    <%
								if(qna.getDel() == 0){
									%>
                    <div class="title"><%=arrow( qna.getDepth() ) %><a href="qnadetail.do?qnum=<%=qna.getQnum() %>">&nbsp;&nbsp;<%=dot3(qna.getTitle()) %></a></div>
                    <%
								}else{
									%>
					<div class="title"><font color="#c0c0c0">* 이 게시글은 삭제되었습니다 *</font></div>
						<%
								}
								%>
                    <div class="writer"><%=qna.getId() %></div>
                    <div class="count"><%=qna.getReadcount() %></div>
               		 </div>
               		 <%
					}
				}
				%>
            </div>
            
            <div class="board_page">
            <% 
for(int i = 0;i < qnaPage; i++){
	if(pageNumber == i){	// 현재 페이지		1 [2] [3]
		%>
                <a href="#none" class="num on"><%=i + 1 %></a>
               	<%
	}
	else{					// 그 외의 페이지
		%> 
                <a href="#none" class="num" title="<%=i + 1 %>페이지" onclick="goPage(<%=i %>)"><%=i + 1 %></a>
		<%
	}
}
%>
            </div>
        </div>
    </div>

<div align="center" style="display: flex; justify-content:center; margin: 5px;">
<select id="choice" style="height:30px; vertical-align: middle" class="form-select-sm" aria-label="Default select example">
  <option value="title">제목</option>
  <option value="content">내용</option>
  <option value="id">작성자</option>
</select>
<input type="text" id="search" value="<%=search %>" style="height:30px">
<button type="button" onclick="searchQna()" style="height:30px; vertical-align: middle; font-size:13px;" class="btn btn-dark">검색</button>
</div>
<button type="button" onclick="gomoveQnawrite()" class="btn btn-dark" style="height:30px; display: flex; text-align: center; margin: auto;">글쓰기</button>




<script type="text/javascript">
$(function () {
	$(".titleTd").mouseover(function() {		
		$(this).css("background", "#e0e0e0");
	});
	$(".titleTd").mouseout(function() {
		$(this).css("background", "#ffffff");
	});	
});

function gomoveQnawrite(){
	location.href = "moveQnawrite.do";
}

function searchQna() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;

	location.href = "qnalist.do?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href = "qnalist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}

</script>



</body>
</html>
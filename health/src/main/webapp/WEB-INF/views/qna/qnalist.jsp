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

<link rel="stylesheet" type="text/css" href="./css/qnalist.css">


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
<section>
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
<button type="button" onclick="gomoveQnawrite()" class="btn btn-dark" style="height:30px; display: flex; text-align: center; margin: auto; font-size: 15px">글쓰기</button>

</section>


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
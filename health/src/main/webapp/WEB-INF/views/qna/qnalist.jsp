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

<div align="center">

<table border="1">
<col width="70px"><col width="550px"><col width="100px"><col width="100px">
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>

<%
if(list == null || list.size() == 0){
%>
	<tr>
		<td colspan="3" align="center">작성된 글이 없습니다</td>
	</tr>
<%
}else{
	
	for(int i = 0;i < list.size(); i++){
		QnaDto qna = list.get(i);
%>
		<tr>
			<th><%=(i + 1) %></th>
			
				<%
				if(qna.getDel() == 0){
					%>
					<td class="titleTd">						
					<%=arrow( qna.getDepth() ) %>				
					<a href="qnadetail.do?qnum=<%=qna.getQnum() %>"><%=dot3(qna.getTitle()) %></a>
					</td>
					<%
				}else{
					%>
					<td align="center">
					<font color="#c0c0c0">* 이 게시글은 삭제되었습니다 *</font>
					</td>
					<%
				}
				%>
				
			
			<td align="center"><%=qna.getReadcount() %></td>
			<td align="center">
				<%=qna.getId() %>
			</td>
		</tr>
<%
	}
}
%>
</table>

<% 
for(int i = 0;i < qnaPage; i++){
	if(pageNumber == i){	// 현재 페이지		1 [2] [3]
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}
	else{					// 그 외의 페이지
		%>
		<a href="#none" title="<%=i + 1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt;color: #000; font-weight: bold; text-decoration: none;">
			[<%=i + 1 %>]
		</a>&nbsp;
		<%
	}
}
%>
<br><br>


<div align="center">

<select id="choice" style="height:25px; vertical-align: middle">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="id">작성자</option>
</select>

<input type="text" id="search" value="<%=search %>" style="height:20px">

<button type="button" onclick="searchQna()" style="height:25px; vertical-align: middle">검색</button>

</div>

<br>	
	<a href="moveQnawrite.do">글쓰기</a>

</div>

<script type="text/javascript">
$(function () {
	$(".titleTd").mouseover(function() {		
		$(this).css("background", "#e0e0e0");
	});
	$(".titleTd").mouseout(function() {
		$(this).css("background", "#ffffff");
	});	
});

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
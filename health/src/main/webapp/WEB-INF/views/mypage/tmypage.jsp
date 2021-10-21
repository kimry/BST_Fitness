<%@page import="com.one.health.dto.sDto"%>
<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
List<sDto> today = (List<sDto>)request.getAttribute("today");
List<sDto> upcoming = (List<sDto>)request.getAttribute("upcoming");
List<sDto> past = (List<sDto>)request.getAttribute("past");
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
    margin: 50px auto;
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
    font-size: 16px;
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
    font-size: 15px;
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
table.type1 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;

}
table.type1 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type1 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	text-align: left;
	border-bottom: 1px solid #ccc;
}

</style>

</head>
<body>

<div class="board_wrap">
        <div class="board_title">
            <strong>마이페이지</strong>
            <p>나의 정보를 볼수 있으며, 아래 '수정'버튼을 누르시면 수정이 가능합니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
					<dl>
						<dt>사진</dt>
						<dd>
							<img src="resources/images/trainer/<%=trainner.getTid()%>.jpg"
								width="400px" height="400px"
								onerror="this.src='resources/images/trainer/null.jpg'"><br>
							<form action="upload.do" method="post"
								enctype="multipart/form-data">
								<input type="file" class="btn" name="fileload"> 
								<input type="submit" class="btn btn-dark" value="업로드">
							</form>
						</dd>
					</dl>
					<div class="title">
                    <dl>
                        <dt>아이디</dt>
                       <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id" placeholder="글쓴이 입력" value="<%=user.getId()%>" readonly="readonly"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>이름</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text"   value="<%=user.getName()%>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>나이</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text"   value="<%=user.getAge() %>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>e-mail</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text"   value="<%=user.getEmail() %>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>전화번호</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text"   value="<%=user.getPhone() %>" readonly="readonly"></dd>
                    </dl>
                     <dl>
                        <dt>분야</dt>
                        <dd>
							<%if(trainner.getField() == 1){
							%>
							<input type="text" style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" value="PT" readonly="readonly">
							<%
							} else if (trainner.getField() == 2) {
							%>
							<input type="text" style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" value="필라테스" readonly="readonly">
							<%
							} else {
							%>
							<input type="text" style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" value="수정해 주세요" readonly="readonly">
							<%
							}
							%>
                    </dl>
                        

                </div>
                <div class="cont">
                    <br>
                    <dt>약력</dt>
                    <br>
                    <textarea style="font-size: 15px;" readonly="readonly"><%=trainner.getCareer()%></textarea>
                </div>
                
				<div class="cont">
                    <br>
                    <dt style="margin: 10;">한마디</dt>
                    <br>
                    <textarea style="font-size: 15px;" readonly="readonly"><%=trainner.getContent()%></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <button type="button" onclick="updateTrainner('<%=user.getId() %>')" style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">정보수정</button>
            </div>
        </div>

    </div>
<br><br>
<div align="center">
<table style="margin: auto; width: 1000px;">
<tr>
<td valign="top">
&nbsp;&nbsp;금일 예약 현황
<table class="type1" border="1" style="margin: 10px; font-size: 13px;">
	<tr>
		<td>예약번호</td>
		<td>강사</td>
		<td>예약일</td>
		<td>시간</td>
	</tr>
	<%
	if(today.size()==0)
	{
		%>
			<tr>
				<td colspan="4"> 금일 예약 현황이 없습니다.</td>
			</tr>
		<%
	}
	for(int i=0;i<today.size();i++)
	{
		%>
		<tr>
			<td><%=today.get(i).getSnum() %></td>
			<td><%=today.get(i).getName() %></td>
			<td><%=today.get(i).getPtdate().substring(0,10) %></td>
			<td><%=today.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</table>
</td>
<td valign="top">
&nbsp;&nbsp;예정된 예약 현황
<table class="type1" border="1" style="margin: 10px; font-size: 13px;" >
	<tr>
		<td>예약번호</td>
		<td>강사</td>
		<td>예약일</td>
		<td>시간</td>
	</tr>
	<%
	if(upcoming.size()==0)
	{
		%>
			<tr>
				<td colspan="4">예정된 예약 현황이 없습니다.</td>
			</tr>
		<%
	}
	for(int i=0;i<upcoming.size();i++)
	{
		%>
		<tr>
			<td><%=upcoming.get(i).getSnum() %></td>
			<td><%=upcoming.get(i).getName() %></td>
			<td><%=upcoming.get(i).getPtdate().substring(0,10) %></td>
			<td><%=upcoming.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</table>
</td>
<td valign="top">
&nbsp;&nbsp;과거 예약 현황
<table class="type1" border="1" style="margin: 10px; font-size: 13px;">
	<tr>
		<td>예약번호</td>
		<td>강사</td>
		<td>예약일</td>
		<td>시간</td>
	</tr>
	<%
	if(past.size()==0)
	{
		%>
			<tr>
				<td colspan="4">과거 예약 현황이 없습니다.</td>
			</tr>
		<%
	}
	for(int i=0;i<past.size();i++)
	{
		%>
		<tr>
			<td><%=past.get(i).getSnum() %></td>
			<td><%=past.get(i).getName() %></td>
			<td><%=past.get(i).getPtdate().substring(0,10) %></td>
			<td><%=past.get(i).getTimes() %></td>
		</tr>
		<%
	}
	%>
</td>
</tr>
</table>
</table>
</div>
<br><br><br>

<script type="text/javascript">
function updateTrainner(id){

    let password = prompt('비밀번호를 입력해주세요.');
    if(password==="<%=user.getPw()%>"){
  	 	alert('인증 되었습니다');
		location.href = "moveUpdateTrainner.do?id="+id;
    } else {
		alert('인증에 실패 했습니다');
		location.href = "moveTrainerMypage.do";
    }
    
}

</script>


</body>
</html>
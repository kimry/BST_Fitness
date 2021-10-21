<%@page import="com.one.health.dto.sDto"%>
<%@page import="java.util.List"%>
<%@page import="com.one.health.dto.PTSDto"%>
<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
MembersDto member = (MembersDto)request.getAttribute("member");
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
<link rel="stylesheet" type="text/css" href="./css/mmypage.css">
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
                        <dt>아이디</dt>
                       <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id" placeholder="글쓴이 입력" value="<%=user.getId()%>" readonly="readonly"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>이름</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=user.getName()%>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>나이</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=user.getAge() %>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>e-mail</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=user.getEmail() %>" readonly="readonly"></dd>
                    </dl>
                    <dl>
                        <dt>전화번호</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=user.getPhone() %>" readonly="readonly"></dd>
                    </dl>
                     <dl>
                        <dt>PT 포인트</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=member.getPtpoint()%>" readonly="readonly"></dd>
                    </dl>
                     <dl>
                        <dt>필라테스 포인트</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=member.getFlpoint()%>" readonly="readonly"></dd>
                    </dl>
                     <dl>
                        <dt>결제정보</dt>
                        <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=member.getPrice()%>원" readonly="readonly"></dd>
                    </dl>
                </div>

            </div>
            <div class="bt_wrap">
                <button type="button" onclick="updateMember('<%=user.getId() %>')" style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">정보수정</button>
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
function updateMember(id){

    let password = prompt('비밀번호를 입력해주세요.');
    if(password==="<%=user.getPw()%>"){
  	 	alert('인증 되었습니다');
		location.href = "moveUpdateMember.do?id="+id;
    } else {
		alert('인증에 실패 했습니다');
		location.href = "moveMemberMypage.do";
    }
    
}

</script>

</body>
</html>
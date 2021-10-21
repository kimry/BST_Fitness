<%@page import="com.one.health.dto.MembersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
MembersDto member = (MembersDto)request.getAttribute("member");
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
<link rel="stylesheet" type="text/css" href="./css/updatemmypage.css">

</head>
<body>

<div class="board_wrap">
<form action="UpdateMemberAf.do" method="post" onsubmit="return check()">
	<input type="hidden" name="mid" value="<%=member.getMid() %>">
        <div class="board_title">
            <strong>정보수정페이지</strong>
            <p>수정할 정보를 작성하시고 '수정완료'버튼을 눌러주세요.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>아이디</dt>
                        <dd><input style="width: 360px;height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" type="text"  id="id" name="id" value="<%=user.getId()%>" readonly="readonly"></dd>
                    </dl>
                </div>
                <div class="title">
                    <dl>
                        <dt>비밀번호</dt>
                        <dd><input style="width: 360px;" type="password" type="password" id="pw" name="pw" value="<%=user.getPw()%>"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>이름</dt>
                        <dd><input style="width: 360px;" type="text" id="name" name="name" value="<%=user.getName()%>"></dd>
                    </dl>
                    <dl>
                        <dt>나이</dt>
                        <dd><input style="width: 360px;" type="text"  id="age" name="age" value="<%=user.getAge()%>"></dd>
                    </dl>
                    <dl>
                        <dt>e-mail</dt>
                        <dd><input style="width: 360px;" type="text"  id="email" name="email" value="<%=user.getEmail()%>"></dd>
                    </dl>
                    <dl>
                        <dt>전화번호</dt>
                        <dd><input style="width: 360px;" type="text"  id="phone" name="phone" value="<%=user.getPhone()%>"></dd>
                    </dl>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="수정완료" id="updateSuccess" style="height:30px; margin:8px; vertical-align: middle; font-size:15px;" class="btn btn-dark">
            </div>
        </div>
        </form>
    </div>



<script>
function check(){
	if($("#pw").val().trim() == "" ){
    	alert('비밀번호를 입력해 주세요');
    	$("#pw").focus();
    }else if($("#name").val().trim() == "" ){
    	alert('이름을 입력해 주세요');
    	$("#name").focus();
    }else if($("#age").val().trim() == "" ){
    	alert('나이를 입력해 주세요');
    	$("#age").focus();
    }else if(isNaN($("#age").val().trim()) == true ){
    	alert('나이를 숫자로만 입력해 주세요');
    	$("#age").focus();
    }else if($("#email").val().trim() == "" ){
    	alert('이메일 주소를 입력해 주세요');
    	$("#email").focus();
    }else if($("#phone").val().trim() == "" ){
    	alert('휴대전화 번호를 입력해 주세요');
    	$("#phone").focus();
    }else{
		return true;
	}
	return false;
}
$(document).ready(function(){
  $("#updateSuccess").click(function(){
	    
	  $.cookie("userId", $("#id").val().trim(), { expires:7, path:'./' });
	  alert('수정이 완료 되었습니다');
	  });
});

</script>

</body>
</html>
<%@page import="com.one.health.dto.TrainnersDto"%>
<%@page import="com.one.health.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UsersDto user = (UsersDto)request.getAttribute("user");
TrainnersDto trainner = (TrainnersDto)request.getAttribute("trainner");
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
<link rel="stylesheet" type="text/css" href="./css/updatetmypage.css">

</head>
<body>

<div class="board_wrap">
<form action="UpdateTrainnerAf.do" method="post" onsubmit="return check()">
	<input type="hidden" name="tid" value="<%=trainner.getTid() %>">
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
						</dd>
					</dl>
					<div class="title">
                    <dl>
                        <dt>아이디</dt>
                       <dd><input style="height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
						 type="text" name="id"  value="<%=user.getId()%>" readonly="readonly"></dd>
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
                     <dl>
                        <dt>분야</dt>
                        <dd>
									<select name="field" id="sel">
										<option value="0">선택해주세요</option>
										<option value="1">PT</option>
										<option value="2">필라테스</option>
									</select>
								</dd>
                    </dl>

                </div>
                <div class="cont">
                    <br>
                    <dt>약력</dt>
                    <br>
                    <textarea style="font-size: 15px;" id="career" name="career" ><%=trainner.getCareer()%></textarea>
                </div>
				<div class="cont">
                    <br>
                    <dt>한마디</dt>
                    <br>
                    <textarea style="font-size: 15px;" id="content" name="content" ><%=trainner.getContent()%></textarea>
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
	if($('#career').val().trim().length==0){
		alert("career를 입력해주세요.");
		$('#career').focus();
	}else if($('#content').val().trim().length==0){
		alert("내용을 입력해주세요.");
		$('#content').focus();
	}else if($("#pw").val().trim() == "" ){
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
    }else if($("#field").val().trim() == "" ){
    	alert('field를 입력해 주세요');
    	$("#field").focus();
    }else{
		return true;
	}
	return false;
}

$(document).ready(function(){
	if(<%=trainner.getField()%> == 1){
		$("#sel").val("1").prop("selected", true);
	}else if(<%=trainner.getField()%> == 2){
		$("#sel").val("2").prop("selected", true);
	}else{
		$("#sel").val("0").prop("selected", true);
	}

  $("#updateSuccess").click(function(){
	    
	  $.cookie("userId", $("#id").val().trim(), { expires:7, path:'./' });
	  alert('수정이 완료 되었습니다');

	  });
});
</script>


</body>
</html>
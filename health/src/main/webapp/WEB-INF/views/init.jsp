<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<style>
table{
width:1740px;
height:770px;
margin: 100px auto;
}
</style>
</head>
<body>
<table>
<tr>
<td>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/images/init/1IntroT.jpg" onclick="location.href='moveTrainnerList.do'" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/init/2Mregi.jpg" onclick="location.href='moveMembership.do'" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/images/init/3PTRsize.jpg" onclick="location.href='moveReservationPT.do'" class="d-block w-100" alt="...">
    </div>
        <div class="carousel-item">
      <img src="resources/images/init/4Q&A.jpg" onclick="location.href='qnalist.do'" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</td>
</tr>
</table>
</body>
</html>
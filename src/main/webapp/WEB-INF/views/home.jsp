<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin: 0; padding: 0;height:100%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="position:relative;">
<main id="fullpage">
		<section class="section">
				<div class="slide">
				<section class="first_section"> 
  				 <!--  <h1 class="text1">고캠핑에서 당신을 초대합니다<br>지금 바로 시작하세요</h1> -->
				</section>
				</div>		
				<div class="slide">
				<section class="first_section2"> 
  				 <!--  <h1 class="text1">고캠핑에서 당신을 초대합니다<br>지금 바로 시작하세요</h1> -->
				</section>
				</div>
				<div class="slide">
				<section class="first_section3"> 
  				 <!--  <h1 class="text1">고캠핑에서 당신을 초대합니다<br>지금 바로 시작하세요</h1> -->
				</section>
				</div>		
		</section>
		
		<section class="section">
			<div class="introduce">
				<p class="introduce_text">고캠핑 소개</p>
				<hr width = "100px" color = "black">
			</div>
			<br>
				<section class="second_section"> 
	  				<div class="section_box">
  					<a href="place.go?h_u_id=${sessionScope.loginMember.u_id}">
  						<p>쉽고 빠른 <br> 캠핑장 예약</p>
  					</a>
  					</div>
  					<div class="section_box">
  					<a href="shopping.go">
  						<p>밀키트 <br> 캠핑용품</p>
  					</a>
  					</div>
  					<div class="section_box">
  					<a href="board.go">
  						<p>게시판으로 <br> 소통을</p>
  					</a>
  					</div>
				</section>				
		</section>
		<section class="section">
				<section class="fourth_section">
					<div class="reserve_box">
						<a href="place.go">캠핑 예약하러가기</a>
					</div>
				</section>				
		</section>
		<footer class="section fp-auto-height"> <!-- fp-auto-height : 하단구역 클래스 -->
			<div class="footerr">
				<h2>Go camping</h2>
				<h3>team:jihyun  yongsig  minjung  moonyeong</h3>
				<h3>Address:서울특별시 종로구 종로12길 15, 5층(관철동 13-13)</h3>
				<h3>Phonenumber:010-0000-0000</h3>
				<h3>github:<a style="color:white;" href="https://github.com/jh0222/campingporject">https://github.com/jh0222/campingporject</a></h3>
			</div>
		</footer>
</main>
</div>
</body>
</html>
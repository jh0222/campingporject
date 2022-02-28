<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/place.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote/summernote.min.js"></script>
<link rel="stylesheet" href="resources/css/board.css">
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/shopping.js"></script>
<script type="text/javascript" src="resources/js/shoppingorder.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/jsjs/style.css">
<link rel="stylesheet" href="resources/jsjs/responsive.css">
<link rel="stylesheet" href="resources/css/jquery.fullPage.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/campingplace.css">
<script src="resources/css/jquery.fullPage.js"></script>
<script src="resources/css/main.js"></script>
<title>Insert title here</title>
</head>
<body>
${result }
<header>
      <div class="gnb-inner">       
        <div class="logo">
			<a href="home"><img src="resources/img/camping-tent.png"> Go Camping</a>
		</div>        
        <div class="gnb">
        <div class="menu">       
          <ul class="menu_list">
			<li><a href="place.go?h_u_id=${sessionScope.loginMember.u_id}">캠핑예약</a>
			</li>
			<li><a href="shopping.go">밀키트/캠핑용품</a>
				<ul class="sub">
					<li><a href="camping.milkit">밀키트</a></li>
					<li><a href="camping.product">캠핑용품</a></li>
				</ul>
			</li>
			<li><a href="board.go">게시판</a>
				<ul class="sub">
					<li><a href="freeboard.go">자유게시판</a></li>
					<li><a href="campingtip.go">캠핑팁게시판</a></li>
					<li><a href="recipe.go">레시피게시판</a></li>
				</ul>
			</li>
		  </ul>
        </div>
        
        <div class="trigger">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
      <div class="login">
		  <jsp:include page="${loginPage }"></jsp:include>
        </div>
      </div>
      
    </header>
<jsp:include page="${contentPage }"></jsp:include>

</body>
</html>
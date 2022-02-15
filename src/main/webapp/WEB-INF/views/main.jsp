<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Insert title here</title>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote/summernote.min.js"></script>
<link rel="stylesheet" href="resources/css/board.css">
=======
<script type="text/javascript" src="resources/js/jquery.js"></script>
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/review.js"></script>
<script type="text/javascript" src="resources/js/communities.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<<<<<<< HEAD
<link rel="stylesheet" href="resources/jsjs/style.css">
<link rel="stylesheet" href="resources/jsjs/responsive.css">
<link rel="stylesheet" href="resources/css/jquery.fullPage.css">
<link rel="stylesheet" href="resources/css/main.css">
<script src="resources/css/jquery.fullPage.js"></script>
<script src="resources/css/main.js"></script>
<title>Insert title here</title>
</head>
<body>
<header>
      <div class="gnb-inner">       
        <div class="logo">
			<a href="home"><img src="resources/img/camping-tent.png"> Go Camping</a>
		</div>        
        <div class="gnb">
        <div class="menu">       
          <ul class="menu_list">
			<li><a href="#">캠핑예약</a>
			</li>
			<li><a href="shopping.go">밀키트/캠핑용품</a>
				<ul class="sub">
					<li><a href="camping.milkit">밀키트</a></li>
					<li><a href="camping.product">캠핑용품</a></li>
				</ul>
			</li>
			<li><a href="#">게시판</a>
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
=======
</head>
<body>
${result }
<jsp:include page="${loginPage }"></jsp:include>

<hr>
>>>>>>> d3be522016e6e899d9a2e96f82e68725ec3f5622
<jsp:include page="${contentPage }"></jsp:include>
	
	<table id="siteMenuArea">
	<tr>
		<td colspan="4" align="center"> 캠핑장 웹사이트 </td>
	</tr>
		<tr> 
			<td align="center">
				<table id="siteMenu">
					<tr>
						<td onclick="location.href='CampingPlaceC'">[캠핑장]</td>
						<td>[자유게시판]</td>
						<td>[레시피]</td>
						<td>[꿀팁]</td>
						<td>[오픈채팅방]</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>
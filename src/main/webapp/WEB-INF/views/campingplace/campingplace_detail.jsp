<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<!-- <script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script>

$('#star a').click(function(){ 
	 $(this).parent().children("a").removeClass("on");    
	 $(this).addClass("on").prevAll("a").addClass("on");
	 console.log($(this).attr("value"));
});

    $(function() {
    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']); 

    //시작일
    $('#fromDate').datepicker({

    dateFormat: "yy-mm-dd",             // 날짜의 형식
    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
    onClose: function( selectedDate ) {
    // 시작일(fromDate) datepicker가 닫힐때
    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
    $("#toDate").datepicker( "option", "minDate", selectedDate );
        }
      });

    //종료일
    $('#toDate').datepicker({

    dateFormat: "yy-mm-dd",
    changeMonth: true,
    minDate: 0, // 오늘 이전 날짜 선택 불가
    onClose: function( selectedDate ) {
    // 종료일(toDate) datepicker가 닫힐때
    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
    $("#fromDate").datepicker( "option", "maxDate", selectedDate );
        }
    });
});

 
</script>

<style>
    /datepicker에서 사용한 이미지 버튼 style적용/
    img.ui-datepicker-trigger {
    margin-left:5px; vertical-align:middle; cursor:pointer;
    }
</style>
<style type="text/css">
#star a {
	text-decoration: none;
	color: gray;
}

#star a.on {
	color: red;
}
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>
<button onclick="location.href='heart.go'">찜 목록</button>
	${result }
	<br>
	<div style="float: left">
		<table border="1" style="width:700px;">
			<tr>
				<th>이름</th>
				<th>상세설명</th>
				<th>연락처</th>
				<th>가격</th>
				<th>주소</th>
			</tr>
			<tr>
				<td>${places.cam_name }</td>
				<td>${places.cam_txt }</td>
				<td>${places.cam_phonenumber }</td>
				<td><fmt:formatNumber value="${places.cam_price}"
						pattern="###,###,###" type="currency" /></td>
				<td>${places.cam_address }</td>
				<td><img src="resources/img/${places.cam_picture }" width="300"
					height="200"></td>

				<!-- 자신의 아이디일 경우 -->
				<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
					<td><button onclick="placedelete(${places.cam_no});">삭제</button></td>
					<td><button onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button></td>
				</c:if>

				<td>
				<form action="placelike.go"> 
					<input type="hidden" name="h_cam_no" value="${places.cam_no }" />
					<input type="hidden" name="h_u_id" value="${sessionScope.loginMember.u_id}" /> 
					<input type="hidden" name="h_cam_name" value="${places.cam_name }" /> 
					<input type="hidden" name="h_cam_address" value="${places.cam_address }" /> 
					<input type="hidden" name="h_campingheart" value="1" /> 
					<button">찜</button>
				</form>
				</td>
			</tr>
		</table>
		
		<div id="map" style="width:700px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0005adacefd1f11b5b2c5683fdc3d59c"></script>
			<script>
				
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng('${places.cam_latitude }','${places.cam_longitude }' ),
					level: 3
				};

				var map = new kakao.maps.Map(container, options);
				
				var markerPosition  = new kakao.maps.LatLng('${places.cam_latitude }','${places.cam_longitude }');
				var marker = new kakao.maps.Marker({ 
					position: map.markerPosition
				}); 
				// 지도에 마커를 표시합니다
				marker.setMap(map);

			</script>
			
<c:if test=""></c:if>
		<form action="review.Reg">
			<table border="1" style="width:700px;">
				<tr>
					<td>ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</td>
					<td>별점
						<p id="star">
							<a href="#"><input type="hidden" name="c_campingstar"value="1">★</a>
							<a href="#"><input type="hidden" name="c_campingstar" value="2">★</a> 
							<a href="#"><input type="hidden" name="c_campingstar" value="3">★</a> 
							<a href="#"><input type="hidden" name="c_campingstar" value="4">★</a> 
							<a href="#"><input type="hidden" name="c_campingstar" value="5">★</a>
						<p>
					</td>
					<td style="width:500px;height:100px;">
						<textarea name="c_campingreview"></textarea>
					</td>

					<td>
						<input type="hidden" name="c_cam_no" value="${places.cam_no }"> 
						<input type="hidden" name="cam_no" value="${places.cam_no }"> 
						<input type="hidden" name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">		
						<input onclick="return star" type="submit" name="submit" value="등록">
						
					</td>
				</tr>
			</table>
		</form>
	
	<table border="1" style="width:700px;">
			<c:forEach var="r" items="${reviews}">
				<tr>
					<td  align="center">${r.c_u_id }</td>
					<td  height="50">${r.c_campingreview }</td>
					<td  align="center">${r.c_campingstar }</td>

					<c:if test="${sessionScope.loginMember.u_id == r.c_u_id}">
						<td colspan="2" width="100" align="center">
							<button onclick="reviewdelete(${r.c_no},${places.cam_no });">삭제</button>
							<button onclick="reviewupdate(${r.c_no},'${r.c_campingreview }',${places.cam_no });">수정</button>
						</td>
					</c:if>
				</tr>
			</c:forEach>
	</table>
</div>
	<div style="float: right">
		<form action="reservation.go">
		<table border="1" style="width: 200;">	
			<tr>
				<td>체크인</td>
				<td>체크아웃</td>
			</tr>
			<tr>
				<td><input type="text" name="start" id="fromDate" class="inputtype1"></td>
				<td><input type="text" name="end" id="toDate" class="inputtype1"></td>
			</tr>
			<tr>
				<td>인원</td>
				<td><input type="number" min="1" max="10"
					value="r_campingheadcount" name="headcount"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="r_cam_no" value="${places.cam_no }" />
					<input type="hidden" name="cam_price" value="${places.cam_price }" />
					<input type="hidden" name="r_cam_name" value="${places.cam_name }" /> 
					<input type="hidden" name="r_u_id" value="${sessionScope.loginMember.u_id}" /> 
					<input type="hidden" name="r_cam_phonenumber" value="${places.cam_phonenumber }" /> 
					<input type="hidden" name="r_cam_address" value="${places.cam_address }" /> 
					<input type="hidden" name="r_u_name" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_name}" />
					<input type="hidden" name="r_u_phonenumber" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_phonenumber}" />
					<button onclick="location.href='reservation.go'">예약하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
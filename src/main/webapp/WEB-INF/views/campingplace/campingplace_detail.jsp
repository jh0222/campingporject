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
<!-- <script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->

<style type="text/css">
#star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: red;
  } 
</style>
<script>

$(function() {   

	$('#star a').click(function(){ 
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 
		 $('input[name=c_campingstar]').attr('value',$(this).attr("value"));
	});
//하트찜	
	$('#heart a').click(function(){ 
	    let FormVisible = $(this).attr('value');
		alert(FormVisible);
		
		if (FormVisible == 1) {
			//value=0 찜취소
			$(this).parent().children("a").removeClass("on");
			let h_cam_no = $("#cam_no").val();
		   	alert('111');
		    let h_u_id = $("#h_u_id").val();
		    location.href="placelike.delgo?h_cam_no=" + h_cam_no + "&h_u_id=" + h_u_id
		   				 + "&cam_no=" + h_cam_no + "&c_cam_no=" + h_cam_no;     
		    FormVisible = $(this).attr('value', '0'); 
		    console.log($(this).attr("value")); 
	    } else {
	    	//value=0 찜
		    $(this).addClass("on").prevAll("a").addClass("on");
		    let h_cam_no = $("#cam_no").val();
		    alert('000');
		    let h_u_id = $("#h_u_id").val();
		    let h_cam_address =  $("#h_cam_address").val();
		    let h_cam_name =  $("#h_cam_name").val();
		    let h_campingheart = 0;
		    location.href="placelike.go?h_cam_no=" + h_cam_no + "&h_u_id=" + h_u_id + "&h_cam_address=" + h_cam_address +"&h_cam_name=" + h_cam_name + "&h_campingheart=0"
		    		+ "&cam_no=" + h_cam_no + "&c_cam_no=" + h_cam_no;
		    FormVisible = $(this).attr('value', '1');
		    console.log($(this).attr("value")); 
		} 
     	 
		 $('input[name=c_campingstar]').attr('value',$(this).attr("value"));
	});

	
	
    
   
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
    /*datepicker에서 사용한 이미지 버튼 style적용*/
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

#heart a {
	text-decoration: none;
	color: gray;
}

#heart a.on {
	color: red;
}
</style>
<!-- 지도&로드뷰 css-->
<style>
#container {overflow:hidden;height:300px;position:relative;}
#btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
#container.view_map #mapWrapper {z-index: 10;}
#container.view_map #btnMap {display: none;}
#container.view_roadview #mapWrapper {z-index: 0;}
#container.view_roadview #btnRoadview {display: none;}
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>

<button onclick="location.href='place.go'">홈</button>
<button onclick="location.href='heart.go'">찜 목록</button>
	${result }
	<br>
	<div style="float: left">
		<table border="1">
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
					<input type="hidden" id="cam_no" value="${places.cam_no }" />
					<input type="hidden" id="h_u_id" value="${sessionScope.loginMember.u_id}" /> 
					<input type="hidden" id="h_cam_name" value="${places.cam_name }" /> 
					<input type="hidden" id="h_cam_address" value="${places.cam_address }" /> 
					<input type="hidden" id="c_cam_no" value="${places.cam_no}" /> 
					<input type="hidden" id="campingheart" value='0' /> 
 
					<c:choose>
						<c:when test="${heart != null}">
							<p id="heart">
								<a href="#" value="1" style="color: red;">♥</a>
							</p>
						</c:when>
						<c:otherwise>
							<p id="heart">
								<a href="#" value="0">♥</a>
							</p>
						</c:otherwise>
					</c:choose>
				
				</td>
				
			</tr>
		</table>
	
<c:if test="">
		<form action="review.Reg">
			<table border="1" >
				<tr>
					<td>ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</td>
					<td>별점
						<p id="star">
							<a href="#" value="1">★</a>
							<a href="#" value="2">★</a> 
							<a href="#" value="3">★</a> 
							<a href="#" value="4">★</a> 
							<a href="#" value="5">★</a>
						<p>
					</td>
					<td width="500" height="100">
						<textarea name="c_campingreview"></textarea>
					</td>

					<td>
						<input type="hidden" name="c_cam_no" value="${places.cam_no }"> 
						<input type="hidden" name="cam_no" value="${places.cam_no }"> 
						<input type="hidden" name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
						<input type="hidden" name="c_campingstar" value=""/>
						<input type="submit" name="submit"  value="등록">
					</td>
				</tr>
			</table>
		</form>
</c:if>	
	<c:forEach var="r" items="${reviews}">
	<table border="1">
			
				<tr>
					
					<td width="50" align="center">${r.c_u_id }</td>
					<td width="200" height="50">${r.c_campingreview }</td>
					
 				<td width="100" align="center">
				<c:if test="${r.c_campingstar == 1}">
				<p id="star"><a href="#"style="color: red;">★ </a></p>
				</c:if>
				<c:if test="${r.c_campingstar == 2}">
				<p id="star"><a href="#"style="color: red;">★★ </a></p>
				</c:if>
				<c:if test="${r.c_campingstar == 3}">
				<p id="star"><a href="#"style="color: red;">★★★ </a></p>
				</c:if>
				<c:if test="${r.c_campingstar == 4}">
				<p id="star"><a href="#"style="color: red;">★★★★ </a></p>
				</c:if>
				<c:if test="${r.c_campingstar == 5}">
				<p id="star"><a href="#"style="color: red;">★★★★★</a></p>
				</c:if>
				</td>
					
					<c:if test="${sessionScope.loginMember.u_id == r.c_u_id}">
						<td colspan="2" width="100" align="center">
							<button onclick="reviewdelete(${r.c_no},${places.cam_no });">삭제</button>
							<button onclick="reviewupdate(${r.c_no},'${r.c_campingreview }',${places.cam_no });">수정</button>
						</td>
					</c:if>
				</tr>
			
	</table>
	<!-- 사장님 답글 insert-->
		<c:if test="${sessionScope.loginMember.u_id != null || sessionScope.loginMember2.bo_id != null || sessionScope.loginMember3 != null}">
			<form action="replytxt.Reg">
					<table border="1" >
						<tr>
							<td colspan="3">답글작성</td>
						</tr>
						<tr>
							<td>ID:${sessionScope.loginMember2.bo_id}</td>
							<td width="200" height="50">
								<textarea name="cr_replytxt"></textarea>
							</td>
							<td width="93" align="center">
								
								<input type="hidden" name="cr_cam_no" value="${places.cam_no }"> 
								<input type="hidden" name="cr_bo_id" value="${sessionScope.loginMember2.bo_id}">
								<input type="hidden" name="cr_u_id" value="${sessionScope.loginMember.u_id}">
								<input type="hidden" name="cr_replytxt" value=""/>
								<input type="submit" name="submit"  value="등록">
							</td>
						</tr>
					</table>
			</form>
			</c:if>
			<!-- 사장님 답글 select -->
			<c:if test="${r.c_no==param.cr_no }">
			<table border="1">
				<tr>			
					<td width="50" align="center">사장님:${param.cr_bo_id }</td>
					<td width="200" height="50">${param.cr_replytxt }</td>
	 				<td width="100">${param.cr_date }</td>
					<c:if test="${sessionScope.loginMember2.bo_id == param.cr_bo_id}">
						<td colspan="2" width="100" align="center">
							<button onclick="replydelete(${param.cr_no},${param.cr_cam_no });">삭제</button>
							<button onclick="replyupdate(${param.cr_no},'${param.cr_replytxt }',${param.cr_cam_no });">수정</button>
						</td>
					</c:if>
				</tr>
			</table>
		</c:if>
	</c:forEach>

<!-- 캠핑장 예약 -->
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



<!-- 캠핑장 지도 -->

<p style="margin-top:250px">

    <em class="link">
        <a type="">지도</a>
    </em>
</p>
<div id="container" class="view_map">
    <div id="mapWrapper" style="width:100%;height:300px;position:relative;">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
    </div>
    <div id="rvWrapper" style="width:100%;height:300px;position:absolute;top:0;left:0;">
        <div id="roadview" style="height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0005adacefd1f11b5b2c5683fdc3d59c"></script>
<script>
var container = document.getElementById('container'), // 지도와 로드뷰를 감싸고 있는 div 입니다
    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
    btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다 
    btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다 
    rvContainer = document.getElementById('roadview'), // 로드뷰를 표시할 div 입니다
    mapContainer = document.getElementById('map'); // 지도를 표시할 div 입니다

// 지도와 로드뷰 위에 마커로 표시할 특정 장소의 좌표입니다 
var placePosition = new kakao.maps.LatLng(${places.cam_latitude },${places.cam_longitude });

// 지도 옵션입니다 
var mapOption = {
    center: placePosition, // 지도의 중심좌표 
    level: 3 // 지도의 확대 레벨
};

// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 로드뷰 객체를 생성합니다 
var roadview = new kakao.maps.Roadview(rvContainer);

// 로드뷰의 위치를 특정 장소를 포함하는 파노라마 ID로 설정합니다
// 로드뷰의 파노라마 ID는 Wizard를 사용하면 쉽게 얻을수 있습니다 
roadview.setPanoId(1023434522, placePosition);

// 특정 장소가 잘보이도록 로드뷰의 적절한 시점(ViewPoint)을 설정합니다 
// Wizard를 사용하면 적절한 로드뷰 시점(ViewPoint)값을 쉽게 확인할 수 있습니다
roadview.setViewpoint({
    pan: 321,
    tilt: 0,
    zoom: 0
});

// 지도 중심을 표시할 마커를 생성하고 특정 장소 위에 표시합니다 
var mapMarker = new kakao.maps.Marker({
    position: placePosition,
    map: map
});

// 로드뷰 초기화가 완료되면 
kakao.maps.event.addListener(roadview, 'init', function() {

    // 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다 
    var rvMarker = new kakao.maps.Marker({
        position: placePosition,
        map: roadview
    });
});

// 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다 
function toggleMap(active) {
    if (active) {

        // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_map"
    } else {

        // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
        container.className = "view_roadview"   
    }
}
</script>

</body>
</html>
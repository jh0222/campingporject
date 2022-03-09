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
<!-- 아래 세줄 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
		
	    if (FormVisible == 1) {
			//value=0 찜취소
			$(this).parent().children("a").removeClass("on");
			let h_cam_no = $("#cam_no").val();
		    let h_u_id = $("#h_u_id").val();
		    location.href="placelike.delgo?h_cam_no=" + h_cam_no + "&h_u_id=" + h_u_id
		   				 + "&cam_no=" + h_cam_no + "&c_cam_no=" + h_cam_no;     
		    FormVisible = $(this).attr('value', '0'); 
		    console.log($(this).attr("value")); 
	    } else {
	    	//value=0 찜
		    $(this).addClass("on").prevAll("a").addClass("on");
		    let h_cam_no = $("#cam_no").val();
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
<table width="100%">
	<hr><h2 class="detail_h2">캠핑장 상세정보</h2> 
	<hr><br>
	<tr>
		<td>
			<table class="detail_picture_table">
				<tr>
					<td><img src="resources/img/${places.cam_picture }" class="detail_img"></td>
				<tr>
			</table>
		</td>
		<td>
			<div class="deatil_div0">
				<div class="detail_div1_div" align="center">	
					<input type="hidden" id="cam_no" value="${places.cam_no }" />
					<input type="hidden" id="h_u_id" value="${sessionScope.loginMember.u_id}" /> 
					<input type="hidden" id="h_cam_name" value="${places.cam_name }" /> 
					<input type="hidden" id="h_cam_address" value="${places.cam_address }" /> 
					<input type="hidden" id="c_cam_no" value="${places.cam_no}" /> 
					<input type="hidden" id="campingheart" value='0' /> 
 					<div>${places.cam_name }&nbsp;&nbsp;</div>
 					<div>
 					<c:if test="${sessionScope.loginMember.u_id != null}">
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
					</c:if>
 					</div>
	 			</div>
	 				<div class="detail_div1_1">
				
					</div>	
				
				<br><br>
				<div class="detail_div2"><b>주소&nbsp;&nbsp;</b>${places.cam_address }</div><hr><br>
				<div class="detail_div2"><b>가격&nbsp;&nbsp;</b>  ${places.cam_price}원</div><hr><br>
				<div class="detail_div2"><b>연락처&nbsp;&nbsp;</b>${places.cam_phonenumber }</div><hr><br>
				<div class="detail_div2"><b>소개&nbsp;&nbsp;</b>${places.cam_txt }</div>
				<div class="detail_div2" style="width: 500px;"></div><hr><br>
				
			</div>
				<form action="reservation.go">
			<div class="reservation_table">
				<div class="reservation_table1">
					<div class="innerDIV">
						<strong>체크인</strong>
						<input type="text" name="start" id="fromDate" class="inputtype1">
					</div>
					<div class="innerDIV">
						<strong>체크아웃</strong>
						<input type="text" name="end" id="toDate" class="inputtype1">
					</div>
					<div class="innerDIV">
						<strong>인원</strong>
						<input type="number" min="1" max="10"
						value="r_campingheadcount" name="headcount">
					</div>
				</div>
				<div>
					<button class="reserve_btn">예약하기</button>
				</div>
				
						<input type="hidden" name="r_cam_no" value="${places.cam_no }" />
						<input type="hidden" name="r_campingprice" value="${places.cam_price }" />
						<input type="hidden" name="r_cam_name" value="${places.cam_name }" /> 
						<input type="hidden" name="r_u_id" value="${sessionScope.loginMember.u_id}" /> 
						<input type="hidden" name="r_cam_phonenumber" value="${places.cam_phonenumber }" /> 
						<input type="hidden" name="r_cam_address" value="${places.cam_address }" /> 
						<input type="hidden" name="r_u_name" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_name}" />
						<input type="hidden" name="r_u_phonenumber" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_phonenumber}" />
				
				</div>
						
				</form>
				
	</tr>
</table>
<!-- 자신의 아이디일 경우 -->

	<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
		<div class="place_detail_bossBtn"><button onclick="placedelete(${places.cam_no});">삭제</button>
		<button onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button></div>
	</c:if>

				
		<hr size="3">
			<h2 class="detail_h2">캠핑장 리뷰</h2>
		<hr><br> 
		<c:if test="${reserve != null }">
			<form action="review.Reg">	
				<div class="place_reviwReg">
					<div class="review_id">ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</div>
					<div class="review_id">별점
								<p id="star">
									<a href="#" value="1">★</a>
									<a href="#" value="2">★</a> 
									<a href="#" value="3">★</a> 
									<a href="#" value="4">★</a> 
									<a href="#" value="5">★</a>
								<p>
					</div>
					<div class="review_id">
								<textarea name="c_campingreview"></textarea>
					</div>
					<div>
								<input type="hidden" name="c_cam_no" value="${places.cam_no }"> 
								<input type="hidden" name="cam_no" value="${places.cam_no }"> 
								<input type="hidden" name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
								<input type="hidden" name="c_campingstar" value=""/>
								<input type="hidden" name="cr_cam_no" value="${places.cam_no }"/>
								<input type="hidden" name="r_cam_no" value="${places.cam_no }"/>
								<input type="hidden" name="r_u_id" value="${sessionScope.loginMember.u_id}"/>
								<input type="submit" name="submit" value="등록">
					</div>
				</div>
			</form>
		</c:if>
			
			<jsp:include page="${reviewPage }"></jsp:include>
			<table border="0" class="detail_reviewtb" >
				<tr>
					<th class="pr_reviewselect" width="100">ID</th>
					<th class="pr_reviewselect">Content</th>	
					<th class="pr_reviewselect"  width="150">Date</th>
					<th class="pr_reviewselect">Star</th>
					<tr><hr></tr>	
				</tr>
				<tr><td><hr class="detailhr"></td><td><hr class="detailhr"></td><td><hr class="detailhr"></td><td><hr class="detailhr"></td><td><hr class="detailhr"></td><td><hr class="detailhr"></td></tr>
				<c:forEach var="r" items="${reviews}">
				<tr>
					<td class="pr_reviewselect2">${r.c_u_id }</td>
					<td class="pr_reviewselect2">${r.c_campingreview }</td>
				    <td class="pr_reviewselect2"><fmt:formatDate value="${r.c_date }" dateStyle="short"/></td>
				    <td class="pr_reviewselect2">
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
					<td class="pr_reviewselect2" onclick="reviewupdate(${r.c_no},'${r.c_campingreview }',${places.cam_no },${sessionScope.loginMember.u_id});">수정</td>
					<td class="pr_reviewselect2"  onclick="reviewdelete(${r.c_no},${places.cam_no },${sessionScope.loginMember.u_id});">삭제</td>
				</c:if>
				</tr>
				
				
				
				<!-- 사장님 답글 insert-->
					<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
						<form action="replytxt.Reg">
									<tr>
										<td>ID : ${sessionScope.loginMember2.bo_id}</td>
										<td width="200" height="50">
											<textarea name="cr_replytxt"></textarea>
										</td>
										<td width="93" align="center">
											<input type="hidden" name="cr_c_no" value="${r.c_no }"> 
											<input type="hidden" name="cr_cam_no" value="${places.cam_no }"> 
											<input type="hidden" name="cr_bo_id" value="${sessionScope.loginMember2.bo_id}">
											<input type="hidden" name="cam_no" value="${places.cam_no }">
											<input type="hidden" name="c_cam_no" value="${places.cam_no }">
											<input type="submit" name="submit"  value="등록">
										</td>
									</tr>
							</form>
						</c:if>
						
						
						<!-- 사장님 답글 select -->
						<c:forEach var="reply" items="${reply}">
						<c:if test="${r.c_no==reply.cr_c_no }">
							<tr class="reply_boss">			
								<td align="center">└ 사장님</td>
								<td height="50">${reply.cr_replytxt }</td>
				 				<td><fmt:formatDate value="${reply.cr_date }" dateStyle="short"/></td>
								<c:if test="${sessionScope.loginMember2.bo_id == reply.cr_bo_id}">
									<td colspan="2" width="100" align="center">
										<button onclick="replydelete(${reply.cr_no},${reply.cr_cam_no },${reply.cr_c_no });">삭제</button>
										<button onclick="replyupdate(${reply.cr_no},'${reply.cr_replytxt }',${reply.cr_cam_no });">수정</button>
									</td>
								</c:if>
							</tr>
						</c:if>
						</c:forEach>
				</c:forEach>
			</table>
				
	
<hr size="3">
	<h2 class="detail_h2">캠핑장 위치</h2>
<hr><br> 
<!-- 캠핑장 지도 -->
<p>
    <em class="link">
        <a type=""></a>
    </em>
</p>
<div id="container" class="view_map">
    <div id="mapWrapper" style="justify-content:center;display: flex;align-items:center;width:1200px;height:700px;position:absolute;">
        <div id="map" style="justify-content:center;display: flex;align-items:center;width:1200px;height:700px"></div> <!-- 지도를 표시할 div 입니다 -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
    </div>
    <div id="rvWrapper" style="justify-content:center;display: flex;align-items:center;width:1200px;height:700px;position:absolute;">
        <div id="roadview" style="justify-content:center;display: flex;align-items:center;height:700px"></div> <!-- 로드뷰를 표시할 div 입니다 -->
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
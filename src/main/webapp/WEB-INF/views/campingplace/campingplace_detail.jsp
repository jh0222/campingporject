<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58913db958e651ed6f1211f7dc043016"></script>
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
<style>
    .screen_out {display:block;overflow:hidden;position:absolute;left:-9999px;width:1px;height:1px;font-size:0;line-height:0;text-indent:-9999px}
    .wrap_content {overflow:hidden;height:330px}
    .wrap_map {width:60%;height:300px;float:left;position:relative;}
    .wrap_roadview {width:60%;height:300px;float:left;position:relative}
    .wrap_button {position:absolute;left:15px;top:12px;z-index:2}
    .btn_comm {float:left;display:block;width:70px;height:27px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/sample_button_control.png) no-repeat}
    .btn_linkMap {background-position:0 0;}
    .btn_resetMap {background-position:-69px 0;}
    .btn_linkRoadview {background-position:0 0;}
    .btn_resetRoadview {background-position:-69px 0;}
</style>
<script>
function reviewCheck2() {
	/*
	<input type="hidden" id="c_cam_no"  name="c_cam_no" value="${places.cam_no }"> 
	<input type="hidden" id="cam_no"  name="cam_no" value="${places.cam_no }"> 
<input type="hidden" id="c_u_id"  name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
	<input type="hidden" id="c_campingstar"  name="c_campingstar" value=""/>
	<input type="hidden" id="cr_cam_no"  name="cr_cam_no" value="${places.cam_no }"/>
	<input type="hidden" id="r_cam_no"  name="r_cam_no" value="${places.cam_no }"/>
	<input type="hidden" id="r_u_id" 
	*/
	let form = document.reviewForm;
	let c_campingstar = form.c_campingstar;
	let c_campingreview2 = $("#c_campingreview2").val();
	if(!c_campingstar.value){
		alert("별점을 입력하세요")
		return false;
	}
	if(!c_campingreview2){
		alert("내용을 입력하세요")
		return false;
	}
	
	form.submit();
	}
$(function() {   
	let starPlace = 0;
	$('#star a').click(function(){ 
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 starPlace = $(this).attr("value");
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

function reserveCheck() {
	
	var form = document.reserveForm;
	if (form.start.value == ""){
		alert("체크인 날짜를 입력해 주세요.");
		form.start.focus();
		return false;
	} else if (form.end.value == "") {
		alert("체크아웃 날짜를 입력해 주세요.");
		form.end.focus();
		return false;
	} else if (form.headcount.value == "") {
		alert("인원을 입력해 주세요.");
		form.headcount.focus();
		return false;
	}
}


function replyCheck() {
	var form = document.replyForm;
	if (form.cr_replytxt.value == ""){
		alert("댓글 내용을 입력하지 않았습니다.");
		form.cr_replytxt.focus();
		return false;
	}
}
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
 					<div>
 						${places.cam_name }&nbsp;&nbsp;
 						<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id || sessionScope.loginMember3.root_id != null}">
							<button class="place_btn" onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button>
							<button class="place_btn" onclick="placedelete(${places.cam_no});">삭제</button>
						</c:if>
 					</div>
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
				<div class="detail_div2"><b>주소&nbsp;&nbsp;</b>${addr[0] }&nbsp;${addr[1] }&nbsp;${addr[2] }</div><hr><br>
				
				<div class="detail_div2"><b>가격&nbsp;&nbsp;</b>
				<fmt:formatNumber value="${places.cam_price}" pattern="###,###,###" type="currency" />원
				</div><hr><br>
				<div class="detail_div2"><b>연락처&nbsp;&nbsp;</b>${places.cam_phonenumber }</div><hr><br>
				<div class="detail_div2"><b>소개&nbsp;&nbsp;</b>${places.cam_txt }</div>
				<div class="detail_div2" style="width: 500px;"></div><hr><br>
				
			</div>
			<c:if test="${sessionScope.loginMember.u_id != null}">
				<form action="reservation.go"  name="reserveForm" onsubmit="return reserveCheck();">
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
				</c:if>
				
	</tr>
</table>
<!-- 자신의 아이디일 경우 -->

	

				
		<hr size="3">
			<h2 class="detail_h2">캠핑장 리뷰</h2>
		<hr><br> 
		<c:if test="${reserve != null }">
			<form action="review.Reg" name="reviewForm">	
				<div class="place_reviwReg">
					<div class="review_id">ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</div>
					<div class="review_id">별점
								<p id="star" name="star">
									<a class="aa" href="#" value="1">★</a>
									<a class="aa"  href="#" value="2">★</a> 
									<a class="aa"  href="#" value="3">★</a> 
									<a class="aa"  href="#" value="4">★</a> 
									<a class="aa"  href="#" value="5">★</a>
								<p>
					</div>
					<div class="review_id">
								<textarea name="c_campingreview" id="c_campingreview2"></textarea>
					</div>
					<div>
								<input type="hidden" id="c_cam_no"  name="c_cam_no" value="${places.cam_no }"> 
								<input type="hidden" id="cam_no"  name="cam_no" value="${places.cam_no }"> 
								<input type="hidden" id="c_u_id"  name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
								<input type="hidden" id="c_campingstar"  name="c_campingstar" value=""/>
								<input type="hidden" id="cr_cam_no"  name="cr_cam_no" value="${places.cam_no }"/>
								<input type="hidden" id="r_cam_no"  name="r_cam_no" value="${places.cam_no }"/>
								<input type="hidden" id="r_u_id"  name="r_u_id" value="${sessionScope.loginMember.u_id}"/>
								<input type="hidden" id="h_cam_no"  name="h_cam_no" value="${places.cam_no }"/>
								<input type="hidden" id="h_u_id"  name="h_u_id" value="${sessionScope.loginMember.u_id}"/>
								<button type="button" onclick="reviewCheck2()">등록</button>
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
					<td style="cursor:pointer;" class="pr_reviewselect2" onclick="reviewupdate_place('${r.c_no}','${r.c_campingreview }','${places.cam_no }','${sessionScope.loginMember.u_id}')">수정</td>
					<td style="cursor:pointer;" class="pr_reviewselect2"  onclick="reviewdelete_place('${r.c_no}','${places.cam_no }','${sessionScope.loginMember.u_id}')">삭제</td>
				</c:if>
				</tr>
				
				
						<!-- 사장님 답글 select -->
						<c:forEach var="reply" items="${reply}">
						<c:if test="${r.c_no==reply.cr_c_no }">
							<tr class="reply_boss">			
								<td align="center">└ 사장님</td>
								<td>${reply.cr_replytxt }</td>
				 				<td><fmt:formatDate value="${reply.cr_date }" dateStyle="short"/></td>
								<td>
								<c:if test="${sessionScope.loginMember2.bo_id == reply.cr_bo_id}">
										<button onclick="replyupdate(${reply.cr_no},'${reply.cr_replytxt }',${reply.cr_cam_no });">수정</button>
										<button onclick="replydelete(${reply.cr_no},${reply.cr_cam_no },${reply.cr_c_no });">삭제</button>
								</c:if>
				 				</td>
							</tr>
						</c:if>
						</c:forEach>
				
				<!-- 사장님 답글 insert-->
					<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
						<form action="replytxt.Reg" name="replyForm" onsubmit="return replyCheck();">
									<tr>
										<td>ID : ${sessionScope.loginMember2.bo_id}</td>
										<td>
											<textarea cols="100" name="cr_replytxt" id="cr_replytxt"></textarea>
										</td>
										<td align="left">
											<input type="hidden" name="cr_c_no" value="${r.c_no }"> 
											<input type="hidden" name="cr_cam_no" value="${places.cam_no }"> 
											<input type="hidden" name="cr_bo_id" value="${sessionScope.loginMember2.bo_id}">
											<input type="hidden" name="cam_no" value="${places.cam_no }">
											<input type="hidden" name="c_cam_no" value="${places.cam_no }">
											<button>등록</button>
										</td>
									</tr>
							</form>
						</c:if>
						
						
				</c:forEach>
			</table>
				
	
<hr size="3">
	<h2 class="detail_h2">캠핑장 위치</h2>
<hr><br> 
	<div class="wrap_content">
    <div class="wrap_map" style="margin-left: 300px;">
        <div id="map" style="width:100%;height:100%"></div> 
        <div class="wrap_button">
            <a href="javascript:;" class="btn_comm btn_linkMap" target="_blank" onclick="moveKakaoMap(this)"><span class="screen_out">지도 크게보기</span></a> 
            <a href="javascript:;" class="btn_comm btn_resetMap" onclick="resetKakaoMap()"><span class="screen_out">지도 초기화</span></a> 
        </div>
    </div>
    </div>
    <div class="wrap_roadview" style="margin-left: 300px;">
        <div id="roadview" style="width:100%;height:100%"></div>
        <div class="wrap_button">
            <a href="javascript:;" class="btn_comm btn_linkRoadview" target="_blank" onclick="moveKakaoRoadview(this)"><span class="screen_out">로드뷰 크게보기</span></a> 
            <a href="javascript:;" class="btn_comm btn_resetRoadview" onclick="resetRoadview()"><span class="screen_out">로드뷰 크게보기</span></a> 
    </div>
</div>
<script>
var mapContainer = document.getElementById('map'), 
    mapCenter = new kakao.maps.LatLng(${places.cam_latitude} , ${places.cam_longitude}), 
    mapOption = {
        center: mapCenter, 
        level: 4 
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

var rvContainer = document.getElementById('roadview'); 
var rv = new kakao.maps.Roadview(rvContainer); 
var rc = new kakao.maps.RoadviewClient(); 
var rvResetValue = {} 
rc.getNearestPanoId(mapCenter, 50, function(panoId) {
    rv.setPanoId(panoId, mapCenter);
    rvResetValue.panoId = panoId;
});

kakao.maps.event.addListener(rv, 'init', function() {

    var rMarker = new kakao.maps.Marker({
        position: mapCenter,
        map: rv 
    });

    var rLabel = new kakao.maps.InfoWindow({
        position: mapCenter,
        content: '${places.cam_name }'
    });
    rLabel.open(rv, rMarker);

    var projection = rv.getProjection(); 
    
    var viewpoint = projection.viewpointFromCoords(rMarker.getPosition(), rMarker.getAltitude());
    rv.setViewpoint(viewpoint); 

    rvResetValue.pan = viewpoint.pan;
    rvResetValue.tilt = viewpoint.tilt;
    rvResetValue.zoom = viewpoint.zoom;
});

function moveKakaoMap(self){
    
    var center = map.getCenter(), 
        lat = center.getLat(),
        lng = center.getLng();

    self.href = 'https://map.kakao.com/link/map/' + encodeURIComponent('${places.cam_name }') + ',' + lat + ',' + lng; 
}

function resetKakaoMap(){
    map.setCenter(mapCenter); 
    map.setLevel(mapOption.level);
}

function moveKakaoRoadview(self){
    var panoId = rv.getPanoId(); 
    var viewpoint = rv.getViewpoint(); 
    self.href = 'https://map.kakao.com/?panoid='+panoId+'&pan='+viewpoint.pan+'&tilt='+viewpoint.tilt+'&zoom='+viewpoint.zoom; 
}

function resetRoadview(){
    rv.setViewpoint({
        pan: rvResetValue.pan, tilt: rvResetValue.tilt, zoom: rvResetValue.zoom
    });
    rv.setPanoId(rvResetValue.panoId);
}
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function() {
	$('#star a').click(function(){ 
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
	});
});

$(function() {
	  $( "input[name='checkin']" ).datepicker();
	});
$(function() {
	  $( "input[name='checkout']" ).datepicker();
	});
	
</script>
<style type="text/css">
#star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: red;
  } 
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
${result }
<br>
<div style="float:left">
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
			<td><fmt:formatNumber value="${places.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${places.cam_address }</td>			
			<td><img src="resources/img/${places.cam_picture }" width="300" height="200"></td>
		
		<!-- 자신의 아이디일 경우 -->
		<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
			<td><button onclick="placedelete(${places.cam_no});">삭제</button></td>
			<td><button onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button></td>
		</c:if>
	</tr>
</table>
</div>

<div style="float:right">
<c:if test=""></c:if>
<form action="review.Reg">
<table border="1" style="width:500;">
	<tr>
		<td>ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</td> 
		<td>별점
			<p id="star"> <!-- 부모 -->
			   <a href="#"><input type="hidden" name="c_campingstar" value="1">★</a> <!-- 자식들-->
			   <a href="#"><input type="hidden" name="c_campingstar" value="2">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="3">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="4">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="5">★</a>
			   
			<p>
		</td>	
		<td width="200" height="100"><textarea name="c_campingreview"></textarea></td>
	
		<td>
			<input type="hidden" name="c_cam_no" value="${places.cam_no }">
			<input type="hidden" name="cam_no" value="${places.cam_no }">
			<input type="hidden" name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
			<input onclick="return star" type="submit" name="submit" value="등록">
		</td>
	</tr>
</table>

</form>

<table border="1" style="width:500;" >
	<c:forEach var="r" items="${reviews}">
	<tr>
		<td width="50"align="center">${r.c_u_id }</td>
		<td width="200" height="50">${r.c_campingreview }</td>
		<td width="50" align="center">${r.c_campingstar }</td>
		
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

<table border="1">
	<tr>
		<td>체크인</td>
		<td>체크아웃</td>
	</tr>
	<tr>
		<td><input name="checkin" autocomplete="off" readonly="readonly" value="r_campingstartdate"></td>
		<td><input name="checkout" autocomplete="off" readonly="readonly" value="r_campingenddate"></td>
	</tr>
	<tr>
		<td>인원</td>
		<td><input type="number" min="0" max="10" value="r_campingheadcount"></td>
	</tr>
</table>
<button>예약하기</button>
<button id="check_module" type="button">결제하기</button>
<script>
$("#check_module").click(function () {
var IMP = window.IMP; 
IMP.init('imp46581722');

IMP.request_pay({
pg: 'inicis', 

pay_method: 'card',

merchant_uid: 'merchant_' + new Date().getTime(),

name: 'cam_name',

amount: r_campingheadcount * cam_price,

buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'

}, function (rsp) {
console.log(rsp);
if (rsp.success) { //if ~ 결제성공하면
var msg = '결제가 완료되었습니다.';
} else {
var msg = '결제에 실패하였습니다.';
//msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
</script>



</body>
</html>
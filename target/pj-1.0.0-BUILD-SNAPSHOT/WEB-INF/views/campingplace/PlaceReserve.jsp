<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function() {
$("#check_module").click(function () {
	var IMP = window.IMP; 
	IMP.init('imp46581722');

	IMP.request_pay({
	pg: 'inicis', 

	pay_method: 'card',

	merchant_uid: 'merchant_' + new Date().getTime(),

	name: '${param.r_cam_name }',

	amount: '${diffDays}' * '${param.headcount}' * '${param.r_campingprice }',

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
	location.href='reserve.insert?r_cam_no=${param.r_cam_no }&r_u_id=${param.r_u_id }&r_u_name=${param.r_u_name }&r_u_phonenumber=${param.r_u_phonenumber }&r_cam_name=${param.r_cam_name }'
                  + '&r_campingstartdate11=${param.start }&r_campingenddate11=${param.end }&r_campingheadcount=${param.headcount }&r_campingprice=${diffDays * param.headcount * param.cam_price }'
                  + '&r_cam_phonenumber=${param.r_cam_phonenumber }&r_cam_address=${param.r_cam_address }'
	} else {
	var msg = '결제에 실패하였습니다.';
	//msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h1 class="order_h1"><i class="fa-solid fa-credit-card" style="color:#49599a;"></i>&nbsp;<span class="order_span1">고캠핑 <b> 예약/결제</b></span></h1>
<br>
<div class="order_div">
<h2 class="order_recipient">Product Info <span class="order_info">상품 정보</span></h2>
<table border="1" class="order_table1" id="information_table" name="information_table">

	<tr>
		<td colspan="2" class="order_font">숙소</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font">${param.r_cam_name }</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font">주소</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font">${param.r_cam_address }</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font">캠핑장 연락처</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font">${param.r_cam_phonenumber }</td>
	</tr>
	<tr>
		<td colspan="2" class="order_font"> ${param.start } ~ ${param.end }</td>
	</tr>
	<tr>
		<td class="order_font">인원</td>
		<td class="order_font">${param.headcount } 명</td>
	</tr>
	<tr>
		<td class="order_font">가격</td>
		<td class="order_font">${diffDays * param.headcount * param.r_campingprice } 원</td>
	</tr>
</table>


<h2 class="order_recipient">Reservation Info <span class="order_info">예약자 정보</span></h2>
<table border="1" class="order_table3" id="information_table" name="information_table">
	<tr>
		<td class="order_font">성명</td>
	</tr>
	<tr>
		<td align="center">${param.r_u_name }</td>
	</tr>
	<tr>
		<td class="order_font">연락처</td>
	</tr>
	<tr>
		<td align="center">${param.r_u_phonenumber }</td>
	</tr>
</table>
<br>
<button class="order_paymentbtn" id="check_module" type="button">결제하기</button>
</div>
</body>
</html>
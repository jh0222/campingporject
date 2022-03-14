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
function call_kakao2() {
	let campingprice = $(".r_campingprice").val();
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
                  + '&r_campingstartdate11=${param.start }&r_campingenddate11=${param.end }&r_campingheadcount=${param.headcount }&r_campingprice='+campingprice
                  + '&r_cam_phonenumber=${param.r_cam_phonenumber }&r_cam_address=${param.r_cam_address }'
	} else {
	var msg = '결제에 실패하였습니다.';
	//msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
});
}
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
			<td colspan="2" class="order_font2" align="center">${param.r_cam_name }</td>
		</tr>
		<tr>
			<td colspan="2" class="order_font">주소</td>
		</tr>
		<tr>
			<td colspan="2" class="order_font2" align="center">${param.r_cam_address }</td>
		</tr>
		<tr>
			<td colspan="2" class="order_font">캠핑장 연락처</td>
		</tr>
		<tr>
			<td colspan="2" class="order_font2" align="center">${param.r_cam_phonenumber }</td>
		</tr>
		<tr>
			<td colspan="2" class="order_font2" align="center"> ${param.start } ~ ${param.end }</td>
		</tr>
		<tr>
			<td class="order_font">인원</td>
			<td class="order_font2">${param.headcount } 명</td>
		</tr>
		<tr>
			<td class="order_font">가격</td>
			<td class="order_font2">
			<fmt:formatNumber value="${diffDays * param.headcount * param.r_campingprice }"  pattern="###,###,###" type="currency"/>
			 원</td>
		</tr>
	</table>
	
	
	<h2 class="order_recipient">Reservation Info <span class="order_info">예약자 정보</span></h2>
	<table border="1" class="order_table3" id="information_table" name="information_table">
		<tr>
			<td class="order_font">성명</td>
		</tr>
		<tr>
			<td class="order_font2" align="center">${param.r_u_name }</td>
		</tr>
		<tr>
			<td class="order_font">연락처</td>
		</tr>
		<tr>
			<td align="center" class="order_font2">${param.r_u_phonenumber }</td>
		</tr>
	</table>
	<br>
	<div class="order_text">
	취소 수수료는 체크인(숙박일) 날짜 기준으로 발생됩니다.<br>
	<br>
	· 1일 전 23:59 부터 취소 시 환불불가
	· 2일 전 23:59 ~ 1일 23:59 전 취소 시 70% 취소 수수료 발생<br>
	· 3일 전 23:59 ~ 2일 23:59 전 취소 시 50% 취소 수수료 발생<br>
	· 4일 전 23:59 ~ 3일 23:59 전 취소 시 30% 취소 수수료 발생<br>
	· 5일 전 23:59 ~ 4일 23:59 전 취소 시 20% 취소 수수료 발생<br>
	· 6일 전 23:59 ~ 5일 23:59 전 취소 시 15% 취소 수수료 발생<br>
	· 7일 전 23:59 ~ 6일 23:59 전 취소 시 10% 취소 수수료 발생<br>
	· 7일 23:59 전 취소 시 전액환불<br>
	</div>
	<br>
	<div class="order_text">
	· 추가인원 비용등의 현장결제 발생 상품을 확인하세요.<br>
	· 취소 및 환불규정에 따라 취소불가, 수수료가 발생 할 수 있습니다.<br>
	· 미성년자는 법정대리인 동행 없이 투숙이 불가능합니다.<br>
	</div>
	 <br>
	
	<table border="1" class="order_table3">
        <thead>
            <tr>
                <td class="order_checkbox"><input type="checkbox" id="cbx_chkAll"></td>
                <td class="order_checkbox2"><b>필수 항목 전체 동의하기</b></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk01" value="1"></td>
                <td colspan="2" class="order_checkbox2">[필수] 개인정보 수집 및 이용 동의 
                <a onclick="showPopup1();" /><u/><small/>약관보기</a></td>
            </tr>
            <tr>
                <td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk02" value="2"></td>
                <td class="order_checkbox2">[필수] 개인정보 제 3자 제공 동의 
                <a onclick="showPopup2();" /><u/><small/>약관보기</a></td>
            </tr>
            <tr>
                <td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk03" value="3"></td>
                <td class="order_checkbox2">[필수] 전자결제대행 이용 동의 
                <a onclick="showPopup3();" /><u/><small/>약관보기</a></td>
            </tr>
            <tr>
                <td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk04" value="4"></td>
                <td class="order_checkbox2">[필수] 상품정보, 거래조건 확인 및 구매 진행 동의</td> 
            </tr>
        </tbody>
    </table>
		<br>
	<button id="check_module" class="order_paymentbtn" onclick="return CheckFrom1(this)">
	<input type="hidden" value="${diffDays * param.headcount * param.r_campingprice }" class="r_campingprice">
	<fmt:formatNumber value="${diffDays * param.headcount * param.r_campingprice }" pattern="###,###,###" type="currency"/>
	원 결제하기</button>
	 	
	 <br>
	<div class="order_text">	
	고캠핑은 통신판매중개업자로서, 통신판매의 당사자가 아니라는 사실을 고지하며 상품의 결제, 이용 및 환불 등과 관련한 <br>
	의무와 책임은 각 판매자에게 있습니다.<br>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h1 class="order_h1"><i class="fa-solid fa-credit-card" style="color:#49599a;"></i>&nbsp;<span class="order_span1">밀키트 <b> 주문/결제</b></span></h1>
<br>
<div class="order_div">
<h2 class="order_recipient">Recipient Info <span class="order_info">수령자 정보</span></h2>
<table border="1" class="order_table1" id="information_table" name="information_table">
		<tr>
			<td class="order_font">배송지 선택</td>
			<td colspan="2" class="order_font2"><input type="checkbox" checked="checked" name="offline1" id="offline1" onclick="addrCheck(this);"/> ${sessionScope.loginMember2.bo_name }${sessionScope.loginMember.u_name }님 배송지 <input type="checkbox" name="offline1" id="offline2" onclick="addrCheck(this);"/> 신규 배송지 </td>		
      	</tr>
		<tr>
			<td class="order_font">수령인</td>
			<td colspan="2" class="order_font2"><input name="recipient" id="recipient" size="20" value="${sessionScope.loginMember2.bo_name }${sessionScope.loginMember.u_name }"></td>		
			
		</tr>
		<tr>
			<td class="order_font">휴대전화</td>
			<td colspan="2" class="order_font2"><input name="phonenumber" id="phonenumber" size="20" value="${sessionScope.loginMember2.bo_phonenumber }${sessionScope.loginMember.u_phonenumber }"></td>		
		</tr>
		<tr>
			<td id="addrname" class="order_font">배송지 주소</td>
			<td colspan="2" class="order_font2"><input name="addr" id="addr" size="61" value="${sessionScope.loginMember2.bo_address }${sessionScope.loginMember.u_address }"></td>		
		</tr>

		<tr>
			<td class="order_font">배송 메모</td>
			<td colspan="2" class="order_font2"><select id="addrmsg">
    						<option>배송 시 요청사항을 선택해주세요</option>
    						<option>부재 시 경비실에 맡겨주세요</option>
   							<option>부재 시 택배함에 넣어주세요</option>
    						<option>부재 시 집앞에 놔주세요</option>
    						<option>배송 전 연락바랍니다.</option>
							</select>
							&nbsp;<input id="addrtext" size="30"></td>		
		</tr>
		
</table>

<table border="1" id="addrtable" class="order_table2" style="display: none;">
<tr>
<td class="order_font3" style="width: 132px; border-right: 1px solid;">신규 배송지</td>
<td class="order_newadrr" colspan="2">
		<div style="margin-left: 25px;">
			<input id="addr3Input" readonly="readonly" name="u_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
			<span id="addrSearchBtn">[검색]</span><br>
			<input id="addr1Input" readonly="readonly" name="u_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
			<input name="u_addr2" id="u_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
		</td>
		</div>
</tr>		
</table>

<h2 class="order_recipient">Product Info<span class="order_info"> 밀키트 정보</span></h2>
<table border="1" class="order_table3">
<tr>
<td rowspan="3" width="150px;"><img src="resources/img/${fp.fp_picture }" width="150px;" height="150px;"></td>
<td class="order_productinfo">상품번호</td><td class="order_productinfo">상품명</td><td class="order_productinfo">수량</td><td class="order_productinfo">배송비</td><td class="order_productinfo">주문금액</td>
</tr>
<tr>
<td rowspan="2" width="100px;" class="order_productinfo">${fp.fp_no }</td><td class="order_productinfo">${fp.fp_name }</td><td class="order_productinfo">${mso.amount}</td><td class="order_productinfo">무료</td><td class="order_productinfo"><fmt:formatNumber value="${mso.sum}"  pattern="###,###,###" />원</td>
</tr>
</table>
<div class="order_text">
· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.<br>
· 고캠핑은 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함  <b>전 지역, 전 상품 무료배송</b>입니다.<br>
· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
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
				<td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk1" value="1"></td>
				<td colspan="2" class="order_checkbox2">[필수] 개인정보 수집 및 이용 동의 
				<a onclick="showPopup1();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk2" value="2"></td>
				<td class="order_checkbox2">[필수] 개인정보 제 3자 제공 동의 
				<a onclick="showPopup2();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk3" value="3"></td>
				<td class="order_checkbox2">[필수] 전자결제대행 이용 동의 
				<a onclick="showPopup3();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td class="order_checkbox"><input type="checkbox" class="chkclass" id="chk4" value="4"></td>
				<td class="order_checkbox2">[필수] 상품정보, 거래조건 확인 및 구매 진행 동의</td> 
			</tr>
		</tbody>
	</table>
	<br>
<button id="check_module" class="order_paymentbtn" onclick="return CheckForm(this)"><fmt:formatNumber value="${mso.sum}"  pattern="###,###,###" />원 결제하기</button>
 <br><br>
<div class="order_text">	
· 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.<br>
· 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.<br>
· 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.<br>
</div>
</div>

<!-- 결제하기 -->
<script>
function call_kakao() {
	


var IMP = window.IMP; // 생략가능
IMP.init('imp46581722');
IMP.request_pay({
pg: 'inicis', 
pay_method: 'card',
merchant_uid: 'merchant_' + new Date().getTime(),
//https://docs.iamport.kr/implementation/payment

name: '상품명:${fp.fp_name}',
amount: ${mso.sum} ,
//가격
}, function (rsp) {
console.log(rsp);
if (rsp.success) { //if 결제성공하면
var msg = '결제가 완료되었습니다.';
let new_addr1 = document.getElementById('u_addr2').value;
let new_addr = document.getElementById('addr1Input').value;
let new_addr3 = document.getElementById('addr3Input').value;
location.href='reg.milkitbuy?fb_u_bo_id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }&fb_fp_no=${fp.fp_no }&fb_fp_name=${fp.fp_name }&fb_price=${mso.sum}&fb_number=${mso.amount}&fb_u_address=${sessionScope.loginMember2.bo_address }${sessionScope.loginMember.u_address }&fb_new_address=' + new_addr + new_addr1 + new_addr3;
}else {
var msg = '결제에 실패하였습니다.';
//alert('[에러]'+rsp.error_msg);
}
alert(msg);
});
}
</script>
</body>
</html>
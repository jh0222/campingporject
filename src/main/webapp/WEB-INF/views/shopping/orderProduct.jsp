<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
//체크박스 클릭에 따라 배송지 보여주기
$(document).ready(function(){
	let chkOk = true;
	$("#offline2").change(function(){
			$("#addr").prop('disabled', true); //비활성화
			if(chkOk){//true이면
	           $("#addrtable").show();
	           chkOk = false;
	        }else{
	           $("#addrtable").hide();
	           chkOk = true;
	        }
	    });
	$("#offline1").change(function(){
		$("#addr").prop('disabled', false);	//활성화
		window.location.reload(); //새로고침
		chkOk = true;
		if(chkOk){
           $("#addrtable").hide();
           chkOk = true;
        }else{
        	$("#addrtable").show();
            chkOk = false;
        }
    });

});

//체크박스 유효성(미완)
function button1_click() {
		alert("에러문구를 표시"); 
}

//체크박스 중복방지
function addrCheck(chk){
    var obj = document.getElementsByName("offline1");//name값
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){ 
            obj[i].checked = false;
        }
        if(obj[i] = chk){
        	obj[i].cheked = true;
        }
    }
}


</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>수령자 정보</h2>
<table border="1" style="width:500px; height:auto; border-collapse: collapse"; id="information_table" name="information_table">
		<tr>
			<td>배송지 선택</td>
			<td colspan="2"><input type="checkbox" checked="checked" name="offline1" id="offline1" onclick="addrCheck(this);"/>${sessionScope.loginMember2.bo_name }${sessionScope.loginMember.u_name }님 배송지 <input type="checkbox" name="offline1" id="offline2" onclick="addrCheck(this);"/>신규 배송지 </td>		
      	</tr>
		<tr>
			<td>수령인</td>
			<td colspan="2"><input name="recipient" id="recipient" value="${sessionScope.loginMember2.bo_name }${sessionScope.loginMember.u_name }"></td>		
			
		</tr>
		<tr>
			<td>휴대전화</td>
			<td colspan="2"><input name="phonenumber" id="phonenumber" value="${sessionScope.loginMember2.bo_phonenumber }${sessionScope.loginMember.u_phonenumber }"></td>		
		</tr>
		<tr>
			<td id="addrname">배송지 주소</td>
			<td colspan="2"><input name="addr" id="addr" value="${sessionScope.loginMember2.bo_address }${sessionScope.loginMember.u_address }"></td>		
		</tr>
		<tr>
			<td>배송 메모</td>
			<td colspan="2"><select id="addrmsg">
    						<option>배송 시 요청사항을 선택해주세요</option>
    						<option>부재 시 경비실에 맡겨주세요</option>
   							<option>부재 시 택배함에 넣어주세요</option>
    						<option>부재 시 집앞에 놔주세요</option>
    						<option>배송 전 연락바랍니다.</option>
							</select>
							<input id="addrtext"></td>		
		</tr>
		
</table>
<table border="1" id="addrtable" style="display: none;">
<tr>
<td class="td2" colspan="2">주소:
			<input id="addr3Input" readonly="readonly" name="u_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
			<span id="addrSearchBtn">[검색]</span><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="addr1Input" readonly="readonly" name="u_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="u_addr2" id="u_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
		</td>
</tr>		
</table>

<h2>상품 정보</h2>
<table border="1">
<tr>
<td rowspan="3"><img src="resources/img/${p.p_picture }" width="200px;" height="auto"></td>
<td>상품번호</td><td>상품명</td><td>수량</td><td>배송비</td><td>주문금액</td>
</tr>
<tr>
<td rowspan="2">${p.p_no }</td><td>${p.p_name }</td><td>${so.amount}</td><td>무료</td><td><fmt:formatNumber value="${so.sum}"  pattern="###,###,###" />원</td>
</tr>
</table>
· 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.<br>
· 캠핑쇼핑몰은 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함  <b>전 지역, 전 상품 무료배송</b>입니다.<br>
· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>


<table border="1">
		<thead>
			<tr>
				<td><input type="checkbox" id="cbx_chkAll"></td>
				<td><b>필수 항목 전체 동의하기</b></td>
			</tr>	
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="chk" value="1"></td>
				<td colspan="2">[필수] 개인정보 수집 및 이용 동의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="showPopup1();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="chk" value="2"></td>
				<td>[필수] 개인정보 제 3자 제공 동의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="showPopup2();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="chk" value="3"></td>
				<td>[필수] 전자결제대행 이용 동의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="showPopup3();" /><u/><small/>약관보기</a></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="chk" value="4"></td>
				<td>[필수] 상품정보, 거래조건 확인 및 구매 진행 동의</td> 
			</tr>
		</tbody>
	</table>
<button id="check_module" type="button" onclick="">결제하기</button>
	
· 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.<br>
· 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.<br>
· 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.<br>


<!-- 결제하기 -->
<script>

//let new_addr = document.form.u_addr1+u_addr2+u_addr3.value;
/*
function button1(){
if (!$("input:checked[name='chk']").is(":checked")){ 
	alert("에러문구를 표시");		
}
}
*/
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp46581722');
IMP.request_pay({
pg: 'inicis', 
pay_method: 'card',
merchant_uid: 'merchant_' + new Date().getTime(),
//https://docs.iamport.kr/implementation/payment

name: '상품명:${p.p_name}',
amount: ${so.sum} ,
//가격
}, function (rsp) {
console.log(rsp);
if (rsp.success) { //if 결제성공하면
var msg = '결제가 완료되었습니다.';
let new_addr1 = document.getElementById('u_addr2').value;
let new_addr = document.getElementById('addr1Input').value;
let new_addr3 = document.getElementById('addr3Input').value;
location.href='reg.productbuy?b_u_bo_id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }&b_p_no=${p.p_no }&b_p_name=${p.p_name }&b_price=${so.sum}&b_number=${so.amount}&b_u_address=${sessionScope.loginMember2.bo_address }${sessionScope.loginMember.u_address }&b_new_address=' + new_addr + new_addr1 + new_addr3;
}else {
var msg = '결제에 실패하였습니다.';
//alert('[에러]'+rsp.error_msg);
}
alert(msg);
});
});

</script>


</body>
</html>
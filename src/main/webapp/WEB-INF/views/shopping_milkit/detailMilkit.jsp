<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function delreviewmilkit(no) {
	let d = confirm('리뷰를 삭제하시겠습니까?');			
	if(d) {
		location.href = "del.milkitreview?fpr_no=" + no + "&fp_no=" + ${fp.fp_no} + "&fpr_fp_no=" + ${fp.fp_no};
	}
}

function updatereviewmilkit(no,t) {
	let txt = prompt("수정할 내용을 적어주세요",t);
	if(txt != ""){
		location.href = "update.milkitreview?fpr_no=" + no + "&fpr_txt=" + txt + "&fp_no=" + ${fp.fp_no} + "&fpr_fp_no=" + ${fp.fp_no};
	}
}
  
//수량+합계
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function plus () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function minus () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

//주문하기 + 장바구니
  function mySubmit(index) {
    if (index == 3) {
      document.form.method = 'GET'	
      document.form.action='ordermilkit.go?fp_no=${fp.fp_no}&fp_name=${fp.fp_name}&fp_price=${fp.fp_price }&fp_picture=${fp.fp_picture }&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }';
      document.form.submit();
    }
    if (index == 4) {
       if(confirm("상품을 장바구니에 추가하시겠습니까?")) {	
    	let price = document.getElementById('sum').value; //id값   
    	let amount = document.form.amount.value; //name값
    	
	
    	document.form.method = 'POST'
    	document.form.action='reg.milkitbasket?fba_fp_no=${fp.fp_no}&fba_fp_name=${fp.fp_name}&fba_price='+price+'&fba_fp_picture=${fp.fp_picture }&fba_u_bo_id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }&fba_number='+amount;
    	document.form.submit();
       }else {
    	//document.form.reset();
     window.location.reload();
    }
    }
    
  }

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="init();">
	<table border="0" width="100%">

		<h2>상품 상세정보</h2>
		<td>
			<table border="0">
				<tr>
					<td><img src="resources/img/${fp.fp_picture }" width="90%"
						height="auto"></td>
				<tr>
			</table>
		</td>

		<td>
			<table border="1"
				style='width: 450px; table-layout: fixed; word-break: break-all; height: auto; position: top;'>
				<tr align="center">
					<td>상품명</td>
					<td>${fp.fp_name }</td>
				</tr>
				<tr align="center">
					<td>가격</td>
					<td><fmt:formatNumber value="${fp.fp_price }"
							pattern="###,###,###" /></td>
				</tr>
				<tr align="center">
					<td>상품소개</td>
					<td>${fp.fp_txt }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button
							onClick="location.href='updatemilkit.go?fp_no=${fp.fp_no}&fp_name=${fp.fp_name}&fp_picture=${fp.fp_picture }&fp_price=${fp.fp_price }&fp_txt=${fp.fp_txt }&fpr_fp_no=${fp.fp_no}'">수정하기</button>
					</td>

				</tr>

			</table> <!------------------------------------------------------------------------------------>

			<form name="form" method="GET" enctype="multipart/form-data">
				<table border="1" style="border-collapse: collapse">
					<tr>
						<td align="center">
							<table border="1" style="border-collapse: collapse">
								<tr>
									<td>
								수량 : <input type=hidden name="sell_price" value="${fp.fp_price }">
									 <input type="text" name="amount" value="1" size="3" onchange="change();">
									 <input type="button" value=" + " onclick="plus();"><input type="button" value=" - " onclick="minus();"><br>
								금액 : <input type="text" name="sum" id="sum" size="11" readonly>원
									 <input type="hidden" name="fp_no" value="${fp.fp_no}">
									 <input type="hidden" name="fp_name" value="${fp.fp_name}">
									 <input type="hidden" name="fp_price" value="${fp.fp_price }">
									 <input type="hidden" name="fp_picture" value="${fp.fp_picture }">
									 <input type="hidden" name="u_id" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }">
									 
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<input type="button" value="주문하기" onclick='mySubmit(3)' />
									 <input type="button" value="장바구니" onclick='mySubmit(4)' /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</td>
				</table>
			</form>

	<hr size="3">
	<h2>상품 리뷰</h2>

	<jsp:include page="${reviewPage }"></jsp:include>
	<table border="1" style="width: 1107px; margin-left: 167px;">
		<tr>
			<th>no</th>
			<th>ID</th>
			<th>내용</th>
			<th>date</th>
		</tr>

		<c:forEach var="fp" items="${milkitreviews }">
			<tr>
				<td>${fp.fpr_no }</td>
				<td>${fp.fpr_u_bo_id }</td>
				<td>${fp.fpr_txt }</td>
				<td><fmt:formatDate value="${fp.fpr_date }" dateStyle="short" /></td>
				<c:if
					test="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id == fp.fpr_u_bo_id }">
					<td onclick="updatereviewmilkit('${fp.fpr_no}','${fp.fpr_txt }')">수정</td>
					<td onclick="delreviewmilkit(${fp.fpr_no})">삭제</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>





</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
function delreview(no) {
	let d = confirm('리뷰를 삭제하시겠습니까?');
	if(d) {
		location.href = "del.productreview?pr_no=" + no + "&p_no=" + ${p.p_no}  ;
	}
}

function updatereview(no) {
	let txt = prompt("수정할 내용");
	if(txt != ""){
		location.href = "update.productreview?pr_no=" + no + "&pr_txt=" + txt + "&p_no=" + ${p.p_no};
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
					<td><img src="resources/img/${p.p_picture }" width="90%"
					height="auto"></td>
				<tr>
			</table>
		</td>
		
		<td>
				<table border="1" style='width: 450px; table-layout: fixed; word-break: break-all; height: auto; position:top;' >
					<tr align="center">
						<td>상품명</td>
						<td>${p.p_name }</td>
					</tr>
					<tr align="center">
						<td>가격</td>
						<td><fmt:formatNumber value="${p.p_price }"
								pattern="###,###,###" /></td>
					</tr>
					<tr align="center">
						<td>상품소개</td>
						<td>${p.p_txt }</td>
					</tr>
					<tr>
					<td colspan="2" align="center"><button onClick="location.href='orderproduct.go?p_no=${p.p_no}&p_name=${p.p_name}&p_price=${p.p_price }&p_picture=${p.p_picture }&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'">주문하기</button>
					<button onClick="location.href='updateproduct.go?p_no=${p.p_no}&p_name=${p.p_name}&p_picture=${p.p_picture }&p_price=${p.p_price }&p_txt=${p.p_txt }'">수정하기</button>
					<button>장바구니</button></td>
					
					</tr>
					
					</table>
					<table border="1">
					<tr>
					<td align="center"> 
					
					<form name="form" method="get">
					수량 : <input type=hidden name="sell_price" value="${p.p_price }">
					<input type="text" name="amount" value="1" size="3" onchange="change();">
					<input type="button" value=" + " onclick="plus();"><input type="button" value=" - " onclick="minus();"><br>
					금액 : <input type="text" name="sum" size="11" readonly>원
					</form>

					</td>
					</tr>
					</table>
				</table>

				</td>
			</table>
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
		
					<c:forEach var="p" items="${productreviews }">
				<tr>
					<td>${p.pr_no }</td>
					<td>${p.pr_u_id }</td>
					<td>${p.pr_txt }</td>
					<td><fmt:formatDate value="${p.pr_date }" dateStyle="short"/></td>
					<td onclick="updatereview(${p.pr_no})">수정</td>
					<td onclick="delreview(${p.pr_no})">X</td>
				</tr>
					</c:forEach>
			</table>
			
			
			
			
			
</body>
</html>
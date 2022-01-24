<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<table>
				<table border="0"
					style='width: 450px; table-layout: fixed; word-break: break-all; height: auto; position:top;' >
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
					<tr align="center">
						<td colspan="2">
							<form name="form1" method="post" action="">
								<input type="hidden" name="p_no" value="${p.p_no }">
								<select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;
								<button>장바구니 담기</button>
							</form>
							<button id="check_module" type="button">결제하기</button>
							<button onClick="location.href='orderproduct.go?p_no=${p.p_no}'">결제하기2</button>
							

							<button
								onClick="location.href='updateproduct.go?p_no=${p.p_no}&p_name=${p.p_name}&p_picture=${p.p_picture }&p_price=${p.p_price }&p_txt=${p.p_txt }'">수정하기</button>
						</td>
					</tr>
		
				</table>

				</td>
			</table>
			<hr size="3">
			<h2>상품 리뷰</h2>
			<table border="1">
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
					<td><fmt:formatDate value="${p.pr_date }" dateStyle="short"/></td> <!-- 날짜기입 -->
				</tr>
					</c:forEach>
			</table>
			</table>
			
			
			
			
			<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp46581722');
IMP.request_pay({
pg: 'inicis', 
pay_method: 'card',
merchant_uid: 'merchant_' + new Date().getTime(),
//https://docs.iamport.kr/implementation/payment

name: '주문명:${p.p_name}',
amount: ${p.p_price},
//가격
}, function (rsp) {
console.log(rsp);
if (rsp.success) { //if 결제성공하면
var msg = '결제가 완료되었습니다.';
//alert('[결제금액:]'+rsp.paid_amount);
} else { //else 결제실패하면
var msg = '결제에 실패하였습니다.';
//alert('[에러]'+rsp.error_msg);
}
alert(msg);
});
});
</script>
			
</body>
</html>
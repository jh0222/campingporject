<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous">
</script><!-- jQuery CDN --->
<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "{pbuylist.b_p_no}", // 환불할 물건 번호
        "cancel_request_amount": "{pbuylist.b_price}", // 환불 금액
        "reason": "테스트 결제 환불" // 환불사유
        "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
      }),
      "dataType": "json"
    });
  }
</script>
</head>
<body>
	<jsp:include page="${BossCommunities }"></jsp:include>
	캠핑 용품 구매목록
	<table border="1">
				<c:forEach var="p" items="${pbuylist }">
				<tr>
					<td>상품번호</td>
					<td>상품명</td>
					<td>상품수량</td>
					<td>구매가격</td>
					<td>구매주소지</td>
					<td>구매날짜</td>
					<td colspan="2" align="center">취소/환불</td>
				</tr>
					<c:choose>
			<c:when test="${p.b_p_no eq null}">
				<h1>예약된 내용이 없습니다.</h1>
			</c:when>
			<c:otherwise>
					<tr>
						<td>${p.b_p_no }</td>
						<td>${p.b_p_name }</td>
						<td>${p.b_number }</td>
						<td>${p.b_number * p.b_price}</td>
						<c:choose>
							<c:when test="${p.b_new_address !=null}">
								<td>${p.b_new_address}</td>
							</c:when>
							<c:otherwise>
								<td>${p.b_u_address}</td>
							</c:otherwise>
						</c:choose>
						<td><fmt:formatDate value="${p.b_date }" /></td>
						<td><button	onclick="camcelPay()">취소/환불</button></td>
					</tr>
			</c:otherwise>
		</c:choose>
		</c:forEach>
	</table>

	<br> 밀키트 구매목록

	<c:forEach var="p" items="${mbuylist }">
		<table border="1">
					<tr>
						<td>상품번호</td>
						<td>상품명</td>
						<td>상품수량</td>
						<td>구매가격</td>
						<td>구매주소지</td>
						<td>구매날짜</td>

					</tr>
			<c:choose>
				<c:when test="${p.fb_p_no eq null}">
					<h1>예약된 내용이 없습니다.</h1>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${p.fb_p_no }</td>
						<td>${p.fb_p_name }</td>
						<td>${p.fb_number }</td>
						<td>${p.fb_number * p.fb_price}</td>
						<c:choose>
							<c:when test="${p.fb_new_address !=null}">
								<td>${p.fb_new_address}</td>
							</c:when>
							<c:otherwise>
								<td>${p.fb_u_address}</td>
							</c:otherwise>
						</c:choose>
						<td><fmt:formatDate value="${p.fb_date }" /></td>
						<td><button
								onclick="buymealdel('${p.fb_no}','${p.fb_u_bo_id }')">취소/환불</button></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</c:forEach>
</body>
</html>
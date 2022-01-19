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
			<table>
				<tr>
					<td><img src="resources/img/${p.p_picture }" width="100%"
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
							<button>구매하기</button>
							<button
								onClick="location.href='updateproduct.go?p_no=${p.p_no}&p_name=${p.p_name}'">수정하기</button>

						</td>
					</tr>
		
				</table>


				<!--  <table>
			<tr>
				<td><img src="resources/img/${p.p_picture }" width="200px";
					height="auto"></td>
			<tr>
		</table>
		</tr>
		</td>
		</tr>
	</table> -->
				</td>
			</table>
			<h2>상품 리뷰</h2>
</body>
</html>
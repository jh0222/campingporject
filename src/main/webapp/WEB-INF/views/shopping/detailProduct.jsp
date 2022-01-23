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
							<button>구매하기</button>
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
			
</body>
</html>
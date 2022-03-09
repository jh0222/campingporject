<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/stylemain.css"> 
<title>Insert title here</title>
</head>
<body>

	<hr>
		<h1 class="rank_h1">캠핑용품 인기순위</h1>
	<hr>
	<div class="more_product">
			<a href="camping.product" class="rank_a">
				더보기>
			</a>
	</div>
	<div>
	<c:forEach var="p" items="${productrank }">
		<table border="0" class="rank_producttable">
			<tr>
				<td style="text-align: center;" class="rank_font"><b>${p.ROWNUM }위</b></td>
			</tr>
			<tr>				
				<td><img src="resources/img/${p.p_picture }" class="shopping_rankimg" width="200" height="200" onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }${sessionScope.loginMember3.root_id }'"></td>
			</tr>
			<tr>
				<td class="rank_font">${p.p_name }</td>
			</tr>
			<tr>
				<td class="rank_font"><fmt:formatNumber value="${p.p_price }" type="currency" />원</td>
			</tr>
		</table>
	</c:forEach>
	
</section>
<hr>
		<h1 class="rank_h1">밀키트 인기순위</h1>
<hr>
	<div class="more_product">
			<a href="camping.milkit" class="rank_a">
				더보기>
			</a>
	</div>
<c:forEach var="fp" items="${milkitrank }">
		<table border="0" class="rank_producttable">
			<tr>
				<td style="text-align: center;" class="rank_font"><b>${fp.ROWNUM }위</b></td>
			</tr>
			<tr>				
				<td><img src="resources/img/${fp.fp_picture }" class="shopping_rankimg"  width="200" height="200" onclick="location.href = 'detail.milkit?fp_no=${fp.fp_no}&fpr_fp_no=${fp.fp_no }&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'"></td>
			</tr>
			<tr>
				<td class="rank_font" >${fp.fp_name }</td>
			</tr>
			<tr>
				<td class="rank_font"><fmt:formatNumber value="${fp.fp_price }" type="currency"/>원</td>
			</tr>
		</table>
	</c:forEach>
	</div>



</body>
</html>
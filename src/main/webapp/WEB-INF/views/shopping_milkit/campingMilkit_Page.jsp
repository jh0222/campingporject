<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트</title>
</head>
<body>
<table style="margin-top: 25px">
		<tr>
			<td>
				<form action="search.milkit">
					<input name="fp_name">
					<button>검색</button>
				</form>
			</td>
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td>
					<button onClick="location.href='regmilkit.go'">상품등록</button>
				</td>
			</c:if>
		</tr>
	</table>
	
	<h3>상품목록</h3>
	
	
	<table border="1" style="position: absolute; width: 100%";>
		<c:set var="i" value="0" />
		<c:set var="j" value="2" />

		<c:forEach var="fp" items="${milkits}">
			<c:if test="${i%j == 0 }">
				<tr>
			</c:if>
			<td><img src="resources/img/${fp.fp_picture }"
				style="width: 120px; height: 110px;"
				onclick="location.href = 'detail.milkit?fp_no=${fp.fp_no}&fpr_fp_no=${fp.fp_no }&MilkitName=${fp.fp_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'"></td>
			<td onclick="location.href = 'detail.milkit?fp_no=${fp.fp_no}&fpr_fp_no=${fp.fp_no }&MilkitName=${fp.fp_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'">${fp.fp_name }</td>

			<td><fmt:formatNumber value="${fp.fp_price}" type="currency" /></td></td>
			
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td><button onclick="m_del(${fp.fp_no})">삭제</button></td>
			</c:if>
			<c:if test="${i%j == j-1 }">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
		</table>

</body>
</html>
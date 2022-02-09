<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품</title>
</head>
<body>
	<table style="margin-top: 25px">
		<tr>
			<td>
				<form action="search.product">
					<input name="p_name">
					<button>검색</button>
				</form>
			</td>
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td>
					<button onClick="location.href='regproduct.go'">상품등록</button>
				</td>
			</c:if>
		</tr>
	</table>

	<h3>상품목록</h3>
	
	<table border="1" style="position: absolute; width: 100%";>
		<c:set var="i" value="0" />
		<c:set var="j" value="2" />

		<c:forEach var="p" items="${products}">
			<c:if test="${i%j == 0 }">
				<tr>
			</c:if>
			<td><img src="resources/img/${p.p_picture }"
				style="width: 120px; height: 110px;"
				onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&ProductName=${p.p_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'"></td>
			<td onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&ProductName=${p.p_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }'">${p.p_name }</td>

			<td><fmt:formatNumber value="${p.p_price}" type="currency" /> </td>
			
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td><button onclick="del(${p.p_no})">삭제</button></td>
			</c:if>
			<c:if test="${i%j == j-1 }">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
		<c:choose>
        <c:when test = "${pg > block}">
            [<a href="camping.product?pg=1">◀◀</a>]
            [<a href="camping.product?pg=${fromPage -1}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
          <c:choose>
               <c:when test = "${i == pg }">
                [${i }]
            </c:when>
              <c:otherwise>
                [<a href="camping.product?pg=${i }">${i }</a>]
               </c:otherwise>
           </c:choose>
    </c:forEach>
    <c:choose>
           <c:when test = "${toPage < allPage }">
               [<a href="camping.product?pg=${toPage + 1}">▶</a>]
            [<a href="camping.product?pg=${allPage}">▶▶</a>]
          </c:when>
         <c:otherwise>
               [<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
           </c:otherwise>
    </c:choose>
</body>
</html>
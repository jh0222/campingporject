<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품</title>
<style>
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:500px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 17s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:300px;}
    .slide li:nth-child(1){background:#f5f5f5;} /*background-image:url(resources/css/xx.jpg);*/
    .slide li:nth-child(2){background:#f5f5f5;}
    .slide li:nth-child(3){background:#f5f5f5;}
    .slide li:nth-child(4){background:#f5f5f5;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
  </style>
</head>
<body>
<div class="p_search">
	<table>
		<tr>
			<td>
				<form action="search.product">
					<input name="p_name">
					<button class="btn btn-light btn-xs">검색</button>
				</form>
			</td>
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td>
					<button class="btn btn-light btn-xs" onClick="location.href='regproduct.go'" id="b">상품등록</button>
				</td>
			</c:if>
		</tr>
	</table>
	</div>
<div class="slide">
    <ul>
      <li><img src="resources/css/shoppingmain/캠핑용품메인1.JPG" style="height: 500px; width: 1300px; display: block; margin: 0px auto;"></li>
      <li><img src="resources/css/shoppingmain/캠핑용품메인2.JPG" style="height: 500px; width: 1300px; display: block; margin: 0px auto;"></li>
      <li><img src="resources/css/shoppingmain/캠핑용품메인3.JPG" style="height: 500px; width: 1300px; display: block; margin: 0px auto;"></li>
      <li><img src="resources/css/shoppingmain/캠핑용품메인4.JPG" style="height: 500px; width: 1300px; display: block; margin: 0px auto;"></li>
    </ul>
  </div>
  
	<h3 class="Product_h3">고캠핑 캠핑용품</h3>

	<c:forEach var="p" items="${products}">
		<table class="table_product ">		
			<tr>
				<td><img src="resources/img/${p.p_picture }"
					class="table_product_picture"
					onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&ProductName=${p.p_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }${sessionScope.loginMember3.root_id }'"></td>
			</tr>	
			
			<tr>
				<td class="table_product_td1" onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&ProductName=${p.p_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }${sessionScope.loginMember3.root_id }'">${p.p_name }</td>
			</tr>		
			<tr>
				<td class="table_product_td2"><fmt:formatNumber value="${p.p_price}" type="currency" /> </td>
			</tr>
			<tr>
				<c:if test="${sessionScope.loginMember3.root_id != null}">
					<td><button onclick="del(${p.p_no})" class="table_product_del">삭제</button></td>
				</c:if>
			</tr>		
		</table>
	</c:forEach>



	<div>
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
    </div>
</body>
</html>
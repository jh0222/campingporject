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
    .slide li:nth-child(1){background:#f5f5f5; background-color: white} /*background-image:url(resources/css/xx.jpg);*/
    .slide li:nth-child(2){background:#f5f5f5; background-color: white}
    .slide li:nth-child(3){background:#f5f5f5; background-color: white}
    .slide li:nth-child(4){background:#f5f5f5; background-color: white}
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
				<form action="search.product" name="shoppingsearch" onsubmit="return SearchCheck1();">
					<input name="p_name" placeholder="&nbsp;상품명 입력" class="main_searchinput">
					<input type="submit" class="main_searchbtn" value="검색"></input>
				</form>
			</td>
			<c:if test="${sessionScope.loginMember3.root_id != null}">
				<td>
					<button class="btn btn-light btn-xs" onClick="location.href='regproduct.go'" id="b" style="background-color: white">상품등록</button>
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
  <div>
	<h3 class="Product_h3"><i class="fa-solid fa-campground"></i>&nbsp;<span class="main_span2">고캠핑 캠핑용품</span></h3>

</div>
	<h4 class="main_click"><i class="fa-solid fa-computer-mouse"></i>&nbsp;상품이미지를 <span class="main_span"><b>클릭</b></span>하면 자세히 볼 수 있어요.</h4>
	
<div>

	<c:forEach var="p" items="${products}">
		<table class="table_product ">		
			<tr>
				<td><img src="resources/img/${p.p_picture }"
					class="table_product_picture"
					onclick="location.href = 'detail.product?p_no=${p.p_no}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }${sessionScope.loginMember3.root_id }'"></td>
			</tr>	
			
			<tr>
				<td class="table_product_td1" onclick="location.href = 'detail.product?p_no=${p.p_no}&pr_p_no=${p.p_no }&ProductName=${p.p_name}&id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }${sessionScope.loginMember3.root_id }'">${p.p_name }</td>
			</tr>		
			<tr>
				<td class="table_product_td2"><fmt:formatNumber value="${p.p_price}" type="currency" /> </td>
				
			</tr>
			<tr>
				<c:if test="${sessionScope.loginMember3.root_id != null}">
					<td><button onclick="del(${p.p_no})" class="table_product_del"><i class="fa-solid fa-trash-can fa-2x" style="color:#707070"></i></button></td>
				</c:if>
				
			</tr>		
		</table>
	</c:forEach>
	</div>



	<div class="campingmain_paging">
		<c:choose>
        <c:when test = "${pg > block}">
            <a href="camping.product?pg=1">◀◀</a>
            <a href="camping.product?pg=${fromPage -1}">◀  </a>
        </c:when>
        <c:otherwise>
            <span style="color:gray;font-size: 20px;">◀◀</span>
            <span style="color:gray;font-size: 20px;">◀  </span>
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
          <c:choose>
               <c:when test = "${i == pg }">
                <span class="paging_num">${i }</span> 
            </c:when>
              <c:otherwise>
                <a href="camping.product?pg=${i }" class="paging_num2">${i }</a>
               </c:otherwise>
           </c:choose>
    </c:forEach>
    <c:choose>
           <c:when test = "${toPage < allPage }">
               <a href="camping.product?pg=${toPage + 1}">  ▶</a>
            <a href="camping.product?pg=${allPage}">▶▶</a>
          </c:when>
         <c:otherwise>
               <span style="color:gray;font-size: 20px;">  ▶</span>
            <span style="color:gray;font-size: 20px;">▶▶</span>
           </c:otherwise>
    </c:choose>
    </div>
</body>
</html>
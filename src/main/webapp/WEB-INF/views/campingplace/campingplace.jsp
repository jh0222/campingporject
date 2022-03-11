<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function place_searchCheck1() {
	var form = document.place_searchForm1;
	if (form.from_p.value == ""){
		alert("가격을 입력하지 않았습니다.");
		form.from_p.focus();
		return false;
	}else if (isNaN(form.from_p.value)) {
		alert("가격은 숫자만 입력 가능합니다.");
		form.from_p.select();
		return false;
	} else if (form.to_p.value == ""){
		alert("가격을 입력하지 않았습니다.");
		form.to_p.focus();
		return false;
	} else if (isNaN(form.to_p.value)) {
		alert("가격은 숫자만 입력 가능합니다.");
		form.to_p.select();
		return false;
	}
}

function place_searchCheck2() {
	var form = document.place_searchForm2;
	if (form.search.value == ""){
		alert("검색어를 입력해 주세요.");
		form.search.focus();
		return false;
	} 
}
</script>
<style type="text/css">
#heart a {
	text-decoration: none;
	color: gray;
}

#heart a.on {
	color: red;
}

*{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:500px;overflow:hidden;margin-top: 15px;}
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
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>

<div class="slide">
	<ul>
      <li><img src="resources/css/placemain/place.png" class="mainpicture"></li>
      <li><img src="resources/css/placemain/place2.png" class="mainpicture"></li>
      <li><img src="resources/css/placemain/place3.png" class="mainpicture"></li>
      <li><img src="resources/css/placemain/place4.png" class="mainpicture"></li>
    </ul>
</div>
<br>

<div class="place_search">
	<div><button class="place_search_star_btn" onclick="location.href='place.search?searchplace=star'">별점 높은 순으로 보기</button></div>
	<div class="place_search_p">
	<form action="place.search" name="place_searchForm1" onsubmit="return place_searchCheck1();">
		가격 : <input name="from_p"> ~ <input name="to_p">
		<input name="searchplace" value="p" type="hidden">
		<button class="place_search_btn">검색</button> 
	</form>
	</div>
	<div>
	<form action="place.search" name="place_searchForm2" onsubmit="return place_searchCheck2();">
			<select name="searchplace">
		    	<option value="placename">캠핑장 이름</option>	
		    	<option value="placearea">캠핑장 주소</option>  
		    </select>
			<input name="search"> <button class="place_search_btn">검색</button>
	</form>
	</div>
	<div>
		<c:if test="${sessionScope.loginMember2.bo_id != null}">
			<button class="place_search_star_btn2" onclick="location.href='placereg.go'">캠핑장 등록하기</button>
		</c:if>
	</div>
</div>

<br>
<c:forEach var="c" items="${places}">
	<div class="place_list">
		<div>
			<img src="resources/img/${c.cam_picture }" class="table_place_pic"
			onclick="location.href='placedetail.go?r_cam_no=${c.cam_no }&r_u_id=${sessionScope.loginMember.u_id}&cam_no=${c.cam_no }&c_cam_no=${c.cam_no }&cr_cam_no=${c.cam_no }&h_cam_no=${c.cam_no }&h_u_id=${sessionScope.loginMember.u_id}'">
		</div>
		<div class="place_list_detail">
			<div class="place_list_detail_title"><a href='placedetail.go?r_cam_no=${c.cam_no }&r_u_id=${sessionScope.loginMember.u_id}&cam_no=${c.cam_no }&c_cam_no=${c.cam_no }&cr_cam_no=${c.cam_no }&h_cam_no=${c.cam_no }&h_u_id=${sessionScope.loginMember.u_id}'>
			<strong>${c.cam_name }</strong>
			</a>
			</div>
			<div>별점 : <fmt:formatNumber value="${c.star }" pattern="0.0"/></div>
			<div>주소 : ${c.cam_address }</div>
			<div>전화번호 : ${c.cam_phonenumber }</div>
			<div>가격 : <fmt:formatNumber value="${c.cam_price}" pattern="###,###,###" type="currency" /></div>
		</div>
	</div>
	<br>
</c:forEach>	

<div class="paging">
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="${c }pg=1">◀◀</a>]
            [<a href="${c }pg=${fromPage -1}">◀</a>] 
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
        		[<a href="${c }pg=${i }">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="${c }pg=${toPage + 1}">▶</a>]
            [<a href="${c }pg=${allPage}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
</div>   
 

</body>
</html>
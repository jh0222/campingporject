<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {  
	//하트찜	
	$('#heart a').click(function(){ 
	    let FormVisible = $(this).attr('value');
		alert(FormVisible);
		
		if (FormVisible == 1) {
			//value=0 찜취소
			$(this).parent().children("a").removeClass("on");
			let h_cam_no = $("#cam_no").val();
		   	alert('111');
		    let h_u_id = $("#h_u_id").val();
		    location.href="placelike.delgo?h_cam_no=" + h_cam_no + "&h_u_id=" + h_u_id
		   				 + "&cam_no=" + h_cam_no + "&c_cam_no=" + h_cam_no;     
		    FormVisible = $(this).attr('value', '0'); 
		    console.log($(this).attr("value")); 
	    } else {
	    	//value=0 찜
		    $(this).addClass("on").prevAll("a").addClass("on");
		    let h_cam_no = $("#cam_no").val();
		    alert('000');
		    let h_u_id = $("#h_u_id").val();
		    let h_cam_address =  $("#h_cam_address").val();
		    let h_cam_name =  $("#h_cam_name").val();
		    let h_campingheart = 0;
		    location.href="place.go?h_cam_no=" + h_cam_no + "&h_u_id=" + h_u_id + "&h_cam_address=" + h_cam_address +"&h_cam_name=" + h_cam_name + "&h_campingheart=0"
		    		+ "&cam_no=" + h_cam_no + "&c_cam_no=" + h_cam_no;
		    FormVisible = $(this).attr('value', '1');
		    console.log($(this).attr("value")); 
		} 
     	 
		 $('input[name=c_campingstar]').attr('value',$(this).attr("value"));
	});
});
</script>
<style type="text/css">
#heart a {
	text-decoration: none;
	color: gray;
}

#heart a.on {
	color: red;
}
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>
<h2>캠핑장 목록</h2>
${result }
<button onclick="location.href='place.search?searchplace=star'">별점 높은 순</button>
<form action="place.search">
	가격 : <input name="from_p"> ~ <input name="to_p">
	<input name="searchplace" value="p" type="hidden">
	<button>검색</button> 
</form>

<form action="place.search">
		<select name="searchplace">
	    	<option value="placename">캠핑장 이름</option>	  
	    	<option value="placearea">캠핑장 주소</option>
	    </select>
		<input name="search"> <button>검색</button>
</form>
<!-- 
<form action="place.search">
	<select name="place">
	    	<option value="inSeoul">서울</option>
	    	<option value="inGyeonggi">경기도</option>
	        <option value="inGangwon">강원도</option>
	    	<option value="inIncheon">인천</option>
	    	<option value="inChungbuk">충청북도</option>
	    	<option value="inChungnam">충청남도</option>
	    	<option value="inGyeongbuk">경상북도</option>
	    	<option value="inGyeongnam">경상남도</option>
	    	<option value="inJeonbuk">전라북도</option>
	    	<option value="inJeonnam">전라남도</option>
	    	<option value="inJeju">제주</option>
	</select>
	<button>검색</button>
</form>
 -->
<table border="1">
	<tr>
		<th>이름</th>
		<th>상세설명</th>
		<th>연락처</th>
		<th>가격</th>
		<th>주소</th>
		<th>별점</th>
	</tr>
	
	<c:forEach var="c" items="${places}">
		<tr>
			<td><a href='placedetail.go?cam_no=${c.cam_no }&c_cam_no=${c.cam_no }&h_cam_no=${c.cam_no }&h_u_id=${sessionScope.loginMember.u_id}'>${c.cam_name }</a></td>
			<td>${c.cam_txt }</td>
			<td>${c.cam_phonenumber }</td>
			<td><fmt:formatNumber value="${c.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${c.cam_address }</td>
			<td>${c.star }</td>
			<td>
				<input type="hidden" id="cam_no" value="${c.cam_no }" />
				<input type="hidden" id="h_u_id" value="${sessionScope.loginMember.u_id}" /> 
				<input type="hidden" id="h_cam_name" value="${c.cam_name }" /> 
				<input type="hidden" id="h_cam_address" value="${c.cam_address }" /> 
				<input type="hidden" id="c_cam_no" value="${c.cam_no}" /> 
				<input type="hidden" id="campingheart" value='0' /> 
				
				<c:choose>
						<c:when test="${heart != null}">
							<p id="heart">
								<a href="#" value="1" style="color: red;">♥</a>
							</p>
						</c:when>
						<c:otherwise>
							<p id="heart">
								<a href="#" value="0">♥</a>
							</p>
						</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
	
</table>
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
    
<c:if test="${sessionScope.loginMember3.root_id != null || sessionScope.loginMember2.bo_id != null}">
	<button onclick="location.href='placereg.go'">캠핑장 등록하기</button>
</c:if>
</body>
</html>
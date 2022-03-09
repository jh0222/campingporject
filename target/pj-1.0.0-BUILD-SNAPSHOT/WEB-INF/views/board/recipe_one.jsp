<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_border">
	<div class="board_subject">
		${fb.rb_subject }
	</div>
	<div class="board_id">
		${fb.rb_u_id }
	</div>
	<div class="board_detail">
		<fmt:formatDate value="${fb.rb_date }"/> 
		조회수:${fb.rb_readcount }
		<c:if test="${fb.rb_u_id == sessionScope.loginMember.u_id 
					|| fb.rb_u_id == sessionScope.loginMember2.bo_id 
					|| sessionScope.loginMember3 != null}">
			<button onclick="location.href='rwrite.updatego?rb_no=${fb.rb_no}'">수정</button>
			<button onclick="rdelete(${fb.rb_no} );">삭제</button>
		</c:if>
	</div>
	<hr>
	<div class="board_txt">
		${fb.rb_txt }
	</div>	
	</div>

	<div class="board_one">	
	<br>
		<div class="board_chat">
			<img src="resources/img/free-icon-chat-117013.png" width="20" height="20"> 댓글
		</div>
		
		<!-- 댓글 insert -->
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="r_replyinsert" name="frwriteForm" onsubmit="return fr_writeCheck()">
			<div class="reply_insert">
			<div>
			<img class="reply_img" src="resources/img/${sessionScope.loginMember.u_picture }
			${sessionScope.loginMember2.bo_picture }
			${sessionScope.loginMember3.root_picture }" width="30" height="30">
			<input type="hidden" name="rr_picture" 
			value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">				
			</div>
			<div class="reply_txt_css">				
				<input type="hidden" name="rr_u_id"
				value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
				<textarea class="reply_txt_css2" name="rr_replytxt"></textarea>
			</div>
			<input type="hidden" name="rr_rb_no" value="${fb.rb_no}">
			<input type="hidden" name="rb_no" value="${fb.rb_no}">
			<input type="hidden" name="rr_depth" value="3">		
			<button class="register">등록</button>
			</div>
		</form>
		</c:if>
		
	<br>	
			
		<c:forEach var="fr" items="${fr }">	
		<!-- 댓글 select -->			
		<div class="reply_select">
			<div><img class="reply_img"  src="resources/img/${fr.rr_picture }"></div>
			<div class="reply_select_2">
				<div>
					${fr.rr_u_id }<c:if test="${fr.rr_u_id ==  fb.rb_u_id}">(글쓴이)</c:if> &nbsp; 
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.rr_date }"/>					
					<c:if test="${fr.rr_u_id == sessionScope.loginMember.u_id 
						|| fr.rr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						&nbsp;
						<button class="rreplyUpdateBtn" value="updateGo">수정</button>
						<input type="hidden" value="${fb.rb_no}" class="fbVal">
						<input type="hidden" value="${fr.rr_no}" class="frVal1">
						<button onclick="rrdelete(${fr.rr_no},${fb.rb_no},${fr.rr_depth });">삭제</button>
					</c:if>								
				</div>	
				<div class="reply_select_txt">${fr.rr_replytxt }</div>
				<div>
				<c:forEach var="cnt" items="${frr_cnt }">
						<c:if test="${cnt.rr_owner_no == fr.rr_no }">
							<button id="replybtn" class="replybtn2" value='0'>답글 ${cnt.cnt }개 보기▼</button>
							<input type="hidden" value=${cnt.cnt } class="replycnt">
						</c:if>	
					</c:forEach>
					<c:if test="${sessionScope.loginMember.u_id != null
							|| sessionScope.loginMember2.bo_id != null
							|| sessionScope.loginMember3 != null}">
						<button class="reply3_insert">답글</button>
					</c:if>
				</div>
			</div>
		</div>	

		<div class="reply_insertt" style="display:none;">
		<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
		<!-- 대댓글 inset -->
			<form action="r_replyinsert" name="frrwriteForm" onsubmit="return frr_writeCheck()">
				<div class="reply_insert2">
				<div>
					<img class="reply_img2"  src="resources/img/${sessionScope.loginMember.u_picture }
					${sessionScope.loginMember2.bo_picture }
					${sessionScope.loginMember3.root_picture }" width="30" height="30">
					<input type="hidden" name="rr_picture" 
					value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
				</div>			
				<div class="reply_txt_css">		
					<textarea class="reply_txt_css2_2" name="rr_replytxt"></textarea>
				</div>
				<input type="hidden" name="rr_u_id"
				value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
				<input type="hidden" name="rr_rb_no" value="${fb.rb_no}">
				<input type="hidden" name="rb_no" value="${fb.rb_no}">
				<input type="hidden" name="rr_owner_no" value="${fr.rr_no}">
				<input type="hidden" name="rr_owner_id" value="${fr.rr_u_id}">
				<input type="hidden" name="rr_depth" value="0">
				<button class="register2">등록</button>
				</div>
			</form>
		</c:if>  
		</div>
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" style="display: none">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.rr_owner_no == fr.rr_no }">				
			<div class="reply_insert2_2">
				<div><img class="reply_img2" src="resources/img/${frr.rr_picture }"></div>
				<div class="reply_select_2">
				<div class="reply_select_txt_css_head">
					<c:if test="${frr.rr_depth == 1 }">
						<div style="color:red">${frr.rr_owner_id }<c:if test="${frr.rr_owner_id ==  fb.rb_u_id}">(글쓴이)</c:if></div> &nbsp;
					</c:if>					
					${frr.rr_u_id }<c:if test="${frr.rr_u_id ==  fb.rb_u_id}">(글쓴이)</c:if> &nbsp;
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.rr_date }"/>
					 &nbsp;
					<c:if test="${frr.rr_u_id == sessionScope.loginMember.u_id 
						|| frr.rr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
							<button class="rreplyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.rb_no}" class="fbVal">
							<input type="hidden" value="${frr.rr_no}" class="frVal1">
							 &nbsp;
							<button onclick="rrrdelete(${frr.rr_no},${fb.rb_no},${frr.rr_depth },${frr.rr_owner_no });">삭제</button>
					</c:if>	
				</div>
				<div class="reply_select_txt">${frr.rr_replytxt }</div>
					<c:if test="${sessionScope.loginMember.u_id != null
								|| sessionScope.loginMember2.bo_id != null
								|| sessionScope.loginMember3 != null}">
						<button class="replybtnbtn">답글</button>
					</c:if>
				</div>
			</div>

			<div class="reply1_insert" style="display:none;">
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="r_replyinsert">				
				<div class="reply_insert3">								
					<div>
						<img class="reply_img2" src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="rr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					</div>
					<div class="reply_txt_css">	
						<div style="color:red">${frr.rr_u_id }</div>
						<textarea  class="reply_txt_css2_2"	name="rr_replytxt"></textarea>					
					</div>
					<div>
						<input type="hidden" name="rr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input type="hidden" name="rr_rb_no" value="${frr.rr_rb_no }">
						<input type="hidden" name="rr_owner_no" value="${fr.rr_no }">
						<input type="hidden" name="rr_owner_id" value="${frr.rr_u_id }">
						<input type="hidden" name="rr_depth" value="1">
						<input type="hidden" name="rb_no" value="${fb.rb_no}">
						<button  class="register3">등록</button>
					</div>
				</div>
			</form>
			</c:if>	
			</div>
		</c:if>
		</c:forEach>				
	</div>
	</c:forEach>
	
	<div class="one_board_page">
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="r.onego?pg=1">◀◀</a>]
            [<a href="r.onego?pg=${fromPage -1}&rb_no=${fb.tip_no}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]   
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
      	<c:choose>
	       	<c:when test = "${i == pg }"> 
        		[<span style="font-weight: bolder;">${i }</span>]
        	</c:when>        	
      	    <c:otherwise>
        		[<a href="r.onego?pg=${i }&rb_no=${fb.rb_no}">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="r.onego?pg=${toPage + 1}&rb_no=${fb.rb_no}">▶</a>]
            [<a href="r.onego?pg=${allPage}&rb_no=${fb.rb_no}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
    </div>
</div>
</body>
</html>
															
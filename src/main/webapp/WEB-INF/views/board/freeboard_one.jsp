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
<div class="board">
	<div class="board_border">
	<div class="board_subject">
		${fb.f_subject }
	</div>
	<div class="board_id">
		${fb.f_u_id }
	</div>
	<div class="board_detail">
		<fmt:formatDate value="${fb.f_date }"/> &nbsp;
		조회수:${fb.f_readcount } &nbsp;&nbsp;
		<c:if test="${fb.f_u_id == sessionScope.loginMember.u_id 
						|| fb.f_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
			<button onclick="location.href='fbwrite.updatego?f_no=${fb.f_no}'">수정</button>
			<button onclick="fbdelete('${fb.f_no}' );">삭제</button>				
		</c:if>
	</div>
	<hr>
	<div class="board_txt">
		${fb.f_txt }
	</div>	
	</div>
	<hr>
	
		<div class="board_chat">
			<img src="resources/img/free-icon-chat-117013.png" width="20" height="20"> 댓글
		</div>
		
		<!-- 댓글 insert -->
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="fb_replyinsert" name="frwriteForm" onsubmit="return fr_writeCheck()">
			<div class="reply_insert">
			<div>
			<img class="reply_img" src="resources/img/${sessionScope.loginMember.u_picture }
			${sessionScope.loginMember2.bo_picture }
			${sessionScope.loginMember3.root_picture }">
			<input type="hidden" name="fr_picture" 
			value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">				
			</div>
			<div class="reply_txt_css">				
				<input type="hidden" name="fr_u_id"
				value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
				<textarea class="reply_txt_css2" name="fr_replytxt"></textarea>
			</div>				
			<input type="hidden" name="fr_f_no" value="${fb.f_no}">
			<input type="hidden" name="f_no" value="${fb.f_no}">
			<input type="hidden" name="fr_depth" value="3">									
			<button class="register">등록</button>
			</div>
		</form>
		</c:if>

	<br>

		<c:forEach var="fr" items="${fr }">	
		<!-- 댓글 select -->		
		<div class="reply_select">
			<div><img class="reply_img" src="resources/img/${fr.fr_picture }" width="30" height="30"></div>
			<div class="reply_select_txt_css">
				${fr.fr_u_id }<c:if test="${fr.fr_u_id ==  fb.f_u_id}">(글쓴이)</c:if> &nbsp; 
				<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.fr_date }"/>
				<br>						
				${fr.fr_replytxt }	
				<br>
				<c:forEach var="cnt" items="${frr_cnt }">
					<c:if test="${cnt.fr_owner_no == fr.fr_no }">
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
			<div>
				<c:if test="${fr.fr_u_id == sessionScope.loginMember.u_id 
						|| fr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
					<button class="replyUpdateBtn" value="updateGo">수정</button>
					<input type="hidden" value="${fb.f_no}" class="fbVal">
					<input type="hidden" value="${fr.fr_no}" class="frVal1">
					<button onclick="frdelete(${fr.fr_no},${fb.f_no},${fr.fr_depth });">삭제</button>
				</c:if>	
			</div>	
		</div>	
		
		<div class="reply_insertt" style="display:none;">
		<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
		<!-- 대댓글 inset -->
			<form action="fb_replyinsert" name="frrwriteForm" onsubmit="return frr_writeCheck()">
				<div class="reply_insert2">
				<div>
					<img class="reply_img2" src="resources/img/${sessionScope.loginMember.u_picture }
					${sessionScope.loginMember2.bo_picture }
					${sessionScope.loginMember3.root_picture }" width="30" height="30">
					<input type="hidden" name="fr_picture" 
					value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
				</div>			
				<div class="reply_txt_css">		
					<textarea class="reply_txt_css2_2" name="fr_replytxt"></textarea>
				</div>
				<input type="hidden" name="fr_u_id"
				value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
				<input type="hidden" name="fr_f_no" value="${fb.f_no}">
				<input type="hidden" name="f_no" value="${fb.f_no}">
				<input type="hidden" name="fr_owner_no" value="${fr.fr_no}">
				<input type="hidden" name="fr_owner_id" value="${fr.fr_u_id}">
				<input type="hidden" name="fr_depth" value="0">
				<button class="register2">등록</button>
				</div>
			</form>
		</c:if>  
		</div>
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" style="display:none;">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.fr_owner_no == fr.fr_no }">				
			<div class="replybtn_display">
				<div class="reply_insert2_2">
				<div>
				<img class="reply_img2" src="resources/img/${frr.fr_picture }" width="30" height="30">
				</div>
				<div class="reply_select_txt_css">		
					<div class="reply_select_txt_css_head">
						<c:if test="${frr.fr_depth == 1 }">
							<div style="color:red">${frr.fr_owner_id }<c:if test="${frr.fr_owner_id ==  fb.f_u_id}">(글쓴이)</c:if></div> &nbsp;
						</c:if>					
						${frr.fr_u_id }<c:if test="${frr.fr_u_id ==  fb.f_u_id}">(글쓴이)</c:if> &nbsp;
						<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.fr_date }"/> 
						 &nbsp;
						<c:if test="${frr.fr_u_id == sessionScope.loginMember.u_id 
						|| frr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
							<button class="replyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.f_no}" class="fbVal">
							<input type="hidden" value="${frr.fr_no}" class="frVal1">
							 &nbsp;
							<button onclick="frrdelete(${frr.fr_no},${fb.f_no},${frr.fr_depth },${frr.fr_owner_no });">삭제</button>
						</c:if>	
					</div>
					${frr.fr_replytxt }
					<c:if test="${sessionScope.loginMember.u_id != null
								|| sessionScope.loginMember2.bo_id != null
								|| sessionScope.loginMember3 != null}">
						<button class="replybtnbtn">답글</button>
					</c:if>
				</div>
				</div>
			</div>
			
			<div class="reply1_insert" style="display:none;">
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="fb_replyinsert">
				<div class="reply_insert3">								
					<img class="reply_img2" src="resources/img/${sessionScope.loginMember.u_picture }
					${sessionScope.loginMember2.bo_picture }
					${sessionScope.loginMember3.root_picture }">
					<input type="hidden" name="fr_picture" 
					value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					<div style="color:red">${frr.fr_u_id }</div>
					<textarea name="fr_replytxt"></textarea>
					
						<input type="hidden" name="fr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input type="hidden" name="fr_f_no" value="${frr.fr_f_no }">
						<input type="hidden" name="fr_owner_no" value="${fr.fr_no }">
						<input type="hidden" name="fr_owner_id" value="${frr.fr_u_id }">
						<input type="hidden" name="fr_depth" value="1">
						<input type="hidden" name="f_no" value="${fb.f_no}">
						<button  class="register2">등록</button>
				</div>
			</form>
			
			</c:if>	
			</div>
		</c:if>
		</c:forEach>				
	</div>
	</c:forEach>
		
	
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="fb.onego?pg=1">◀◀</a>]
            [<a href="fb.onego?pg=${fromPage -1}&f_no=${fb.f_no}">◀</a>] 
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
        		[<a href="fb.onego?pg=${i }&f_no=${fb.f_no}">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="fb.onego?pg=${toPage + 1}&f_no=${fb.f_no}">▶</a>]
            [<a href="fb.onego?pg=${allPage}&f_no=${fb.f_no}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
</div>
</body>
</html>
															
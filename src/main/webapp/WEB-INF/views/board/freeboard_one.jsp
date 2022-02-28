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
			
		[댓글]	<br>
		<c:forEach var="fr" items="${fr }">	
		<!-- 댓글 select -->		
		<div class="reply_select">
			<div><img class="reply_img" src="resources/img/${fr.fr_picture }" width="30" height="30"></div>
			<div class="reply_select_txt_css">
				${fr.fr_u_id } &nbsp;
				<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.fr_date }"/>
				<br>						
				${fr.fr_replytxt }	
				<br>
				<c:choose>
					<c:when test="${fr.fr_u_id == sessionScope.loginMember.u_id 
								|| fr.fr_u_id == sessionScope.loginMember2.bo_id 
								|| sessionScope.loginMember3 != null}">
						<button id="replybtn" class="replybtn2" value='0'>답글 보기▼</button>
					</c:when>
					<c:otherwise>
						<button id="replybtn" class="logout_replybtn" value='0'>답글 보기▼</button>
					</c:otherwise>
				</c:choose>
				<div class="reply3_insert">답글</div>
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
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" display="none">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.fr_owner_no == fr.fr_no }">				
			<div class="replybtn_display">
				<div class="reply_insert2">
				<div>
				<img class="reply_img2" src="resources/img/${frr.fr_picture }" width="30" height="30">
				</div>
				<div class="reply_select_txt_css">		
					<div class="reply_select_txt_css_head">
						<c:if test="${frr.fr_depth == 1 }">
							<div style="color:red">${frr.fr_owner_id }</div> &nbsp;
						</c:if>					
						${frr.fr_u_id } &nbsp;
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
					<button>답글</button>
				</div>
				</div>
			</div>
			
			<div display="none">
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
		
			
	<c:forEach var="fr" items="${fr }">	
		[댓글]		
		<!-- 댓글 select -->			
			<table border="1">	
				<tr><td colspan="4" style="background-color:red;">댓글</td></tr>	
				<tr>
					<td>
						<img src="resources/img/${fr.fr_picture }" width="30" height="30">
					</td>
					<td colspan="2">${fr.fr_u_id }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.fr_date }"/></td>					
				</tr>
				<tr>
					<td colspan="3" class="replyTd">${fr.fr_replytxt }</td>	
					<c:if test="${fr.fr_u_id == sessionScope.loginMember.u_id 
						|| fr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td colspan="3">
							<button class="replyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.f_no}" class="fbVal">
							<input type="hidden" value="${fr.fr_no}" class="frVal1">
							<button onclick="frdelete(${fr.fr_no},${fb.f_no},${fr.fr_depth });">삭제</button>
						</td>		
					</c:if>								
				</tr>
				<tr>
					<c:choose>
						<c:when test="${fr.fr_u_id == sessionScope.loginMember.u_id 
								|| fr.fr_u_id == sessionScope.loginMember2.bo_id 
								|| sessionScope.loginMember3 != null}">
							<td colspan="4">
								<button id="replybtn" class="replybtn" value='0'>답글 보기▼</button>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="4">
								<button id="replybtn" class="logout_replybtn" value='0'>답글 보기▼</button>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>

		<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
		<!-- 대댓글 inset -->
			<form action="fb_replyinsert" name="frrwriteForm" onsubmit="return frr_writeCheck()">
				<table class="replyreply" border="1">
					<tr><td colspan="2">답글작성</td></tr>
					<tr>
						<td rowspan="2">
							<img src="resources/img/${sessionScope.loginMember.u_picture }
							${sessionScope.loginMember2.bo_picture }
							${sessionScope.loginMember3.root_picture }" width="30" height="30">
							<input type="hidden" name="fr_picture" 
							value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
						</td>
						<td>
							${sessionScope.loginMember.u_id }
							${sessionScope.loginMember2.bo_id }
							${sessionScope.loginMember3.root_name }
							<input type="hidden" name="fr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
						</td>
					</tr>
					<tr><td><input name="fr_replytxt"></td></tr>
					<tr>
						<td>
							<input type="hidden" name="fr_f_no" value="${fb.f_no}">
							<input type="hidden" name="f_no" value="${fb.f_no}">
							<input type="hidden" name="fr_owner_no" value="${fr.fr_no}">
							<input type="hidden" name="fr_owner_id" value="${fr.fr_u_id}">
							<input type="hidden" name="fr_depth" value="0">
							<button>등록</button>
						</td>
					</tr>
				</table>
			</form>
		</c:if>  
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" style="display: none">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.fr_owner_no == fr.fr_no }">				
			<table border="1" class="aabbcc">
				<tr>
					<td>
						<img src="resources/img/${frr.fr_picture }" width="30" height="30">
					</td>
					<c:if test="${frr.fr_depth == 1 }">
						<td style="color:red; background-color:yellow;">${frr.fr_owner_id }</td>
					</c:if>					
					<td style="background-color:orange;">${frr.fr_u_id }:</td>
					<td class="replyTd">${frr.fr_replytxt }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.fr_date }"/></td>
					<c:if test="${frr.fr_u_id == sessionScope.loginMember.u_id 
						|| frr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td>
							<button class="replyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.f_no}" class="fbVal">
							<input type="hidden" value="${frr.fr_no}" class="frVal1">
							<button onclick="frrdelete(${frr.fr_no},${fb.f_no},${frr.fr_depth },${frr.fr_owner_no });">삭제</button>
						</td>
					</c:if>	
					<td><button>답글</button></td>
				</tr>
			</table>
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="fb_replyinsert">				
			<table border="1">
				<tr>							
					<td style="color:red;">
						${frr.fr_u_id }							
					</td>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="fr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					</td>
					<td class="replyTd">
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }						
						<input name="fr_replytxt">
					</td>
					<td>
						<input type="hidden" name="fr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input type="hidden" name="fr_f_no" value="${frr.fr_f_no }">
						<input type="hidden" name="fr_owner_no" value="${fr.fr_no }">
						<input type="hidden" name="fr_owner_id" value="${frr.fr_u_id }">
						<input type="hidden" name="fr_depth" value="1">
						<input type="hidden" name="f_no" value="${fb.f_no}">
						<button  class="replyinsert">등록</button>
					</td>
				</tr>
			</table>
			</form>
			</c:if>	
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
        		[${i }]
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
															
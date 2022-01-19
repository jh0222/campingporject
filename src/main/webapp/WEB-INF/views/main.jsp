<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Insert title here</title>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
${result }
<jsp:include page="${loginPage }"></jsp:include>

<hr>
<jsp:include page="${contentPage }"></jsp:include>
	
	<table id="siteMenuArea">
	<tr>
		<td colspan="4" align="center"> 캠핑장 웹사이트 </td>
	</tr>
		<tr> 
			<td align="center">
				<table id="siteMenu">
					<tr>
						<td onclick="location.href='CampingPlaceC'">[캠핑장]</td>
						<td>[자유게시판]</td>
						<td>[레시피]</td>
						<td>[꿀팁]</td>
						<td>[오픈채팅방]</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>
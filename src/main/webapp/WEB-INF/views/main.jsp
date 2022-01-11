<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
	
	<table id="siteContentArea">
		<tr>
			<td><jsp:include page="${contentPage} }"></jsp:include></td>
		</tr>
	</table>
	<table id="siteLoginArea">
		<tr>
			<td><jsp:include page="${loginPage} }"></jsp:include></td>
		</tr>
	</table>
	
</body>
</html>
function connectJoinIdInputEvent() {

	$("#Idckbtn").click(function() {
		var id = $("#id").val();
		$.ajax({
			url : "member.get",
			data : {
				"u_id" : id,
				"bo_id" : id
			},
			success : function(data) {
				console.log(data);
//				if (data.member.length == 1) {
				if (data == 1) {
					$("#Idckbtn").html('사용불가능한 아이디입니다');
					$("#Idckbtn").css("color", "#F44336");
					document.joinForm.id.value="";
					document.joinForm.id.focus();					
				} else {
					$("#Idckbtn").html('사용가능한 아이디입니다');
					$("#Idckbtn").css("color", "black");
					document.joinForm.idDoubleChk.value="true"
				}
			}
		});
	});
}	

function connectAddrSearchEvent() {
	$("#addrSearchBtn").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#addr3Input").val(data.zonecode);
				$("#addr1Input").val(data.roadAddress);
			}
		}).open();
	});
}



$(function() {
	connectJoinIdInputEvent();
	connectAddrSearchEvent();
});
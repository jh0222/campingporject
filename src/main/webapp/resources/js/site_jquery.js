function Idck() {
		var u_id = $(this).val();
		$.ajax({
			url : "member.get",
			data : {
				"u_id" : u_id
			},
			success : function(data) {
				console.log(data);
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else {
					$("#idchk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");					
				}
			}
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
	connectAddrSearchEvent();
	connectJoinIdInputEvent();
});
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
				// if (data.member.length == 1) {
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

function connectSNSWriteFormSummonEvent() {
	var snsWriteFormVisible = false;

	$("#snsWriteFormSummoner").click(function() {
		if (snsWriteFormVisible) {
			$("#snsWriteArea").css("bottom", "-150px");
		} else {
			$("#snsWriteArea").css("bottom", "10px");
		}
		snsWriteFormVisible = !snsWriteFormVisible;
	});
}

$(function() {
	connectJoinIdInputEvent();
	connectAddrSearchEvent();
	connectSNSWriteFormSummonEvent();

	$(".replybtn").click(function() {
		let FormVisible = $(this).attr('value');

		if (FormVisible == 1) {
			$(this).closest('table').next().next().css('display', 'none');
			$(this).text("답글 보기▼");
			FormVisible = $(this).attr('value', '0');
		} else {
			$(this).closest('table').next().next().css('display', 'block');
			$(this).text("답글 숨기기▲");
			FormVisible = $(this).attr('value', '1');
		}
	});
	
	$(".logout_replybtn").click(function() {
		let FormVisible = $(this).attr('value');

		if (FormVisible == 1) {
			$(this).closest('table').next().css('display', 'none');
			$(this).text("답글 보기▼");
			FormVisible = $(this).attr('value', '0');
		} else {
			$(this).closest('table').next().css('display', 'block');
			$(this).text("답글 숨기기▲");
			FormVisible = $(this).attr('value', '1');
		}
	});

	$('.replyUpdateBtn').click(function name() {
		let updatebtnVal = $(this).attr('value');
		let updatebtn = $('<button></button>');
		
		if(updatebtnVal == 'updateGo'){
			let updateInput = $('<input>');
			let replyTd = $(this).closest('tr').find('.replyTd')
			let myVal = replyTd.text();
			replyTd.text('');
			replyTd.append(updateInput);
			$(updateInput).val(myVal);
			updatebtnVal = $(this).attr('value', 'updateDo');
		} else{
			let f_no = $(this).next('.fbVal').val();
			let fr_no = $(this).next().next('.frVal1').val();
			let fr_replytxt = $(this).closest('tr').find('.replyTd').find('input').val();
			location.href="fr.update?fr_no=" + fr_no  + "&fr_replytxt=" + fr_replytxt + "&f_no=" + f_no;
			updatebtnVal = $(this).attr('value', 'updateGo');
		}
	});
	
	$('.tipreplyUpdateBtn').click(function name() {
		let updatebtnVal = $(this).attr('value');
		let updatebtn = $('<button></button>');
		
		if(updatebtnVal == 'updateGo'){
			let updateInput = $('<input>');
			let replyTd = $(this).closest('tr').find('.replyTd')
			let myVal = replyTd.text();
			replyTd.text('');
			replyTd.append(updateInput);
			$(updateInput).val(myVal);
			updatebtnVal = $(this).attr('value', 'updateDo');
		} else{
			let tip_no = $(this).next('.fbVal').val();
			let tipr_no = $(this).next().next('.frVal1').val();
			let tipr_replytxt = $(this).closest('tr').find('.replyTd').find('input').val();
			location.href="ctr.update?tipr_no=" + tipr_no  + "&tipr_replytxt=" + tipr_replytxt + "&tip_no=" + tip_no;
			updatebtnVal = $(this).attr('value', 'updateGo');
		}
	});
	
	$('.rreplyUpdateBtn').click(function name() {
		let updatebtnVal = $(this).attr('value');
		let updatebtn = $('<button></button>');
		
		if(updatebtnVal == 'updateGo'){
			let updateInput = $('<input>');
			let replyTd = $(this).closest('tr').find('.replyTd')
			let myVal = replyTd.text();
			replyTd.text('');
			replyTd.append(updateInput);
			$(updateInput).val(myVal);
			updatebtnVal = $(this).attr('value', 'updateDo');
		} else{
			let rb_no = $(this).next('.fbVal').val();
			let rr_no = $(this).next().next('.frVal1').val();
			let rr_replytxt = $(this).closest('tr').find('.replyTd').find('input').val();
			location.href="rr.update?rr_no=" + rr_no  + "&rr_replytxt=" + rr_replytxt + "&rb_no=" + rb_no;
			updatebtnVal = $(this).attr('value', 'updateGo');
		}
	});

});



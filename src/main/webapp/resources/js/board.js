function fbonego(no){	
	location.href='fbwrite.onego?f_no='+no;
}

function fbdelete(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fbwrite.delete?f_no=" + n;
	}
}

function frdelete(n,no,depth) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no + "&fr_depth?" + fr_depth;
	}
}

function r_reply() {
	var FormVisible = false;

	$("#rreply").click(function() {
		if (FormVisible) {
			$("#replyreply").css("bottom", "-150px");
		} else {
			$("#replyreply").css("bottom", "10px");
		}
		FormVisible = !FormVisible;
	});
}


$(function() {
	r_reply();
});
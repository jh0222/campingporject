function fbonego(no){	
	location.href='fbwrite.onego?f_no='+no;
}

function fbdelete(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fbwrite.delete?f_no=" + n;
	}
}

function frdelete(n,no) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no;
	}
}

function frdelete(n,no,depth) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no + "&fr_depth=" + depth;
	}
}

function frrdelete(n,no,depth,owner) {       
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no + "&fr_depth=" + depth + "&fr_owner_no=" + owner;
	}
}

function ctdelete(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "ctwrite.delete?tip_no=" + n;
	}
}

function ctrdelete(n,no,depth) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "ctr.delete?tipr_no=" + n +"&tip_no=" + no + "&tipr_depth=" + depth;
	}
}

function tiprrdelete(n,no,depth,owner) {       
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "ctr.delete?tipr_no=" + n +"&tip_no=" + no + "&tipr_depth=" + depth + "&tipr_owner_no=" + owner;
	}
}

function rdelete(n) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "rwrite.delete?rb_no=" + n;
	}
}

function rrdelete(n,no) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "rr.delete?rr_no=" + n +"&rb_no=" + no;
	}
}

function rrdelete(n,no,depth) {
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "rr.delete?rr_no=" + n +"&rb_no=" + no + "&rr_depth=" + depth;
	}
}

function rrrdelete(n,no,depth,owner) {       
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "rr.delete?rr_no=" + n +"&rb_no=" + no + "&rr_depth=" + depth + "&rr_owner_no=" + owner;
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

function writeCheck(){
	let subject = document.writeForm.subject;
	let txt = document.writeForm.txt;

	if (isEmpty(subject)) {
        alert('제목을 입력해주세요.');
        subject.value = "";
        subject.focus();
        return false;
	} 
	if (isEmpty(txt)) {
		alert('내용을 입력해주세요.');
		txt.value = "";
		txt.focus();
		return false;
	}
	
}

function fr_writeCheck(){
	let fr_replytxt = document.frwriteForm.fr_replytxt;	
	
	if (isEmpty(fr_replytxt)) {
		alert('내용을 입력해주세요.');
		fr_replytxt.value = "";
		fr_replytxt.focus();
		return false;
	}
}

function frr_writeCheck(){
	let fr_replytxt = document.frrwriteForm.fr_replytxt;	
	
	if (isEmpty(fr_replytxt)) {
		alert('내용을 입력해주세요.');
		fr_replytxt.value = "";
		fr_replytxt.focus();
		return false;
	}
}

function frrr_writeCheck(){
	let fr_replytxt = $(this).document.frrrwriteForm.fr_replytxt;	
	//let fr_replytxt = $(this).closest('tr').find('.replyTd').find('input').val();
	if (isEmpty(fr_replytxt)) {
		alert('내용을 입력해주세요.');
		fr_replytxt.value = "";
		fr_replytxt.focus();
		return false;
	}
}

$(function() {
	$(".replyinsert").click(function() {
		let fr_replytxt = $(this).closest('tr').find('.replyTd').find('input').val();
		
		if (isEmpty(fr_replytxt)) {
			alert(fr_replytxt);
			alert('내용을 입력해주세요.');
			fr_replytxt.value = "";
			fr_replytxt.focus();
			return false;
		}
	});

});

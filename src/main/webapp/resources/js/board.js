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
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no + "&fr_depth=" + depth;
	}
}

function frrdelete(n,no,depth,owner) {       
	var ok = confirm("삭제하시겠습니까?");
	if (ok) {
		location.href = "fr.delete?fr_no=" + n +"&f_no=" + no + "&fr_depth=" + depth + "&fr_owner_no=" + owner;
	}
}

/*function frupdate(n,t) {
	t = prompt("말", t);
	if (t != null && t.length > 0 && t.length < 250) {
		location.href = "fr.update?fr_no=" + n + "&fr_replytxt=" + t;
	}
}*/


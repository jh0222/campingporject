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

function frupdate(rid, reg_id, content){

	var htmls = "";

	htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';

	htmls += '<title>Placeholder</title>';

	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

	htmls += '<span class="d-block">';

	htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';

	htmls += '<span style="padding-left: 7px; font-size: 9pt">';

	htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';

	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

	htmls += '</span>';

	htmls += '</span>';		

	htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

	htmls += content;

	htmls += '</textarea>';

	

	htmls += '</p>';

	htmls += '</div>';

	

	$('#rid' + rid).replaceWith(htmls);

	$('#rid' + rid + ' #editContent').focus();

}



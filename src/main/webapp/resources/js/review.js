// 캠핑 리뷰 수정
function campingreviewupdate(no, id) {
	let str = $("#cru" + no).next().children().val();
	location.href = "campingreview.update?c_no=" + no + "&c_campingreview=" + str + "&c_u_id=" + id;
}

// 캠핑 리뷰 삭제
function campingreviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "campingreview.delete?c_no=" + no + "&c_u_id=" + id;
	}
}

//캠핑용품 리뷰 수정
function productreviewup(no, id) {
	let txt = $("#pru" + no).next().children().val();
	location.href = "productreview.update?pr_no=" + no + "&pr_txt=" + txt + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
}

//캠핑용품 리뷰 삭제
function productreviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "productreview.delete?pr_no=" + no + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
	}
}

//밀키트 리뷰 수정
function mealreviewup(no, id) {
	let txt = $("#fpru" + no).next().children().val();
	location.href = "mealreview.update?fpr_no=" + no + "&fpr_txt=" + txt + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
}

//밀키트 리뷰 삭제
function mealreviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "mealreview.delete?fpr_no=" + no + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
	}
}


//자유게시판 댓글 수정
function freeboardreviewup(no, id) {
	let str = $("#fu" + no).next().children().val();
	location.href = "freeboardreview.update?fr_no=" + no + "&fr_replytxt=" + str + "&fr_u_id=" + id;
}

//자유게시판 댓글 삭제
function freeboardreviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "freeboardreview.delete?fr_no=" + no + "&fr_u_id=" + id;
	}
}

//캠핑팁 댓글 수정
function campingtipreviewup(no, id) {
	let str = $("#ctpu" + no).next().children().val();
	location.href = "campingtipreview.update?tipr_no=" + no + "&tipr_replytxt=" + str + "&tipr_u_id=" + id;
}

//캠핑팁 댓글 삭제
function campingtipreviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "campingtipreview.delete?tipr_no=" + no + "&tipr_u_id=" + id;
	}
}

//레시피 댓글 수정
function recipereviewup(no, id) {
	let str = $("#ru" + no).next().children().val();
	location.href = "recipereview.update?rr_no=" + no + "&rr_replytxt=" + str + "&rr_u_id=" + id;
}

//레시피 댓글 삭제
function recipereviewdel(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "recipereview.delete?rr_no=" + no + "&rr_u_id=" + id;
	}
}

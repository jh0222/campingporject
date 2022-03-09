//캠핑용품 후기 수정
function productreviewup2(no, id) {
	let txt = $("#pru" + no).next().children().val();
	location.href = "productreview.update2?pr_no=" + no + "&pr_txt=" + txt + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
}

//캠핑용품 후기 삭제
function productreviewdel2(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "productreview.delete2?pr_no=" + no + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
	}
}

//밀키트 후기 수정
function mealreviewup2(no, id) {
	let txt = $("#fpru" + no).next().children().val();
	location.href = "mealreview.update2?fpr_no=" + no + "&fpr_txt=" + txt + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
}

//밀키트 후기 삭제
function mealreviewdel2(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "mealreview.delete2?fpr_no=" + no + "&pr_u_bo_id=" + id + "&fpr_u_bo_id=" + id;
	}
}

//자유게시판 댓글 수정
function freeboardreviewup2(no, id) {
	let str = $("#fu" + no).next().children().val();
	location.href = "freeboardreview.update2?fr_no=" + no + "&fr_replytxt=" + str + "&fr_u_id=" + id;
}

//자유게시판 댓글 삭제
function freeboardreviewdel2(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "freeboardreview.delete2?fr_no=" + no + "&fr_u_id=" + id;
	}
}

//캠핑팁 댓글 수정
function campingtipreviewup2(no, id) {
	let str = $("#ctpu" + no).next().children().val();
	location.href = "campingtipreview.update2?tipr_no=" + no + "&tipr_replytxt=" + str + "&tipr_u_id=" + id;
}

//캠핑팁 댓글 삭제
function campingtipreviewdel2(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "campingtipreview.delete2?tipr_no=" + no + "&tipr_u_id=" + id;
	}
}

//레시피 댓글 수정
function recipereviewup2(no, id) {
	let str = $("#ru" + no).next().children().val();
	location.href = "recipereview.update2?rr_no=" + no + "&rr_replytxt=" + str + "&rr_u_id=" + id;
}

//레시피 댓글 삭제
function recipereviewdel2(no, id) {
	let ok = confirm("리뷰를 삭제하시겠습니까?");
	if(ok){
		location.href = "recipereview.delete2?rr_no=" + no + "&rr_u_id=" + id;
	}
}

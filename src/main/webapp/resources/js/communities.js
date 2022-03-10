// 사용자 - 캠핑용품 - 취소/환불
function buyproductdel(no, id){
	let ok = confirm("정말 취소/환불하시겠습니까?");
	if (ok) {
		location.href = "buyproduct.del?b_no=" + no + "&b_u_bo_id=" + id;
	}
}

// 사용자 - 밀키트 - 취소/환불
function buymealdel(no, id){
	let ok = confirm("정말 취소/환불하시겠습니까?");
	if (ok) {
		location.href = "buymeal.del?fb_no=" + no + "&fb_u_bo_id=" + id + "&b_u_bo_id=" + id;
	}
}

// 사장 - 캠핑용품 - 취소/환불
function buyproductdel(no, id){
	let ok = confirm("정말 취소/환불하시겠습니까?");
	if (ok) {
		location.href = "buyproduct.del?b_no=" + no + "&b_u_bo_id=" + id;
	}
}

// 사용자 캠핑용품 - 취소/환불
function buymealdel(no, id){
	let ok = confirm("정말 취소/환불하시겠습니까?");
	if (ok) {
		location.href = "Mbuylist.del?fb_no=" + no + "&fb_u_bo_id=" + id + "&b_u_bo_id=" + id;
	}
}

//캠핑예약 취소
function reservedel(no, id){
	let ok = confirm("예약을 취소하시겠습니까?");
	if (ok) {
		location.href = "campingreserve.del?r_no=" + no + "&r_u_id=" + id;
	}
}

// 캠핑찜 취소
function jjimdel(no, id){
	let ok = confirm("찜을 취소하시겠습니까?");
	if (ok) {
		location.href = "campingjjim.del?h_no=" + no + "&h_u_id=" + id;
	}
}

// 등록된 캠핑 정보 삭제
function campingBye(no, id){
	let ok = confirm("등록된 캠핑정보를 삭제하시겠습니까?");
	if (ok) {
		location.href = "boss_camping.infodel?cam_no=" + no + "&cam_bo_id=" + id;
	}
}
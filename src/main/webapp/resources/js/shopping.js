//-----------------캠핑용품 페이지
function del(no) {
	let ok = confirm('해당상품을 삭제 합니까?');
	if(ok) {
		location.href = "del.product?p_no=" + no;
	}
}

//밀키트 페이지
function m_del(no) {
	let ok = confirm('해당상품을 삭제 합니까?');
	if(ok) {
		location.href = "del.milkit?fp_no=" + no;
	}
}

//유효성검사(캠핑용품 검색)
function SearchCheck1(){
	function isEmpty(input) {
		return !input.value; 
	}

  let p_name = document.shoppingsearch.p_name;
  	if(isEmpty(p_name)) {
      alert('검색어를 입력하세요');
      p_name.focus();
 		return false;
  }
  	
}

//유효성검사(밀키트검색)
function SearchCheck2(){
	function isEmpty(input) {
		return !input.value; 
	}

  let fp_name = document.milkitsearch.fp_name;
  	if(isEmpty(fp_name)) {
      alert('검색어를 입력하세요');
      fp_name.focus();
 		return false;
  }
  	
}

//유효성검사(캠핑용품 리뷰)
function Check1(){
	function isEmpty(input) {
		return !input.value; 
	}

    let pr_txt = document.reviewcheck.pr_txt;
    	if(isEmpty(pr_txt)) {
        alert('내용을 입력하세요');
        pr_txt.focus();
   		return false;
    }
    	
}

//유효성검사(밀키트 리뷰)
function Check2(){
	function isEmpty(input) {
		return !input.value; 
	}

    let fpr_txt = document.reviewcheck.fpr_txt;
    	if(isEmpty(fpr_txt)) {
        alert('내용을 입력하세요');
        fpr_txt.focus();
   		return false;
    }
    	
}






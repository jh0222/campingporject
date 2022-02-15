let text1 = document.querySelector("h1");   //일단 문서에서 h1을 가져온다.

window.addEventListener('scroll',function(){
	let value = window.scrollY;
	console.log("scrollY", value);
	
	if(value>230) {
		text1.style.animation="disappear 2s ease-out forwards";
	}else{
		text1.style.animation="slide 1s ease-out";
	}
});



/*
//메뉴 밑줄 만들기

let horizontalUnderLine = document.getElementById("horizontal-underline");
let horizontalMenus = document.querySelectorAll("nav:first-child a");

horizontalMenus.forEach(menu)=>
menu.addEventListener("click",(e)=>horizontalIndicator(e))
);

function horizontalIndicator(e) {
	horizontalUnderLine.style.left = e.currentTarget.offsetLeft+"px";
	horizontalUnderLine.style.width = e.currentTarget.offsetWidth+"px";
	horizontalUnderLine.style.top = e.currentTarget.offsetTop+ e.currentTarget.offsetHeight+"px"
}
*/
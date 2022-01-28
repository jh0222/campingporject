0. 관리자 디비(수정함)
drop table root_table;
create table root_table(
	root_id varchar2(20 char) not null,
	root_pw varchar2(30 char) not null,
	root_name varchar2(20 char) not null,
	root_picture varchar2(200 char) not null
);

insert into root_table values('root','1234','관리자','sky.jpg');

select * from root_table;
-------------------------------------------------------------------------------------------------------------------------------------
1. 사용자 디비
create table user_table(
	u_no number(5) primary key,
	u_name varchar2(20 char) not null,
	u_id varchar2(20 char) not null,
	u_pw varchar2(30 char) not null,
	u_email varchar2(50 char) not null,
	u_address varchar2(100 char) not null,
	u_phonenumber varchar2(30 char) not null,
	u_birth date not null,
	u_picture varchar2(200 char) not null,
	u_discount number(5) not null
);

create sequence user_seq;

insert into user_table values(user_seq.nextval,'김태희','kim','k1234!','kim1234@naver.com','서울특별시 종로구','01012341234','19970101','a.jpg',0);

select * from USER_TABLE;
-------------------------------------------------------------------------------------------------------------------------------------
2. 사장 테이블
create table boss_table(
	bo_no number(5) primary key,
	bo_name varchar2(20 char) not null,
	bo_id varchar2(20 char) not null,
	bo_pw varchar2(30 char) not null,
	bo_email varchar2(50 char) not null,
	bo_address varchar2(100 char) not null,
	bo_phonenumber varchar2(30 char) not null,
	bo_birth date not null,
	bo_picture varchar2(200 char) not null,
	bo_discount number(5) not null
);

create sequence boss_seq;

insert into boss_table values(boss_seq.nextval,'김연아','kim2','k12345!','kim12345@naver.com','서울특별시 종로구','01012341235','19970101','a.jpg',0);

select * from boss_TABLE;
-------------------------------------------------------------------------------------------------------------------------------------
3. 캠핑 테이블
/*
 * db에서 가져올때 cam_no=cam_no -> update cam_number-headcont
*/
drop table camping_table;
create table camping_table(
    cam_no number(5) primary key,
    cam_bo_id varchar2(20 char) not null,
    cam_name varchar2(30 char) not null,
    cam_picture varchar2(200 char) not null,
    cam_txt varchar2(200 char) not null,
    cam_phonenumber varchar2(30 char) not null,
    cam_price number(10) not null,
    cam_address varchar2(100 char) not null,
    cam_latitude varchar2(30 char) not null,   
    cam_longitude varchar2(30 char) not null,    
    cam_headcount number(5) not null
);

create sequence camping_seq;

insert into camping_table values(camping_seq.nextval,'kim2','난지캠핑장','cam.jpg','캠핑장','02-373-2021',20000,'서울 마포구 한강난지로 28','37.57035','126.87264',40);

select * from camping_table;
-------------------------------------------------------------------------------------------------------------------------------------
4. 예약 테이블
/*
startdate~enddate예약되어있으면 처음부터 막아놓기,어제 날짜 막아놓기			
dbex) where sysdate> and startdate< enddate>  where cam_number			
*/

create table reservation_table(
	r_no number(5) primary key,
	r_cam_no number(5) not null,
	r_u_id varchar2(20 char) not null,
	r_u_name varchar2(20 char) not null,
	r_u_phonenumber varchar2(30 char) not null,
	r_cam_name varchar2(30 char) not null,
	r_campingstartdate date not null,
	r_campingenddate date not null,
	r_campingheadcount number(5) not null,
	r_campingprice number(10) not null,
	r_cam_phonenumber varchar2(30 char) not null,
	r_cam_address varchar2(100 char) not null
);

create sequence reservation_seq;

insert into reservation_table values(reservation_seq.nextval,1,'kim','김태희','01012341234','난지캠핑장','20220318','20220320',2,40000,'02-373-2021','서울 마포구 한강난지로 28');

select * from reservation_table;
-------------------------------------------------------------------------------------------------------------------------------------
5. 캠핑찜
drop table campingheart_table;
create table campingheart_table(
	h_no number(5) primary key,
	h_cam_no number(5) not null,
	h_u_id varchar2(20 char) not null,
	h_cam_name varchar2(30 char) not null,
	h_cam_address varchar2(100 char) not null,
	h_campingheart number(5) not null
);

create sequence campingheart_seq;

insert into campingheart_table values(campingheart_seq.nextval,1,'kim','난지캠핑장','서울 마포구 한강난지로 28',1);

select * from campingheart_table;
-------------------------------------------------------------------------------------------------------------------------------------
6. 캠핑 리뷰
/*
예약하고 그 날짜가 지나면 리뷰적기 버튼으로 바뀜
ex)enddate=sysdate+1
*/
drop table campingreview_table;
create table campingreview_table(		
	c_no number(5) primary key,
	c_cam_no number(5) not null,
	c_u_id varchar2(20 char) not null,
	c_r_campingenddate date not null,
	c_campingreview	varchar2(100) not null,
	c_campingstar number(5) not null,
	c_date date not null
);

create sequence campingreview_seq;

insert into campingreview_table values(campingreview_seq.nextval,1,'kim','20220320','좋아요',5,'20220321');

select * from campingreview_table;
-------------------------------------------------------------------------------------------------------------------------------------
7. 캠핑 리뷰 댓글달기(사장이)
/*
 * 사장이 자신의 캠핑에서만 대댓글 달게 만들기
 */

create table campingreview_bossreply_table(	
	cr_no number(5) primary key,
	cr_cam_no number(5) not null,
	cr_bo_id varchar2(20 char) not null,
	cr_u_id	varchar2(20 char) not null,
	cr_replytxt	varchar2(100 char) not null,
	cr_date	date not null
);

create sequence campingreview_bossreply_seq;

insert into campingreview_bossreply_table values(campingreview_bossreply_seq.nextval,1,'kim2','kim','감사합니다','20220322');

select * from campingreview_bossreply_table;
-------------------------------------------------------------------------------------------------------------------------------------
8. 캠핑용품 등록(관리자만)
create table product_registration_table(
	p_no number(5) primary key,
	p_name varchar2(20 char) not null,
	p_price	number(10) not null,
	p_picture varchar2(200 char) not null,
	p_txt varchar2(200 char) not null
);

create sequence product_registration_seq;

insert into product_registration_table values(product_registration_seq.nextval,'캠핑용품',10000,'b.jpg','캠핑용품입니다');

select * from product_registration_table;
-------------------------------------------------------------------------------------------------------------------------------------
9. 밀키트 등록(관리자만)
create table foodproduct_registration_table(
	fp_no number(5) primary key,
	fp_name varchar2(20 char) not null,
	fp_price	number(10) not null,
	fp_picture varchar2(200 char) not null,
	fp_txt varchar2(200 char) not null
);

create sequence foodproduct_registration_seq;

insert into foodproduct_registration_table values(foodproduct_registration_seq.nextval,'캠핑용품',10000,'b.jpg','캠핑용품입니다');

select * from foodproduct_registration_table;
-------------------------------------------------------------------------------------------------------------------------------------
10. 캠핑용품 구매목록
/*
 * 하나만 선택되도록 radio box
 * 새로운 배송지가 null값이면 기존배송지 아니면 새로운 배송지가 뜨도록 만들기
 * */
drop table guest_product_buy_table;
create table guest_product_buy_table(		
	b_no number(5) primary key, /*(주문번호)*/
	b_u_bo_id varchar2(20 char) not null,
	b_p_no number(5) not null,
	b_p_name varchar2(20 char) not null,
	b_price	number(5) not null, /*(수량*p_price)*/
	b_number number(5) not null,
	b_u_address varchar2(100 char) not null, /*(기존 자기 정보 배송지)*/
	b_new_address varchar2(100 char) null,
	b_date date not null
);

create sequence g_p_buy_seq;

insert into guest_product_buy_table values(g_p_buy_seq.nextval,'kim',1,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');

select * from guest_product_buy_table;
-------------------------------------------------------------------------------------------------------------------------------------
11. 밀키트 구매목록
/*
 * 하나만 선택되도록 radio box
 * 새로운 배송지가 null값이면 기존배송지 아니면 새로운 배송지가 뜨도록 만들기
 * */
drop table guest_product_buy_table;
create table guest_foodproduct_buy_table(		
	fb_no number(5) primary key, /*(주문번호)*/
	fb_u_bo_id varchar2(20 char) not null,
	fb_p_no number(5) not null,
	fb_p_name varchar2(20 char) not null,
	fb_price	number(5) not null, /*(수량*p_price)*/
	fb_number number(5) not null,
	fb_u_address varchar2(100 char) not null, /*(기존 자기 정보 배송지)*/
	fb_new_address varchar2(100 char) null,
	fb_date date not null
);

create sequence g_fp_buy_seq;

insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim',1,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');

select * from guest_foodproduct_buy_table;
-------------------------------------------------------------------------------------------------------------------------------------
12. 캠핑용품 장바구니
create table guest_product_basket_table(
	ba_no number(5) primary key,  /*장바구니 no*/
	ba_p_no	number(5) not null,   /*상품 no*/
	ba_u_bo_id varchar2(20 char) not null, /*유저,보스 아이디*/
	ba_p_name varchar2(20 char) not null, /*상품명 */
	ba_p_picture varchar2(20 char) not null, /*상품이미지*/
	ba_price number(10) not null, /*(수량*p_price) = 가격*/  
	ba_number number(10) not null/*수량*/                 
);

drop table guest_product_basket_table;
create sequence product_basket_seq;

insert into guest_product_basket_table values
(product_basket_seq.nextval,상품넘버,유저아이디,상품명,상품사진,상품가격,수량);
insert into guest_product_basket_table values
(product_basket_seq.nextval,1,'kim','캠핑용품','a.jpg',10000,3);

select * from guest_product_basket_table;
-------------------------------------------------------------------------------------------------------------------------------------
13. 밀키트 장바구니
create table guest_foodproduct_basket_table(
	fba_no number(5) primary key,
	fba_fp_no	number(5) not null,
	fba_u_bo_id varchar2(20 char) not null,
	fba_fp_name varchar2(20 char) not null,
	fba_fp_picture varchar2(20 char) not null,
	fba_price number(10) not null, /*(수량*p_price)*/
	fba_number number(10) not null
);

drop table guest_foodproduct_basket_table;
create sequence foodproduct_basket_seq;

insert into guest_foodproduct_basket_table values(foodproduct_basket_seq.nextval,1,'kim','캠핑용품','a.jpg',10000,3);

select * from guest_foodproduct_basket_table;
-------------------------------------------------------------------------------------------------------------------------------------
14. 캠핑용품 리뷰
create table product_review_table(	
	pr_no number(5)	primary key,
	pr_u_bo_id varchar2(20 char) not null,
	pr_txt varchar2(100 char) not null,
	pr_date	date not null
);

create sequence product_review_seq;

insert into product_review_table values(product_review_seq.nextval,'kim','좋아요','20220301');

select * from product_review_table;
-------------------------------------------------------------------------------------------------------------------------------------
15. 밀키트 리뷰
create table foodproduct_review_table(	
	fpr_no number(5) primary key,
	fpr_u_bo_id varchar2(20 char) not null,
	fpr_txt varchar2(100 char) not null,
	fpr_date date not null
);

create sequence foodproduct_review_seq;

insert into foodproduct_review_table values(foodproduct_review_seq.nextval,'kim','좋아요','20220301');

select * from foodproduct_review_table;
-------------------------------------------------------------------------------------------------------------------------------------
16. 자유게시판
create table free_board_table(	
	f_no number(5) primary key,
	f_u_id varchar2(20 char) not null,
	f_subject varchar2(20 char)	not null,
	f_txt varchar2(100 char) not null,
	f_picture varchar2(200 char) null,
	f_readcount	number(5) not null,
	f_date date	not null
);

create sequence free_board_seq;

insert into free_board_table values(free_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');

select * from free_board_table;
-------------------------------------------------------------------------------------------------------------------------------------
17. 자유게시판 리뷰
drop table free_board_reply_table
create table free_board_reply_table(
	fr_no number(5) primary key,
	fr_f_no	number(5) not null,
	fr_u_id	varchar2(100 char) not null,
	fr_owner_no	varchar2(100 char) null,
	fr_owner_id	varchar2(100 char) null,
	fr_replytxt	varchar2(100 char) not null,
	fr_date	date not null,
	fr_depth number(5) not null,
	fr_picture varchar2(200 char) not null,
	constraint free
		foreign key(fr_f_no)
		references free_board_table(f_no)
		on delete cascade
);

create sequence free_board_reply_seq;

insert into free_board_reply_table values(free_board_reply_seq.nextval,1,'kim',null,null,'댓글입니다','20220210',3,'a.jpg');

select * from free_board_reply_table;
select count(*) from free_board_reply_table where fr_owner_no=
select fr_no from free_board_reply_table where fr_u_id='(알수없음)';
select count(*) from free_board_reply_table where fr_owner_no=411;
select count(*) from free_board_reply_table where fr_u_id='(알수없음)' and fr_no=403;
-------------------------------------------------------------------------------------------------------------------------------------
18. 캠핑팁게시판
create table campingtip_board_table(	
	tip_no number(5) primary key,
	tip_u_id varchar2(20 char) not null,
	tip_subject varchar2(20 char)	not null,
	tip_txt varchar2(100 char) not null,
	tip_picture varchar2(200 char) null,
	tip_readcount	number(5) not null,
	tip_date date	not null
);

create sequence campingtip_board_seq;

insert into campingtip_board_table values(campingtip_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');

select * from campingtip_board_table;

19. 캠핑팁 리뷰
drop table campingtip_board_reply_table
create table campingtip_board_reply_table(
    tipr_no number(5) primary key,
    tipr_tip_no    number(5) not null,
    tipr_u_id    varchar2(100 char) not null,
    tipr_owner_no    varchar2(100 char) null,
    tipr_owner_id    varchar2(100 char) null,
    tipr_replytxt    varchar2(100 char) not null,
    tipr_date    date not null,
    tipr_depth number(5) not null,
    tipr_picture varchar2(200 char) not null,
    constraint campingtip
        foreign key(tipr_f_no)
        references campingtip_board_table(tip_no)
        on delete cascade
);

create sequence campingtip_board_reply_seq;

insert into campingtip_board_reply_table values(campingtip_board_reply_seq.nextval,1,'kim',null,null,'댓글입니다','20220210',3,'a.jpg');

select * from campingtip_board_reply_table;
-------------------------------------------------------------------------------------------------------------------------------------
20. 레시피 게시판
create table recipe_board_table(	
	rb_no number(5) primary key,
	rb_u_id varchar2(20 char) not null,
	rb_subject varchar2(20 char)	not null,
	rb_txt varchar2(100 char) not null,
	rb_picture varchar2(200 char) null,
	rb_readcount	number(5) not null,
	rb_date date	not null
);

create sequence recipe_board_seq;

insert into recipe_board_table values(recipe_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');

select * from recipe_board_table;
-------------------------------------------------------------------------------------------------------------------------------------
21. 레시피 리뷰
drop table recipe_board_reply_table
create table recipe_board_reply_table(
    rr_no number(5) primary key,
    rr_rb_no    number(5) not null,
    rr_u_id    varchar2(100 char) not null,
    rr_owner_no    varchar2(100 char) null,
    rr_owner_id    varchar2(100 char) null,
    rr_replytxt    varchar2(100 char) not null,
    rr_date    date not null,
    rr_depth number(5) not null,
    rr_picture varchar2(200 char) not null,
    constraint recipe
        foreign key(rr_f_no)
        references recipe_board_table(rb_no)
        on delete cascade
);

create sequence recipe_board_reply_seq;

insert into recipe_board_reply_table values(recipe_board_reply_seq.nextval,1,'kim',null,null,'댓글입니다','20220210',3,'a.jpg');

select * from recipe_board_reply_table;








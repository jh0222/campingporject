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
drop table user_table;
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

insert into user_table values(1,'김태희','kim','k1234!','kim1234@naver.com','서울특별시 종로구','01012341234','19970101','a.jpg',0);
insert into user_table values(2,'서지현','seo','s0222!','gihyun0222@naver.com','서울특별시 영등포구 신길동 285-1','01043736063','19980222','서지현.jpg',0);
insert into user_table values(3,'조문영','cho','j0522!','jmy970522@naver.com','서울특별시 강북구 번동 463-44','01022028496','19970522','조문영.jpg',0);
insert into user_table values(4,'강용식','kang','11111','kang1111@naver.com','서울특별시 종로구 연건동 28-21','01062137439','19970101','강용식.jpg',0);
insert into user_table values(5,'권민정','kwon','k0325!','kwon0325@naver.com','서울특별시 노원구 공릉동 172','01021625580','19990325','권민정.jpg',0);
insert into user_table values(6,'이명재','lee','l0516!','lee0516@naver.com','서울특별시 종로구 관철동 13-13','01092379156','19890516','이명재.jpg',0);

select * from USER_TABLE;
-------------------------------------------------------------------------------------------------------------------------------------
2. 사장 테이블
drop table boss_table;
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

insert into boss_table values(1,'김연아','kim2','k12345!','kim12345@naver.com','서울특별시 종로구','01012341235','19880522','a.jpg',0);
insert into boss_table values(2,'김우빈','kim22','k123456!','kim22@naver.com','부산광역시 중구 영주동 535-31','01011112222','19790321','사장1.jpg',0);
insert into boss_table values(3,'이진기','lee2','l12345!','lee2@daum.net','경기도 남양주시 삼패동 35','01012124343','19691219','사장2.jpg',0);
insert into boss_table values(4,'최우식','che2','c12345!','che2@google.com','인천광역시 중구 중앙동4가 1-6','01067890523','19660913','사장3.jpg',0);
insert into boss_table values(5,'이광수','lee3','l123456!','lee3@naver.com','서울특별시 노원구 월계동 868-5','01024684699','19770717','사장4.jpg',0);
insert into boss_table values(6,'유재석','you2','y12345!','you2@daum.net','제주특별자치도 제주시 일도일동 1070-9','01012344321','19881225','사장5.jpg',0);

select * from boss_TABLE;
-------------------------------------------------------------------------------------------------------------------------------------
3. 캠핑 테이블 
drop table camping_table;
create table camping_table(
    cam_no number(5) primary key,
    cam_bo_id varchar2(20 char) not null,
    cam_name varchar2(30 char) not null,
    cam_picture varchar2(200 char) not null,
    cam_txt varchar2(1000 char) not null,
    cam_phonenumber varchar2(30 char) not null,
    cam_price number(10) not null,
    cam_address varchar2(100 char) not null,
    cam_latitude varchar2(30 char) not null,   
    cam_longitude varchar2(30 char) not null,    
    cam_headcount number(5) not null
);

create sequence camping_seq;
drop sequence camping_seq;

insert into camping_table values(1,'kim2','난지캠핑장','nanji.jpg','캠핑장','02-373-2021',20000,'서울 마포구 한강난지로 28','37.57035','126.87264',40);
insert into camping_table values(2,'kim22','중람캠핑숲','중랑캠핑숲.jpg','서울 근교 프라이빗한 산속 캠핑장과 독채펜션','0507-1348-8138',60000,'서울 중랑구 망우로87길 110','37.60468107569335', '127.10961189798245',20);
insert into camping_table values(3,'lee2','산청 지리산 자양보 오토캠핑장','산청 지리산 자양보 오토캠핑장.jpg','자양보 유원지 바로 옆! 천왕봉을 바라보는 산청 타프캠핑장 (글램핑타프+데크)','010-4143-3005',60000,'경남 산청군 시천면 남명로 392-23 (사리)','35.26737329507498', '127.85534203516632',3);
insert into camping_table values(4,'che2','단양 솔티천캠핑&펜션','단양 솔티천캠핑&펜션.jpg','소백산자연속 캠핑과힐링 만천하스카이,카페산,패러 액티비티를 동시에!단양솔티천 캠핑&펜션','043-421-5789',40000,'충북 단양군 단양읍 천동4길 10-7','36.96603532652186','128.41932535095748',12);
insert into camping_table values(5,'lee3','지리산반내골오토캠핑장','지리산반내골오토캠핑장.jpg','지리산 중산리 계곡의 맑은 시냇물과 지리산 정기가 어우러진 물맑고 조용한 오토캠핑장.','061-781-5400',80000,'전남 구례군 문척면 중산로 555','35.14651274571855','127.50233817959402',40);
insert into camping_table values(6,'you2','산중오토캠핑장','산중오토캠핑장.jpg','거창 산속을 제대로 느낄 수 있는 신축 캠핑장','02-373-2021',50000,'경남 거창군 북상면 송계사길 63-107','35.82298790994905','127.79912836041417',5);
insert into camping_table values(camping_seq.nextval,'you2','산중오토캠핑장','산중오토캠핑장.jpg','거창 산속을 제대로 느낄 수 있는 신축 캠핑장','02-373-2021',50000,'경남 거창군 북상면 송계사길 63-107','35.82298790994905','127.79912836041417',5);

select * from camping_table;
-------------------------------------------------------------------------------------------------------------------------------------
4. 예약 테이블
drop table reservation_table;
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

[난지캠핑장]
insert into reservation_table values(1,1,'kim','김태희','01012341234','난지캠핑장','20220324','20220330',2,40000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(2,1,'seo','서지현','01043736063','난지캠핑장','20220308','20220309',3,60000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(3,1,'cho','조문영','01022028496','난지캠핑장','20220324','20220330',4,80000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(4,1,'kang','강용식','01062137439','난지캠핑장','20220309','20220310',2,40000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(5,1,'kwon','권민정','01021625580','난지캠핑장','20220309','20220310',4,80000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(6,1,'lee','이명재','01092379156','난지캠핑장','20220324','20220330',2,40000,'02-373-2021','서울 마포구 한강난지로 28');

[중랑캠핑숲]
insert into reservation_table values(7,2,'kim','김태희','01012341234','중랑캠핑숲','20220309','20220310',2,60000,'0507-1348-8138','서울 중랑구 망우로87길 110');
insert into reservation_table values(8,2,'seo','서지현','01043736063','중랑캠핑숲','20220308','20220309',3,90000,'0507-1348-8138','서울 중랑구 망우로87길 110');
insert into reservation_table values(9,2,'cho','조문영','01022028496','중랑캠핑숲','20220324','20220330',4,120000,'0507-1348-8138','서울 중랑구 망우로87길 110');
insert into reservation_table values(10,2,'kang','강용식','01062137439','중랑캠핑숲','20220309','20220310',2,60000,'0507-1348-8138','서울 중랑구 망우로87길 110');
insert into reservation_table values(11,2,'kwon','권민정','01021625580','중랑캠핑숲','20220324','20220330',4,120000,'0507-1348-8138','서울 중랑구 망우로87길 110');
insert into reservation_table values(12,2,'lee','이명재','01092379156','중랑캠핑숲','20220307','20220308',2,60000,'0507-1348-8138','서울 중랑구 망우로87길 110');

[산청지리산자양보오토캠핑장]
insert into reservation_table values(13,3,'kim','김태희','01012341234','산청 지리산 자양보 오토캠핑장','20220309','20220310',2,120000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');
insert into reservation_table values(14,3,'seo','서지현','01043736063','산청 지리산 자양보 오토캠핑장','20220308','20220309',3,180000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');
insert into reservation_table values(15,3,'cho','조문영','01022028496','산청 지리산 자양보 오토캠핑장','20220308','20220309',4,240000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');
insert into reservation_table values(16,3,'kang','강용식','01062137439','산청 지리산 자양보 오토캠핑장','20220309','20220310',2,120000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');
insert into reservation_table values(17,3,'kwon','권민정','01021625580','산청 지리산 자양보 오토캠핑장','20220309','20220310',4,240000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');
insert into reservation_table values(18,3,'lee','이명재','01092379156','산청 지리산 자양보 오토캠핑장','20220307','20220308',2,120000,'010-4143-3005','경남 산청군 시천면 남명로 392-23');

[단양 솔티천캠핑&펜션]
insert into reservation_table values(19,4,'kim','김태희','01012341234','단양 솔티천캠핑&펜션','20220309','20220310',2,80000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');
insert into reservation_table values(20,4,'seo','서지현','01043736063','단양 솔티천캠핑&펜션','20220308','20220309',3,120000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');
insert into reservation_table values(21,4,'cho','조문영','01022028496','단양 솔티천캠핑&펜션','20220308','20220309',4,160000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');
insert into reservation_table values(22,4,'kang','강용식','01062137439','단양 솔티천캠핑&펜션','20220309','20220310',2,80000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');
insert into reservation_table values(23,4,'kwon','권민정','01021625580','단양 솔티천캠핑&펜션','20220309','20220310',4,160000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');
insert into reservation_table values(24,4,'lee','이명재','01092379156','단양 솔티천캠핑&펜션','20220307','20220308',2,80000,'043-421-5789','충북 단양군 단양읍 천동4길 10-7');

[지리산반내골오토캠핑장]
insert into reservation_table values(25,5,'kim','김태희','01012341234','지리산반내골오토캠핑장','20220309','20220310',2,160000,'061-781-5400','전남 구례군 문척면 중산로 555');
insert into reservation_table values(26,5,'seo','서지현','01043736063','지리산반내골오토캠핑장','20220308','20220309',3,180000,'061-781-5400','전남 구례군 문척면 중산로 555');
insert into reservation_table values(27,5,'cho','조문영','01022028496','지리산반내골오토캠핑장','20220308','20220309',4,320000,'061-781-5400','전남 구례군 문척면 중산로 555');
insert into reservation_table values(28,5,'kang','강용식','01062137439','지리산반내골오토캠핑장','20220309','20220310',2,160000,'061-781-5400','전남 구례군 문척면 중산로 555');
insert into reservation_table values(29,5,'kwon','권민정','01021625580','지리산반내골오토캠핑장','20220309','20220310',4,320000,'061-781-5400','전남 구례군 문척면 중산로 555');
insert into reservation_table values(30,5,'lee','이명재','01092379156','지리산반내골오토캠핑장','20220307','20220308',2,160000,'061-781-5400','전남 구례군 문척면 중산로 555');

[산중오토캠핑장]
insert into reservation_table values(31,6,'kim','김태희','01012341234','산중오토캠핑장','20220309','20220310',2,100000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');
insert into reservation_table values(32,6,'seo','서지현','01043736063','산중오토캠핑장','20220308','20220309',3,150000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');
insert into reservation_table values(33,6,'cho','조문영','01022028496','산중오토캠핑장','20220308','20220309',4,200000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');
insert into reservation_table values(34,6,'kang','강용식','01062137439','산중오토캠핑장','20220309','20220310',2,100000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');
insert into reservation_table values(35,6,'kwon','권민정','01021625580','산중오토캠핑장','20220309','20220310',4,200000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');
insert into reservation_table values(36,6,'lee','이명재','01092379156','산중오토캠핑장','20220307','20220308',2,100000,'010-5468-5007','경남 거창군 북상면 송계사길 63-107');

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

select * from campingheart_table;
-------------------------------------------------------------------------------------------------------------------------------------
6. 캠핑 리뷰
drop table campingreview_table;
create table campingreview_table(		
	c_no number(5) primary key,
	c_cam_no number(5) not null,
	c_u_id varchar2(20 char) not null,	
	c_campingreview	varchar2(100) not null,
	c_campingstar number(5) not null,
	c_date date not null
);

create sequence campingreview_seq;

[난지캠핑장]
insert into campingreview_table values(1,1,'seo','너무 좋아요',5,'20220310');
insert into campingreview_table values(2,1,'kwon','조금 아쉬워요',3,'20220311');

[중랑캠핑숲]
insert into campingreview_table values(3,2,'kim','너무 좋아요',5,'20220312');
insert into campingreview_table values(4,2,'seo','괜찮아요',4,'20220310');
insert into campingreview_table values(5,2,'kang','너무 좋아요',5,'20220311');

[산청지리산자양보오토캠핑장]
insert into campingreview_table values(6,3,'kim','너무 좋아요',5,'20220313');
insert into campingreview_table values(7,3,'seo','괜찮아요',4,'20220310');
insert into campingreview_table values(8,3,'cho','괜찮아요',4,'20220310');
insert into campingreview_table values(9,3,'kang','별로입니다',1,'20220311');
insert into campingreview_table values(10,3,'kwon','괜찮아요',4,'20220311');

[단양 솔티천캠핑&펜션]
insert into campingreview_table values(11,4,'kim','괜찮아요',3,'20220312');
insert into campingreview_table values(12,4,'seo','괜찮아요',3,'20220310');
insert into campingreview_table values(13,4,'cho','별로입니다',1,'20220310');

[지리산반내골오토캠핑장]
insert into campingreview_table values(14,5,'kim','괜찮아요',4,'20220311');
insert into campingreview_table values(15,5,'seo','너무 좋아요',5,'20220310');

[산중오토캠핑장]
insert into campingreview_table values(16,6,'kwon','괜찮아요',3,'20220311');

select * from campingreview_table;
-------------------------------------------------------------------------------------------------------------------------------------
7. 캠핑 리뷰 댓글달기(사장이)
drop table campingreview_bossreply_table
create table campingreview_bossreply_table(	
	cr_no number(5) primary key,
	cr_c_no number(5) not null,
	cr_cam_no number(5) not null,
	cr_bo_id varchar2(20 char) not null,
	cr_replytxt	varchar2(100 char) not null,
	cr_date	date not null
);

create sequence campingreview_bossreply_seq;

[난지캠핑장]
insert into campingreview_bossreply_table values(1,1,1,'kim2','감사합니다','20220310');
insert into campingreview_bossreply_table values(2,2,1,'kim2','감사합니다','20220311');

[중랑캠핑숲]
insert into campingreview_bossreply_table values(3,3,2,'kim22','감사합니다','20220312');
insert into campingreview_bossreply_table values(4,4,2,'kim22','감사합니다','20220310');
insert into campingreview_bossreply_table values(5,5,2,'kim22','감사합니다','20220311');

[산청지리산자양보오토캠핑장]
insert into campingreview_bossreply_table values(6,6,3,'lee2','감사합니다','20220313');
insert into campingreview_bossreply_table values(7,7,3,'lee2','감사합니다','20220310');
insert into campingreview_bossreply_table values(8,8,3,'lee2','감사합니다','20220310');
insert into campingreview_bossreply_table values(9,9,3,'lee2','감사합니다','20220311');
insert into campingreview_bossreply_table values(10,10,3,'lee2','감사합니다','20220311');

[단양 솔티천캠핑&펜션]
insert into campingreview_bossreply_table values(11,11,4,'che2','감사합니다','20220312');
insert into campingreview_bossreply_table values(12,12,4,'che2','감사합니다','20220310');
insert into campingreview_bossreply_table values(13,13,4,'che2','감사합니다','20220310');

[지리산반내골오토캠핑장]
insert into campingreview_bossreply_table values(14,14,5,'lee3','감사합니다','20220311');
insert into campingreview_bossreply_table values(15,15,5,'lee3','감사합니다','20220310');

select * from campingreview_bossreply_table;
-------------------------------------------------------------------------------------------------------------------------------------
8. 캠핑용품 등록(관리자만)
drop table product_registration_table
create table product_registration_table(
    p_no number(5) primary key,
    p_name varchar2(20 char) not null,
    p_price    number(10) not null,
    p_picture varchar2(200 char) not null,
    p_txt clob not null
);

create sequence product_registration_seq;

select * from product_registration_table;
-------------------------------------------------------------------------------------------------------------------------------------
9. 밀키트 등록(관리자만)
drop table foodproduct_registration_table
create table foodproduct_registration_table(
    fp_no number(5) primary key,
    fp_name varchar2(20 char) not null,
    fp_price    number(10) not null,
    fp_picture varchar2(200 char) not null,
    fp_txt varchar2(200 char) not null
);

create sequence foodproduct_registration_seq;
select * from foodproduct_registration_table;
-------------------------------------------------------------------------------------------------------------------------------------
10. 캠핑용품 구매목록
drop table guest_product_buy_table;
create table guest_product_buy_table(		
	b_no number(5) primary key,			 	/*(주문번호)*/
	b_u_bo_id varchar2(20 char) not null,	/*아이디*/
	b_p_no number(5) not null,			 	/*상품번호*/
	b_p_name varchar2(20 char) not null,	/*상품명*/
	b_price	number(9) not null,				/*(수량*p_price)*/ ---추가
	b_number number(5) not null,			/*수량*/
	b_u_address varchar2(100 char) not null, /*(기존 자기 정보 배송지)*/
	b_new_address varchar2(100 char) null,
	b_date date not null
);

create sequence g_p_buy_seq;

select * from guest_product_buy_table;
-------------------------------------------------------------------------------------------------------------------------------------
11. 밀키트 구매목록
drop table guest_foodproduct_buy_table;
create table guest_foodproduct_buy_table(		
	fb_no number(5) primary key, /*(주문번호)*/
	fb_u_bo_id varchar2(20 char) not null,
	fb_fp_no number(5) not null, 
	fb_fp_name varchar2(20 char) not null, 
	fb_price	number(9) not null, /*(수량*p_price)*/  ---추가
	fb_number number(5) not null, /*수량*/
	fb_u_address varchar2(100 char) not null, /*(기존 자기 정보 배송지)*/
	fb_new_address varchar2(100 char) null,
	fb_date date not null
);
create sequence g_fp_buy_seq;

select * from guest_foodproduct_buy_table;
-------------------------------------------------------------------------------------------------------------------------------------
12. 캠핑용품 장바구니
drop table guest_product_basket_table;
create table guest_product_basket_table(
	ba_no number(5) primary key, /*캠핑용품 장바구니 번호*/
	ba_p_no	number(5) not null,  /* 캠핑용품 등록 번호*/
	ba_u_bo_id varchar2(20 char) not null, /* 사용자와 사장 id*/
	ba_p_name varchar2(20 char) not null, /*캠핑용품 이름*/
	ba_p_picture varchar2(200 char) not null,
	ba_price number(10) not null, /*(수량*p_price)*/
	ba_number number(5) not null /* 갯수 */
);

create sequence product_basket_seq;

insert into guest_product_basket_table values(1,1,'kim','캠핑용품1','a.jpg',2000,2);
insert into guest_product_basket_table values(2,2,'kim','캠핑용품2','a.jpg',2000,2);
insert into guest_product_basket_table values(3,3,'kim','캠핑용품3','a.jpg',2000,2);
insert into guest_product_basket_table values(4,4,'kim','캠핑용품4','a.jpg',2000,2);

select * from guest_product_basket_table;
-------------------------------------------------------------------------------------------------------------------------------------
13. 밀키트 장바구니
drop table guest_foodproduct_basket_table;
create table guest_foodproduct_basket_table(
	fba_no number(5) primary key, /*밀키트 장바구니 번호*/
	fba_fp_no number(5) not null, /*밀키트 등록 번호*/
	fba_u_bo_id varchar2(20 char) not null, /*사용자와 사장 id*/
	fba_fp_name varchar2(20 char) not null,/*밀키트 이름*/
	fba_fp_picture varchar2(200 char) not null,
	fba_price number(5) not null, /*(수량*p_price)*/
	fba_number number(5) not null /*갯수*/
);

create sequence foodproduct_basket_seq;

select * from guest_foodproduct_basket_table;
-------------------------------------------------------------------------------------------------------------------------------------
14. 캠핑용품 리뷰
drop table product_review_table
create table product_review_table(
    pr_no number(5)    primary key,
    pr_p_no number(5) not null, 
    pr_u_bo_id varchar2(20 char) not null,
    pr_txt varchar2(100 char) not null,
    pr_star number(5) not null,
    pr_date    date not null
);

create sequence product_review_seq;

select * from product_review_table;
-------------------------------------------------------------------------------------------------------------------------------------
15. 밀키트 리뷰
drop table foodproduct_review_table
create table foodproduct_review_table(
    fpr_no number(5) primary key,
    fpr_fp_no number(5) not null, -----------------수정
    fpr_u_bo_id varchar2(20 char) not null,
    fpr_txt varchar2(100 char) not null,
    fpr_date date not null
);

create sequence foodproduct_review_seq;

select * from foodproduct_review_table;
-------------------------------------------------------------------------------------------------------------------------------------
16. 자유게시판
drop table free_board_table;
create table free_board_table(	
	f_no number(5) primary key,
	f_u_id varchar2(20 char) not null,
	f_subject varchar2(20 char)	not null,
	f_txt clob not null,
	f_readcount	number(5) not null,
	f_date date	not null
);

create sequence free_board_seq;

insert into free_board_table values(1,'kim','자유게시판1','자유게시판 내용',1,'20220312');
insert into free_board_table values(2,'seo','자유게시판2','자유게시판 내용',2,'20220312');
insert into free_board_table values(3,'lee','자유게시판3','자유게시판 내용',1,'20220312');
insert into free_board_table values(4,'lee','자유게시판4','자유게시판 내용',1,'20220312');
insert into free_board_table values(5,'seo','자유게시판5','자유게시판 내용',4,'20220312');
insert into free_board_table values(6,'kang','자유게시판6','자유게시판 내용',6,'20220312');
insert into free_board_table values(7,'cho','자유게시판7','자유게시판 내용',7,'20220312');
insert into free_board_table values(8,'cho','자유게시판8','자유게시판 내용',4,'20220312');
insert into free_board_table values(9,'kim','자유게시판9','자유게시판 내용',5,'20220312');
insert into free_board_table values(10,'kang','자유게시판10','자유게시판 내용',1,'20220312');
insert into free_board_table values(11,'cho','자유게시판11','자유게시판 내용',2,'20220312');
insert into free_board_table values(12,'kim','자유게시판12','자유게시판 내용',5,'20220312');
insert into free_board_table values(13,'kang','자유게시판13','자유게시판 내용',8,'20220312');
insert into free_board_table values(14,'kwon','자유게시판14','자유게시판 내용',7,'20220312');

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

insert into free_board_reply_table values(1,1,'seo',null,null,'댓글1','20220312',3,'서지현.jpg');
insert into free_board_reply_table values(2,2,'seo',null,null,'댓글2','20220312',3,'서지현.jpg');
insert into free_board_reply_table values(3,3,'cho',null,null,'댓글3','20220312',3,'조문영.jpg');
insert into free_board_reply_table values(4,4,'cho',null,null,'댓글4','20220312',3,'조문영.jpg');
insert into free_board_reply_table values(5,5,'kim',null,null,'댓글5','20220312',3,'a.jpg');
insert into free_board_reply_table values(6,6,'cho',null,null,'댓글6','20220312',3,'조문영.jpg');
insert into free_board_reply_table values(7,7,'seo',null,null,'댓글7','20220312',3,'서지현.jpg');
insert into free_board_reply_table values(8,8,'lee',null,null,'댓글8','20220312',3,'이명재.jpg');
insert into free_board_reply_table values(9,9,'kang',null,null,'댓글9','20220312',3,'강용식.jpg');
insert into free_board_reply_table values(10,10,'kim',null,null,'댓글10','20220312',3,'a.jpg');
insert into free_board_reply_table values(11,11,'kang',null,null,'댓글11','20220312',3,'강용식.jpg');
insert into free_board_reply_table values(12,12,'seo',null,null,'댓글12','20220312',3,'서지현.jpg');
insert into free_board_reply_table values(13,13,'lee',null,null,'댓글13','20220312',3,'이명재.jpg');
insert into free_board_reply_table values(14,14,'seo',null,null,'댓글14','20220312',3,'서지현.jpg');
insert into free_board_reply_table values(15,14,'kang',null,null,'댓글15','20220312',3,'강용식.jpg');
insert into free_board_reply_table values(16,14,'cho',null,null,'댓글16','20220312',3,'조문영.jpg');
insert into free_board_reply_table values(17,14,'kang',14,'seo','대댓글1','20220312',0,'강용식.jpg');
insert into free_board_reply_table values(18,14,'lee',14,'seo','대댓글2','20220312',0,'이명재.jpg');
insert into free_board_reply_table values(19,14,'seo',14,'kang','대대댓글1','20220312',1,'서지현.jpg');

select * from free_board_reply_table;
-------------------------------------------------------------------------------------------------------------------------------------
18. 캠핑팁게시판
drop table campingtip_board_table
create table campingtip_board_table(	
	tip_no number(5) primary key,
	tip_u_id varchar2(20 char) not null,
	tip_subject varchar2(20 char)	not null,
	tip_txt clob not null,
	tip_readcount number(5) not null,
	tip_date date not null
);

create sequence campingtip_board_seq;

insert into campingtip_board_table values(1,'kim','캠핑팁1','캠핑팁 내용',1,'20220312');
insert into campingtip_board_table values(2,'seo','캠핑팁2','캠핑팁 내용',2,'20220312');
insert into campingtip_board_table values(3,'lee','캠핑팁3','캠핑팁 내용',1,'20220312');
insert into campingtip_board_table values(4,'lee','캠핑팁4','캠핑팁 내용',1,'20220312');
insert into campingtip_board_table values(5,'seo','캠핑팁5','캠핑팁 내용',4,'20220312');
insert into campingtip_board_table values(6,'kang','캠핑팁6','캠핑팁 내용',6,'20220312');
insert into campingtip_board_table values(7,'cho','캠핑팁7','캠핑팁 내용',7,'20220312');
insert into campingtip_board_table values(8,'cho','캠핑팁8','캠핑팁 내용',4,'20220312');
insert into campingtip_board_table values(9,'kim','캠핑팁9','캠핑팁 내용',5,'20220312');
insert into campingtip_board_table values(10,'kang','캠핑팁10','캠핑팁 내용',1,'20220312');
insert into campingtip_board_table values(11,'cho','캠핑팁11','캠핑팁 내용',2,'20220312');
insert into campingtip_board_table values(12,'kim','캠핑팁12','캠핑팁 내용',5,'20220312');
insert into campingtip_board_table values(13,'kang','캠핑팁13','캠핑팁 내용',8,'20220312');
insert into campingtip_board_table values(14,'kwon','캠핑팁14','캠핑팁 내용',7,'20220312');

select * from campingtip_board_table;
-------------------------------------------------------------------------------------------------------------------------------------
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
        foreign key(tipr_tip_no)
        references campingtip_board_table(tip_no)
        on delete cascade
);

create sequence campingtip_board_reply_seq;

insert into campingtip_board_reply_table values(1,1,'seo',null,null,'댓글1','20220312',3,'서지현.jpg');
insert into campingtip_board_reply_table values(2,2,'seo',null,null,'댓글2','20220312',3,'서지현.jpg');
insert into campingtip_board_reply_table values(3,3,'cho',null,null,'댓글3','20220312',3,'조문영.jpg');
insert into campingtip_board_reply_table values(4,4,'cho',null,null,'댓글4','20220312',3,'조문영.jpg');
insert into campingtip_board_reply_table values(5,5,'kim',null,null,'댓글5','20220312',3,'a.jpg');
insert into campingtip_board_reply_table values(6,6,'cho',null,null,'댓글6','20220312',3,'조문영.jpg');
insert into campingtip_board_reply_table values(7,7,'seo',null,null,'댓글7','20220312',3,'서지현.jpg');
insert into campingtip_board_reply_table values(8,8,'lee',null,null,'댓글8','20220312',3,'이명재.jpg');
insert into campingtip_board_reply_table values(9,9,'kang',null,null,'댓글9','20220312',3,'강용식.jpg');
insert into campingtip_board_reply_table values(10,10,'kim',null,null,'댓글10','20220312',3,'a.jpg');
insert into campingtip_board_reply_table values(11,11,'kang',null,null,'댓글11','20220312',3,'강용식.jpg');
insert into campingtip_board_reply_table values(12,12,'seo',null,null,'댓글12','20220312',3,'서지현.jpg');
insert into campingtip_board_reply_table values(13,13,'lee',null,null,'댓글13','20220312',3,'이명재.jpg');
insert into campingtip_board_reply_table values(14,14,'seo',null,null,'댓글14','20220312',3,'서지현.jpg');
insert into campingtip_board_reply_table values(15,14,'kang',null,null,'댓글15','20220312',3,'강용식.jpg');
insert into campingtip_board_reply_table values(16,14,'cho',null,null,'댓글16','20220312',3,'조문영.jpg');
insert into campingtip_board_reply_table values(17,14,'kang',14,'seo','대댓글1','20220312',0,'강용식.jpg');
insert into campingtip_board_reply_table values(18,14,'lee',14,'seo','대댓글2','20220312',0,'이명재.jpg');
insert into campingtip_board_reply_table values(19,14,'seo',14,'kang','대대댓글1','20220312',1,'서지현.jpg');

select * from campingtip_board_reply_table;
-------------------------------------------------------------------------------------------------------------------------------------
20. 레시피 게시판
drop table recipe_board_table;
create table recipe_board_table(	
	rb_no number(5) primary key,
	rb_u_id varchar2(20 char) not null,
	rb_subject varchar2(20 char)	not null,
	rb_txt clob not null,
	rb_picture varchar2(200 char) not null,
	rb_readcount	number(5) not null,
	rb_date date	not null
);

create sequence recipe_board_seq;

insert into recipe_board_table values(1,'kim','레시피','레시피 내용','레시피1.jpg',1,'20220312');
insert into recipe_board_table values(2,'seo','레시피','레시피 내용','레시피2.jpg',2,'20220312');
insert into recipe_board_table values(3,'lee','레시피','레시피 내용','레시피3.jpg',1,'20220312');
insert into recipe_board_table values(4,'lee','레시피','레시피 내용','레시피4.jpg',1,'20220312');
insert into recipe_board_table values(5,'seo','레시피','레시피 내용','레시피5.jpg',4,'20220312');
insert into recipe_board_table values(6,'kang','레시피','레시피 내용','레시피6.jpg',6,'20220312');
insert into recipe_board_table values(7,'cho','레시피','레시피 내용','레시피7.jpg',7,'20220312');
insert into recipe_board_table values(8,'cho','레시피','레시피 내용','레시피8.jpg',4,'20220312');
insert into recipe_board_table values(9,'kim','레시피','레시피 내용','레시피9.jpg',5,'20220312');
insert into recipe_board_table values(10,'kang','레시피','레시피 내용','레시피10.jpg',1,'20220312');
insert into recipe_board_table values(11,'cho','레시피','레시피 내용','레시피11.jpg',2,'20220312');
insert into recipe_board_table values(12,'kim','레시피','레시피 내용','레시피12.jpg',5,'20220312');
insert into recipe_board_table values(13,'kang','캠핑장에서 리챔 감자짜글이',
'1.감자는 먹기 좋은 크기로 잘라줍니다<br>
양파도 굵직하게 채 썰어 준비했어요!~<br>
2.리챔은 그냥 사용해도 되지만 저는 팔팔 끓는 물에 리챔을 한번 데쳐주었어요~!<br>
그럼 불순물이 빠져서 담백하면서 맛있거든요~!~데친 리챔은 비닐팩에 넣어 으깨줍니다~!~<br>
3.냄비에 감자와 양파를 넣고 으깬 리챔을 넣고 물을 부어줍니다~!~<br>
감자가 익을 때까지 팔팔 끓여줍니다~!~<br>
마지막에 대파 청양고추를 넣어 마무리해주면 누구나 좋아하는 리챔 감자짜글이 완성입니다~!~<br>
4.리챔은 앞다리 돈육 함량을 90% 이상으로 유지하여 맛이 풍부하고 부드럽습니다~!~<br>
그래서 동원 리챔은 짜지 않고 맛이 좋아요<br>
5.맛있는 리챔을 넣은 감자짜글이 리챔으로 만들어서 훨씬 더 맛있답니다~!~<br>
6.캠핑장에서나 자취생들이 만들어먹기 좋은 감자짜글이 입니다<br>
남녀노소 누구나 좋아하는 감자짜글이 만드는법도 쉬워요','감자짜글이.jpg',8,'20220312');
insert into recipe_board_table values(14,'kwon','삼겹살 된장찌개',
'1.뚝배기에 물을 끓입니다<br>
2.고기 야채를 썰어놓습니다<br>
3.물이 끓으면 된장 청국장을 조금 싱겁게 풉니다<br>
4.고기를 넣고 끓입니다<br>
5.고기가 거의 익으면 호박 두부를 넣습니다<br>
6.호박이 익으면 기호에 맞게 간은 된장으로 하고 고추 파를 넣습니다<br>
7.한소끔 끓이고 불을 끕니다<br>','된장찌개.jpg',7,'20220312');

select * from recipe_board_table;
-------------------------------------------------------------------------------------------------------------------------------------
21. 레시피 리뷰
drop table recipe_board_reply_table
create table recipe_board_reply_table(
	rr_no number(5) primary key,
	rr_rb_no number(5) not null,
	rr_u_id	varchar2(100 char) not null,
	rr_owner_no	varchar2(100 char) null,
	rr_owner_id	varchar2(100 char) null,
	rr_replytxt	varchar2(100 char) not null,
	rr_date	date not null,
	rr_depth number(5) not null,
	rr_picture varchar2(200 char) not null,
	constraint recipe
		foreign key(rr_rb_no)
		references recipe_board_table(rb_no)
		on delete cascade
);

create sequence recipe_board_reply_seq;

insert into recipe_board_reply_table values(1,1,'seo',null,null,'댓글1','20220312',3,'서지현.jpg');
insert into recipe_board_reply_table values(2,2,'seo',null,null,'댓글2','20220312',3,'서지현.jpg');
insert into recipe_board_reply_table values(3,3,'cho',null,null,'댓글3','20220312',3,'조문영.jpg');
insert into recipe_board_reply_table values(4,4,'cho',null,null,'댓글4','20220312',3,'조문영.jpg');
insert into recipe_board_reply_table values(5,5,'kim',null,null,'댓글5','20220312',3,'a.jpg');
insert into recipe_board_reply_table values(6,6,'cho',null,null,'댓글6','20220312',3,'조문영.jpg');
insert into recipe_board_reply_table values(7,7,'seo',null,null,'댓글7','20220312',3,'서지현.jpg');
insert into recipe_board_reply_table values(8,8,'lee',null,null,'댓글8','20220312',3,'이명재.jpg');
insert into recipe_board_reply_table values(9,9,'kang',null,null,'댓글9','20220312',3,'강용식.jpg');
insert into recipe_board_reply_table values(10,10,'kim',null,null,'댓글10','20220312',3,'a.jpg');
insert into recipe_board_reply_table values(11,11,'kang',null,null,'댓글11','20220312',3,'강용식.jpg');
insert into recipe_board_reply_table values(12,12,'seo',null,null,'댓글12','20220312',3,'서지현.jpg');
insert into recipe_board_reply_table values(13,13,'lee',null,null,'댓글13','20220312',3,'이명재.jpg');
insert into recipe_board_reply_table values(14,14,'seo',null,null,'댓글14','20220312',3,'서지현.jpg');
insert into recipe_board_reply_table values(15,14,'kang',null,null,'댓글15','20220312',3,'강용식.jpg');
insert into recipe_board_reply_table values(16,14,'cho',null,null,'댓글16','20220312',3,'조문영.jpg');
insert into recipe_board_reply_table values(17,14,'kang',14,'seo','대댓글1','20220312',0,'강용식.jpg');
insert into recipe_board_reply_table values(18,14,'lee',14,'seo','대댓글2','20220312',0,'이명재.jpg');
insert into recipe_board_reply_table values(19,14,'seo',14,'kang','대대댓글1','20220312',1,'서지현.jpg');

select * from recipe_board_reply_table;
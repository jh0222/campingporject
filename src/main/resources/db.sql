
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

insert into user_table values(user_seq.nextval,'김태희','kim','k1234!','kim1234@naver.com','서울특별시 종로구','01012341234','19970101','a.jpg',0);
delete user_table where u_no = 141;
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
    cam_txt varchar2(1000 char) not null,
    cam_phonenumber varchar2(30 char) not null,
    cam_price number(10) not null,
    cam_address varchar2(100 char) not null,
    cam_latitude varchar2(30 char) not null,   
    cam_longitude varchar2(30 char) not null,    
    cam_headcount number(5) not null
);

select cam_no from camping_table where cam_bo_id='kim2'

alter table camping_table add cam_liked number(1) default 0 not null;

create sequence camping_seq;

insert into camping_table values(camping_seq.nextval,'kim2','난지캠핑장','cam.jpg','캠핑장','02-373-2021',20000,'서울 마포구 한강난지로 28','37.57035','126.87264',40,0);

select * from camping_table;

IF  THEN
처리문
ELSIF 조건2 THEN
처리문
select * from campingheart_table a,campingheart_table b where h_u_id = 'kim'
	select rn,c.*
		from(select Rownum as rn,a.*,star
			from camping_table a,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no(+)
			ORDER BY a.cam_no desc) c
		where RN >=1 and RN <=10;
	
		
		select Rownum as rn,a.*,star
			from camping_table a,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no
			ORDER BY a.cam_no desc
			
			select *
				from campingreview_table
			
		select rn,c.*
		from(select Rownum as rn,a.*,star
			from camping_table a,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no
			ORDER BY star desc) c
		where RN >=1 and RN <=10 and c.cam_price>=1000 and c.cam_price<=50000

-------------------------------------------------------------------------------------------------------------------------------------
4. 예약 테이블
/*
startdate~enddate예약되어있으면 처음부터 막아놓기,어제 날짜 막아놓기			
dbex) where sysdate> and startdate< enddate>  where cam_number			
*/
select cam_no from camping_table where cam_bo_id='kim2'

select *
from reservation_table
where r_cam_no = (select cam_no from camping_table where cam_bo_id='kim2');

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

insert into reservation_table values(reservation_seq.nextval,81,'kim','김태희','01012341234','난지캠핑장1','20220301','20220302',2,40000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(reservation_seq.nextval,164,'kim','김태희','01012341234','난지캠핑장','cam25.jpg','20220318','20220320',2,40000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(reservation_seq.nextval,1,'kim','김태희','01012341234','난지캠핑장','20220318','20220320',2,40000,'02-373-2021','서울 마포구 한강난지로 28');
insert into reservation_table values(reservation_seq.nextval,121,'kim','김태희','01012341234','난지캠핑장','20220301','20220302',2,40000,'02-373-2021','서울 마포구 한강난지로 28');

select * from reservation_table;
select r_u_id from reservation_table where r_cam_no=121 and r_u_id='kim' and  sysdate > r_campingenddate;
select * from campingheart_table where h_u_id='kim';


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

insert into campingheart_table values(campingheart_seq.nextval,21,'kim','난지캠핑장','서울 마포구 한강난지로 28',1);

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
	c_campingreview	varchar2(100) not null,
	c_campingstar number(5) not null,
	c_date date not null
);
	constraint recipe
		foreign key(rr_rb_no)
		references recipe_board_table(rb_no)
		on delete cascade
create sequence campingreview_seq;

insert into campingreview_table values(campingreview_seq.nextval,81,'kim','좋아요',5,sysdate);
insert into campingreview_table values(campingreview_seq.nextval,165,'kim','좋아요',5,sysdate);
insert into campingreview_table values(campingreview_seq.nextval,164,'kim','괜찮아요',4,sysdate);

select * from campingreview_table;

select * from camping_table order by cam_no desc

SELECT a.컬럼1, a.컬럼2, b.컬럼3
FROM 테이블명 a,
LEFT OUTER JOIN 테이블명 b
ON a. 컬럼1 = b.컬럼4
WHERE 조건절
ORDER BY 정렬;

select c_cam_no, avg(c_campingstar) as star
	from campingreview_table 
	group by c_cam_no
	
select a.*,avg(c_campingstar) as star 
from camping_table a,campingreview_table b
where a.cam_no=b.c_cam_no
group by a.cam_no
ORDER BY a.cam_no desc;

select *
from camping_table a,
(select c_cam_no, avg(c_campingstar) as star
	from campingreview_table 
	group by c_cam_no) b, 
where a.cam_no=b.c_cam_no
ORDER BY a.cam_no desc;
-------------------------------------------------------------------------------------------------------------------------------------
select * from campingheart_table where h_u_id='kim'

select rn,c.*
		from(select Rownum as rn,a.*,star
			from camping_table a,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no
			ORDER BY a.cam_no desc) c
		where RN >=1 and RN <=10 and c.cam_price>=30000 and c.cam_price<=100000;


select rn,c.*
	from(select *
		from camping_table a,
			(select c_cam_no, avg(c_campingstar) as star
			from campingreview_table 
			group by c_cam_no) b
		where a.cam_no=b.c_cam_no
		ORDER BY a.cam_no desc) c
	where RN >=1 and RN <=10;

	select rn,c.*
	from(select Rownum as rn,a.*,star
		from (select * from camping_table where cam_bo_id like '%난지%' ) a,
			(select c_cam_no, avg(c_campingstar) as star
			from (campingreview_table)
			group by c_cam_no) b
		where a.cam_no=b.c_cam_no
		ORDER BY a.cam_no desc) c
	where RN >=1 and RN <=10;

select rn,cam_no,cam_name,cam_txt,cam_phonenumber,cam_price, cam_address
	from (select Rownum as rn,cam_no,cam_name,cam_txt,cam_phonenumber,cam_price, cam_address
	from (select cam_no,cam_name,cam_txt,cam_phonenumber,cam_price, cam_address
	from camping_table
	where cam_bo_id like '%ㄴ%' 
	order by cam_no desc))
	where RN >=1 and RN <=10;
	
	select rn,c.*
		from(select Rownum as rn,a.*,star
			from camping_table a,campingheart_table d,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no(+) and a.cam_no=d.h_cam_no
			ORDER BY a.cam_no desc) c
		where RN >=1 and RN <=10;
		 h_cam_no
		
select rn,c.*
		from(select Rownum as rn,a.*,star
			from camping_table a, campingheart_table d,
				(select c_cam_no, avg(c_campingstar) as star
				from campingreview_table 
				group by c_cam_no) b
			where a.cam_no=b.c_cam_no and b.c_cam_no=d.h_cam_no
			ORDER BY a.cam_no desc) c
		where RN >=1 and RN <=10;

7. 캠핑 리뷰 댓글달기(사장이)
/*
 * 사장이 자신의 캠핑에서만 대댓글 달게 만들기
 */
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

insert into campingreview_bossreply_table values(campingreview_bossreply_seq.nextval,1,'kim2','kim','감사합니다','20220322');

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
alter table product_registration_table alter column p_txt clob not null;
ALTER TABLE product_registration_table MODIFY(p_txt clob not null);

create sequence product_registration_seq;

insert into product_registration_table values(product_registration_seq.nextval,'캠핑용품',10000,'b.jpg','캠핑용품입니다');

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

insert into foodproduct_registration_table values(foodproduct_registration_seq.nextval,'푸~짐한 UFO 부대찌개',25000,'부대찌개.JPG','고캠핑표 부대찌개는 신선한 채소와 깊은 맛을 내는 육수까지 극강의 비주얼을 자랑합니다.');
insert into foodproduct_registration_table values(foodproduct_registration_seq.nextval,'캠핑용품2',10000,'bb.jpg','캠핑용품입니다2');
insert into foodproduct_registration_table values(foodproduct_registration_seq.nextval,'캠핑용품3',10000,'bc.jpg','캠핑용품입니다3');
insert into foodproduct_registration_table values(foodproduct_registration_seq.nextval,'캠핑용품4',10000,'bd.jpg','캠핑용품입니다4');

select * from foodproduct_registration_table;
-------------------------------------------------------------------------------------------------------------------------------------
10. 캠핑용품 구매목록
/*
 * 하나만 선택되도록 radio box
 * 새로운 배송지가 null값이면 기존배송지 아니면 새로운 배송지가 뜨도록 만들기
*/

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
/*마이페이지 어떻게 되어있는지 보고 배송메모 포함할지 말지*/
create sequence g_p_buy_seq;

insert into guest_product_buy_table values(g_p_buy_seq.nextval,'kim',1,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');
insert into guest_product_buy_table values(g_p_buy_seq.nextval,'kim2',1,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');
insert into guest_product_buy_table values(g_p_buy_seq.nextval,'kim',109,'gd',10000,1,'서울특별시 종로구',null,'20220306');

select * from guest_product_buy_table;

select ROWNUM, A.*
from 
(select * from product_registration_table a,
(select count(b_p_no) as c,b_p_no
from guest_product_buy_table
group by b_p_no) b
where a.p_no=b.b_p_no
ORDER BY b.c desc) A
where ROWNUM <= 5;


-------------------------------------------------------------------------------------------------------------------------------------
11. 밀키트 구매목록
/*
 * 하나만 선택되도록 radio box
 * 새로운 배송지가 null값이면 기존배송지 아니면 새로운 배송지가 뜨도록 만들기
 * */
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

insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim',1,'떡볶이',10000,1,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim',273,'신라면',1000,5,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim2',34,'누룽지',7500,2,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim2',25,'마쉬멜로우',5000,3,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim',1,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim2',49,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');
insert into guest_foodproduct_buy_table values(g_fp_buy_seq.nextval,'kim',273,'캠핑용품',10000,1,'서울특별시 종로구',null,'20220306');

select * from guest_foodproduct_buy_table;

select ROWNUM, A.*
from 
(select * from foodproduct_registration_table a,
(select count(fb_fp_no) as c,fb_fp_no
from guest_foodproduct_buy_table
group by fb_fp_no) b
where a.fp_no=b.fb_fp_no
ORDER BY b.c desc) A
where ROWNUM <= 5;


-------------------------------------------------------------------------------------------------------------------------------------
12. 캠핑용품 장바구니

drop table guest_product_basket_table;
drop table guest_product_basket_table
create table guest_product_basket_table(

create table guest_product_basket_table(

	ba_no number(5) primary key, /*캠핑용품 장바구니 번호*/
	ba_p_no	number(5) not null,  /* 캠핑용품 등록 번호*/
	ba_u_bo_id varchar2(20 char) not null, /* 사용자와 사장 id*/
	ba_p_name varchar2(20 char) not null, /*캠핑용품 이름*/
	ba_p_picture varchar2(20 char) not null,
	ba_price number(10) not null, /*(수량*p_price)*/
	ba_number number(5) not null /* 갯수 */
);
create sequence product_basket_seq;

insert into guest_product_basket_table values (product_basket_seq.nextval,3,'kim','캠핑용품','b.jpg',10000,1);
insert into guest_product_basket_table values (product_basket_seq.nextval,2,'kim','램프','b.jpg',5000,3);
insert into guest_product_basket_table values (product_basket_seq.nextval,45,'kim','텐트','b.jpg',100000,1);
insert into guest_product_basket_table values (product_basket_seq.nextval,24,'kim','접의식의자','b.jpg',30000,4);
insert into guest_product_basket_table values (product_basket_seq.nextval,22,'kim','수저세트','b.jpg',5000,5);
insert into guest_product_basket_table values (product_basket_seq.nextval,3,'kim2','캠핑용품','b.jpg',10000,1);
insert into guest_product_basket_table values (product_basket_seq.nextval,2,'kim2','램프','b.jpg',5000,3);
insert into guest_product_basket_table values (product_basket_seq.nextval,45,'kim2','텐트','b.jpg',100000,1);
insert into guest_product_basket_table values (product_basket_seq.nextval,24,'kim2','접의식의자','b.jpg',30000,4);
insert into guest_product_basket_table values (product_basket_seq.nextval,22,'kim2','수저세트','b.jpg',5000,5);

select * from guest_product_basket_table;
-------------------------------------------------------------------------------------------------------------------------------------
13. 밀키트 장바구니
drop table guest_foodproduct_basket_table;

create table guest_foodproduct_basket_table(
	fba_no number(5) primary key, /*밀키트 장바구니 번호*/
	fba_fp_no number(5) not null, /*밀키트 등록 번호*/
	fba_u_bo_id varchar2(20 char) not null, /*사용자와 사장 id*/
	fba_fp_name varchar2(20 char) not null,/*밀키트 이름*/
	fba_fp_picture varchar2(20 char) not null,
	fba_price number(5) not null, /*(수량*p_price)*/
	fba_number number(5) not null /*갯수*/
);

create sequence foodproduct_basket_seq;

insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,1,'kim','밀키트','a.jpg',10000,1);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,3,'kim','밀키트','a.jpg',5000,3);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,45,'kim','밀키트','a.jpg',13000,3);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,35,'kim','밀키트','a.jpg',21000,6);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,2,'kim','밀키트','a.jpg',21000,2);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,67,'kim','밀키트','a.jpg',10000,5);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,1,'kim2','밀키트','a.jpg',10000,1);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,3,'kim2','밀키트','a.jpg',5000,3);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,45,'kim2','밀키트','a.jpg',13000,3);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,35,'kim2','밀키트','a.jpg',21000,6);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,2,'kim2','밀키트','a.jpg',21000,2);
insert into guest_foodproduct_basket_table values(product_basket_seq.nextval,67,'kim2','밀키트','a.jpg',10000,5);

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

drop table product_review_table;
create sequence product_review_seq;

insert into product_review_table values(product_review_seq.nextval,'kim','좋아요','20220301');
insert into product_review_table values(product_review_seq.nextval,'kim2','좋아요','20220301');
insert into product_review_table values(product_review_seq.nextval,182,'kim','좋아요',5,'20220301');

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

drop table foodproduct_review_table;
create sequence foodproduct_review_seq;

insert into foodproduct_review_table values(foodproduct_review_seq.nextval,'kim','좋아요','20220301');
insert into foodproduct_review_table values(foodproduct_review_seq.nextval,'kim2','좋아요','20220301');

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

insert into free_board_table values(free_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');
insert into free_board_table values(free_board_seq.nextval,'kim2','자유게시판','자유자유자유','h.jpg',0,'20220110');
insert into free_board_table values(free_board_seq.nextval,'kim','자유게시판','자유자유',0,'20220110');
insert into free_board_table values(free_board_seq.nextval,'kim','자유게시판','자유자유자유',0,'20220110');

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
insert into free_board_reply_table values(free_board_reply_seq.nextval,1,'kim2',null,null,'댓글입니다','20220210',3,'a.jpg');
insert into free_board_reply_table values(free_board_reply_seq.nextval,3,'kim',null,null,'댓글입니다','20220210',3,'a.jpg');

select * from free_board_reply_table;
select count(*) from free_board_reply_table where fr_owner_no=
select fr_no from free_board_reply_table where fr_u_id='(알수없음)';
select count(*) from free_board_reply_table where fr_owner_no=411;
select count(*) from free_board_reply_table where fr_u_id='(알수없음)' and fr_no=403;

-------------------------------------------------------------------------------------------------------------------------------------
18. 캠핑팁게시판
drop table campingtip_board_table
create table campingtip_board_table(	
	tip_no number(5) primary key,
	tip_u_id varchar2(20 char) not null,
	tip_subject varchar2(20 char)	not null,
	tip_txt varchar2(100 char) not null,
	tip_picture varchar2(200 char) null,
	tip_readcount number(5) not null,
	tip_date date not null
);

create sequence campingtip_board_seq;

insert into campingtip_board_table values(campingtip_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');
insert into campingtip_board_table values(campingtip_board_seq.nextval,'kim2','자유게시판','자유자유자유','h.jpg',0,'20220110');
insert into campingtip_board_table values(campingtip_board_seq.nextval,'kim','자유게시판','자유자유자유',0,'20220110');

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
insert into campingtip_board_reply_table values(campingtip_board_reply_seq.nextval,1,'kim2',null,null,'댓글입니다','20220210',3,'a.jpg');

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

insert into recipe_board_table values(recipe_board_seq.nextval,'kim','자유게시판','자유자유자유','h.jpg',0,'20220110');
insert into recipe_board_table values(recipe_board_seq.nextval,'kim2','자유게시판','자유자유자유','h.jpg',0,'20220110');

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

insert into recipe_board_reply_table values(recipe_board_reply_seq.nextval,1,'kim',null,null,'댓글입니다','20220210',3,'a.jpg');
insert into recipe_board_reply_table values(recipe_board_reply_seq.nextval,1,'kim2',null,null,'댓글입니다','20220210',3,'a.jpg');

select * from recipe_board_reply_table;


select * from guest_product_buy_table;

SELECT count(b_p_no), b_p_no FROM	guest_product_buy_table GROUP BY b_p_no;


select * from recipe_board_reply_table;
select * from recipe_board_reply_table;


select count(*)	from recipe_board_reply_table where rr_owner_no=81

select ROWNUM, A.*
from (select *
	  from free_board_table
	  ORDER BY f_readcount DESC) A
where ROWNUM <= 5;
select * from free_board_reply_table
select COUNT(A.*), A.*
from (select * from free_board_reply_table 
		where fr_f_no=341 and fr_owner_no is not null 
		order by fr_no asc) A;
		
		
		
select count(*)as cnt ,fr_owner_no from free_board_reply_table 
		where fr_f_no=341 and fr_owner_no is not null 
		group by fr_owner_no
		order by fr_no asc	
		
		
		
select * from campingreview_bossreply_table where cr_cam_no = 41 order by cr_no desc

select * from camping_table;
		
		
		
		
		
		
		
		
		
	
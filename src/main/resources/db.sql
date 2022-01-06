0. 관리자 디비
create table root_table(
	root_id varchar2(20 char) not null,
	root_pw varchar2(30 char) not null
);

insert into root_table values('root','1234');

select * from root_table;

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
	u_picture varchar2(200 char) not null
);

create sequence user_seq;

insert into user_table values(user_seq.nextval,'김태희','kim','k1234!','kim1234@naver.com','서울특별시 종로구','01012341234','19970101','a.jpg');

select * from USER_TABLE;

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
	bo_picture varchar2(200 char) not null
);

create sequence boss_seq;

insert into boss_table values(boss_seq.nextval,'김연아','kim2','k12345!','kim12345@naver.com','서울특별시 종로구','01012341235','19970101','a.jpg');

select * from boss_TABLE;

3. 캠핑 테이블
create table camping_table(
	cam_bo_no number(5) primary key,
	cam_no number(5) not null,
	cam_name varchar2(30 char) not null,
	cam_txt varchar2(200 char) not null,
	cam_phonenumber varchar2(30 char) not null,
	cam_price number(10) not null,
	cam_address address varchar2(100 char) not null,
	cam_headcount number(5) not null
)

create sequence camping_seq;

insert into camping_table values('1',camping_seq.nextval,'난지캠핑장')

4. 예약 테이블
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
)


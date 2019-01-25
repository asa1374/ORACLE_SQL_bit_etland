create table member(
id varchar2(10),
name varchar2(10),
pass varchar2(10),
ssn varchar2(20)
);
create table account(
account_num varchar2(9) primary key,
create_date date default sysdate,
money number default 0,
id varchar2(10) not null,
constraint account_fk_member foreign key(id)
    references member(id)
);
create table admin(
admin_num varchar2(10) primary key,
name varchar2(10) not null,
pass varchar2(10) not null,
auth varchar2(10) default '사원'
);
create sequence art_seq
start with 1000
increment by 1;

create table article(
art_seq number primary key,
title varchar2(20) default '제목없음',
content varchar2(50),
regdate date default sysdate,
id varchar2(10) not null,
constraint article_fk_member foreign key(id)
    references member(id)
);

select * from article;

drop table member;

alter table test
add test2 varchar2(10);

select * from member;

alter table test
drop column test2;

alter table member
add primary key(id);

insert into member(id,name,pass,ssn)
values('park','박명수','1','000808-3');
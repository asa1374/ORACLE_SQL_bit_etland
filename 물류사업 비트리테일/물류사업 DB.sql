drop table Oder_Details;
drop table products;
drop table categories;
drop table suppliers;
drop table orders;
drop table shippers;
drop table employees;
drop table customers;
drop table image;

drop sequence employee_id;
drop sequence order_id;
drop sequence category_id;
drop sequence product_id;
drop sequence order_detail_id;
drop sequence img_seq;
drop sequence supplier_id;

select * from tab;

CREATE TABLE Image(
img_seq number primary key,
imgName varchar2(20),
imgExtention varchar2(20),
owner varchar2(20)
);
CREATE SEQUENCE img_seq
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Customers(
customer_id VARCHAR2(15) PRIMARY KEY,
customer_name VARCHAR2(15) NOT NULL,
password VARCHAR2(15) NOT NULL,
phone varchar2(20) not null,
address VARCHAR2(75) NOT NULL,
city VARCHAR2(60) NOT NULL,
postal_code VARCHAR2(15) NOT NULL,
ssn VARCHAR2(15) NOT NULL,
photo varchar2(30) default '1000');

CREATE SEQUENCE employee_id
START WITH 2000
INCREMENT BY 1;

CREATE TABLE Employees(
employee_id VARCHAR2(15) PRIMARY KEY,
name VARCHAR2(15) NOT NULL,
manager VARCHAR2(15) NOT NULL,
birthdate VARCHAR2(15) NOT NULL,
photo VARCHAR2(15),
notes VARCHAR2(15)
);
CREATE TABLE Shippers(
shipper_id VARCHAR2(15) PRIMARY KEY,
shipper_name VARCHAR2(15) NOT NULL,
phone VARCHAR2(15)
);
CREATE SEQUENCE order_id
START WITH 1
INCREMENT BY 1;

CREATE TABLE Orders(
order_id NUMBER PRIMARY KEY,
customer_id VARCHAR2(15) NOT NULL,
CONSTRAINT orders_fk_customers FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id),
employee_id VARCHAR2(15) not null,
CONSTRAINT orders_fk_employees FOREIGN KEY(employee_id)
    REFERENCES Employees(employee_id),
oder_date DATE DEFAULT SYSDATE,
shipper_id VARCHAR2(15) NOT NULL,
CONSTRAINT orders_fk_shippers FOREIGN KEY(shipper_id)
    REFERENCES Shippers(shipper_id)
);

CREATE SEQUENCE supplier_id
START WITH 3000
INCREMENT BY 1;

CREATE TABLE Suppliers(
supplier_id NUMBER PRIMARY KEY,
supplier_name VARCHAR2(50) NOT NULL,
contact_name VARCHAR2(50) NOT NULL,
address VARCHAR2(50) NOT NULL,
city VARCHAR2(50) NOT NULL,
postal_code VARCHAR2(50) NOT NULL,
country VARCHAR2(50) NOT NULL,
phone VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE category_id
START WITH 4000
INCREMENT BY 1;

CREATE TABLE Categories(
category_id NUMBER PRIMARY KEY,
category_name VARCHAR2(15),
description VARCHAR2(15)
);

CREATE SEQUENCE product_id
START WITH 5000
INCREMENT BY 1;

CREATE TABLE Products(
product_id NUMBER PRIMARY KEY,
product_name VARCHAR2(30) NOT NULL,
supplier_id NUMBER NOT NULL,
CONSTRAINT products_fk_Suppliers FOREIGN KEY(supplier_id) REFERENCES Suppliers(supplier_id),
category_id NUMBER,
CONSTRAINT products_fk_Categories FOREIGN KEY(category_id) REFERENCES Categories(category_id),
unit VARCHAR2(30) NOT NULL,
price NUMBER DEFAULT 0
);
CREATE SEQUENCE order_detail_id
START WITH 6000
INCREMENT BY 1;

CREATE TABLE Oder_Details(
order_detail_id NUMBER PRIMARY KEY,
order_id NUMBER,
CONSTRAINT Oder_Details_fk_Orders FOREIGN KEY(order_id)
    REFERENCES Orders(order_id),
product_id NUMBER,
CONSTRAINT Oder_Details_fk_Products FOREIGN KEY(product_id)
    REFERENCES Products(product_id),
quantity NUMBER DEFAULT 0
);
------------ 카테고리 만드는곳 -------------
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'smartphone','핸드폰');
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'desktop','컴퓨터');
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'notebook','노트북');
------------ 서플라이 만드는곳 -------------
insert into Suppliers(SUPPLIER_ID,SUPPLIER_NAME,CONTACT_NAME,postal_code,ADDRESS,CITY,COUNTRY,PHONE)
values(SUPPLIER_ID.NEXTVAL,'samsung','이창준','12345','삼성로 129 ','경기도 수원시 영통구','대한민국','010-5899-1374');
------------ 프로덕트 만드는곳 -------------
insert into Products(PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,CATEGORY_ID,UNIT,PRICE)
values(PRODUCT_ID.NEXTVAL,'samsung','3000','4000','1',1000000);
------------이미지 디폴트 인설트한곳---------

insert into image(IMG_SEQ,IMGNAME,IMGEXTENTION,OWNER)
values(IMG_SEQ.NEXTVAL,'default_img','png','default');


--Customers 테이블 data------------------------------------------------------------------------------------
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('asa1374','이창준','1','경기도 파주시 파주읍','파주4리 497-16','10835','930605-1','010-5899-1374');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kim123','김민수','1','경기도 고양시 덕양구 화정동','장군빌딩 101호','10497','880607-1','010-1385-4883');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('yous1','유준열','1','경기도 고양시 덕양구 화정동','고양프라자 203호','10477','921108-1','010-5449-5574');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ums123','엄미소','1','경기도 파주시 문산읍','한양수자인APT 101동 303호','10819','950208-2','010-5868-1573');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('asd684','김다정','1','경기도 파주시 문산읍 통일로 96-10','장곡리 468-5','10941','980505-2','010-3843-1374');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('tgb115','박가람','1','부산광역시 해운대구 해운대로 820','좌동 1491','48110','770707-2','010-8734-4983');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ekfu282','최재원','1','서울특별시 금천구 시흥대로 165','남서울 힐스APT101동302호','08637','990805-1','010-5481-3358');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('wpov841','은지원','1','서울특별시 강남구 학동로68번길 29','힐스테이트 1단지 103동 404호','06090','050609-3','010-8284-1574');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('wowo1','왕순희','1','서울특별시 은평구 불광로2길 33','힐스테이트 1차 105동 303호','03366','670808-2','010-3848-1774');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('eo42','김대호','1','서울특별시 성동구 마조로1길 45','아파트 502호','04760','880105-1','010-3352-1732');

insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('woyf356','신태용','1','서울특별시 광진구 자양로 304','동우아파트 407호','04956','940306-1','010-0354-1085');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('bnh2','안중근','1','서울특별시 종로구 동숭4라길 29','동성아파트 203호','03085','970802-1','010-7775-2345');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('rug65','박소리','1','서울특별시 용산구 이촌로65길 8','한가람아파트 704호','04422','950406-2','010-8543-9465');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('fdiyh13','송영지','1','서울특별시 송파구 올림픽로45번길 26','칼라아파트 208동 1203호','05537','980312-2','010-8435-1384');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('tah123','김태혁','1','서울시 은평구 신사1동','증산로449 청운401호','03450','960314-1','010-4360-7560');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('dae','김다정','1','서울시 은평구 증산동',' 220-1 덕원@201호','03506','920914-2','010-5012-7557');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('utf1212','김정길','1','서울시 은평구 증산동','177-5','03500','901025-1','010-4500-7743');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kiuk901','김진표','1','서울시 은평구 증산동','169-3 청록아파트101호','03499','850110-1','010-7911-8509');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('usd0209','이혜원','1','서울시 마포구 합정동','월드컵로 29','04023','990920-2','010-4417-9811');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('foscal99','육현상','1','서울시 마포구 합정동','426-10 그린랜드 빌리지','04023','981009-1','010-4009-7474');

insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('iffy12','정하은','1','서울시 영등포구 당산동','4당산 삼성 래미안903호','07214','940309-2','010-1108-8494');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('yung312','이다영','1','서울시 마포구 연남동','동교로 38길 8','03982','970312-2','010-7742-4911');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kimyu134','김유진','1','서울시 마포구 합정동','412-27 k빌딩 803호','04047','961231-2','010-1488-8182');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('jee4311','이지영','1','서울시 마포구 상수동','335-10 상수 그린파크빌 102호','04074','890511-2','010-0119-8441');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('fujg13','이민호','1','경기도 파주시 금바위로 98','일산밀알교회','10895','750524-1','010-3847-8241');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('dsfg764','김설수','1','경기도 용인시 수지구 고기로525번길 31','고기동 476-16','16800','911115-1','010-8855-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ygd36','조태희','1','경기도 성남시 분당구 판교역로192번길 16','판교타워 305호','13524','910703-2','010-7755-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('jhjiyf2','황기석','1','경기도 성남시 분당구 판교로 255','이노밸리 508호','13486','921208-1','010-7676-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('hjy1','박소민','1','경기도 평택시 청북읍 판교길 15-2','한산리 220-1','17796','880105-2','010-1315-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('a46g','설민석','1','경기도 성남시 분당구 판교원로 7','LIG건영아파트 101동 303호','13464','980418-1','010-7943-1732');

-----------------------Employees---------------------------------
INSERT INTO EMPLOYEES(EMPLOYEE_ID,MANAGER,NAME,BIRTHDATE,PHOTO,NOTES)
VALUES(employee_id.NEXTVAL,'manager','김경민','880922-2','defaule_photo','매니저');
commit;
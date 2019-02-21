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
------------ ī�װ� ����°� -------------
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'smartphone','�ڵ���');
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'desktop','��ǻ��');
insert into Categories(CATEGORY_ID,CATEGORY_NAME,DESCRIPTION)
values(CATEGORY_ID.NEXTVAL,'notebook','��Ʈ��');
------------ ���ö��� ����°� -------------
insert into Suppliers(SUPPLIER_ID,SUPPLIER_NAME,CONTACT_NAME,postal_code,ADDRESS,CITY,COUNTRY,PHONE)
values(SUPPLIER_ID.NEXTVAL,'samsung','��â��','12345','�Ｚ�� 129 ','��⵵ ������ ���뱸','���ѹα�','010-5899-1374');
------------ ���δ�Ʈ ����°� -------------
insert into Products(PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,CATEGORY_ID,UNIT,PRICE)
values(PRODUCT_ID.NEXTVAL,'samsung','3000','4000','1',1000000);
------------�̹��� ����Ʈ �μ�Ʈ�Ѱ�---------

insert into image(IMG_SEQ,IMGNAME,IMGEXTENTION,OWNER)
values(IMG_SEQ.NEXTVAL,'default_img','png','default');


--Customers ���̺� data------------------------------------------------------------------------------------
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('asa1374','��â��','1','��⵵ ���ֽ� ������','����4�� 497-16','10835','930605-1','010-5899-1374');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kim123','��μ�','1','��⵵ ���� ���籸 ȭ����','�屺���� 101ȣ','10497','880607-1','010-1385-4883');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('yous1','���ؿ�','1','��⵵ ���� ���籸 ȭ����','��������� 203ȣ','10477','921108-1','010-5449-5574');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ums123','���̼�','1','��⵵ ���ֽ� ������','�Ѿ������APT 101�� 303ȣ','10819','950208-2','010-5868-1573');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('asd684','�����','1','��⵵ ���ֽ� ������ ���Ϸ� 96-10','�� 468-5','10941','980505-2','010-3843-1374');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('tgb115','�ڰ���','1','�λ걤���� �ؿ�뱸 �ؿ��� 820','�µ� 1491','48110','770707-2','010-8734-4983');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ekfu282','�����','1','����Ư���� ��õ�� ������ 165','������ ����APT101��302ȣ','08637','990805-1','010-5481-3358');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('wpov841','������','1','����Ư���� ������ �е���68���� 29','��������Ʈ 1���� 103�� 404ȣ','06090','050609-3','010-8284-1574');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('wowo1','�ռ���','1','����Ư���� ���� �ұ���2�� 33','��������Ʈ 1�� 105�� 303ȣ','03366','670808-2','010-3848-1774');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('eo42','���ȣ','1','����Ư���� ������ ������1�� 45','����Ʈ 502ȣ','04760','880105-1','010-3352-1732');

insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('woyf356','���¿�','1','����Ư���� ������ �ھ�� 304','�������Ʈ 407ȣ','04956','940306-1','010-0354-1085');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('bnh2','���߱�','1','����Ư���� ���α� ����4��� 29','��������Ʈ 203ȣ','03085','970802-1','010-7775-2345');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('rug65','�ڼҸ�','1','����Ư���� ��걸 ���̷�65�� 8','�Ѱ�������Ʈ 704ȣ','04422','950406-2','010-8543-9465');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('fdiyh13','�ۿ���','1','����Ư���� ���ı� �ø��ȷ�45���� 26','Į�����Ʈ 208�� 1203ȣ','05537','980312-2','010-8435-1384');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('tah123','������','1','����� ���� �Ż�1��','�����449 û��401ȣ','03450','960314-1','010-4360-7560');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('dae','�����','1','����� ���� ���굿',' 220-1 ����@201ȣ','03506','920914-2','010-5012-7557');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('utf1212','������','1','����� ���� ���굿','177-5','03500','901025-1','010-4500-7743');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kiuk901','����ǥ','1','����� ���� ���굿','169-3 û�Ͼ���Ʈ101ȣ','03499','850110-1','010-7911-8509');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('usd0209','������','1','����� ������ ������','�����ŷ� 29','04023','990920-2','010-4417-9811');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('foscal99','������','1','����� ������ ������','426-10 �׸����� ������','04023','981009-1','010-4009-7474');

insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('iffy12','������','1','����� �������� ��굿','4��� �Ｚ ���̾�903ȣ','07214','940309-2','010-1108-8494');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('yung312','�̴ٿ�','1','����� ������ ������','������ 38�� 8','03982','970312-2','010-7742-4911');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('kimyu134','������','1','����� ������ ������','412-27 k���� 803ȣ','04047','961231-2','010-1488-8182');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('jee4311','������','1','����� ������ �����','335-10 ��� �׸���ũ�� 102ȣ','04074','890511-2','010-0119-8441');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('fujg13','�̹�ȣ','1','��⵵ ���ֽ� �ݹ����� 98','�ϻ�о˱�ȸ','10895','750524-1','010-3847-8241');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('dsfg764','�輳��','1','��⵵ ���ν� ������ ����525���� 31','��⵿ 476-16','16800','911115-1','010-8855-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('ygd36','������','1','��⵵ ������ �д籸 �Ǳ�����192���� 16','�Ǳ�Ÿ�� 305ȣ','13524','910703-2','010-7755-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('jhjiyf2','Ȳ�⼮','1','��⵵ ������ �д籸 �Ǳ��� 255','�̳�븮 508ȣ','13486','921208-1','010-7676-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('hjy1','�ڼҹ�','1','��⵵ ���ý� û���� �Ǳ��� 15-2','�ѻ긮 220-1','17796','880105-2','010-1315-1732');
insert into customers(customer_id,customer_name,password,city,address,postal_code,ssn,phone)
values('a46g','���μ�','1','��⵵ ������ �д籸 �Ǳ����� 7','LIG�ǿ�����Ʈ 101�� 303ȣ','13464','980418-1','010-7943-1732');

-----------------------Employees---------------------------------
INSERT INTO EMPLOYEES(EMPLOYEE_ID,MANAGER,NAME,BIRTHDATE,PHOTO,NOTES)
VALUES(employee_id.NEXTVAL,'manager','����','880922-2','defaule_photo','�Ŵ���');
commit;
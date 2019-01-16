select * from tab;
CREATE TABLE Customers(
customer_id VARCHAR2(15) PRIMARY KEY,
customer_name VARCHAR2(15) NOT NULL,
contact_name VARCHAR2(15) UNIQUE,
address VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
postal_code VARCHAR2(15) NOT NULL,
country VARCHAR2(15) NOT NULL
);
CREATE TABLE Employees(
employee_id VARCHAR2(15) PRIMARY KEY,
last_name VARCHAR2(15) NOT NULL,
first_name VARCHAR2(15) NOT NULL,
birthdate VARCHAR2(15) UNIQUE,
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

CREATE TABLE Suppliers(
supplier_id VARCHAR2(15) PRIMARY KEY,
supplier_name VARCHAR2(15) NOT NULL,
contact_name VARCHAR2(15) NOT NULL,
address VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
postal_code VARCHAR2(15) NOT NULL,
country VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL
);

CREATE SEQUENCE category_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Categories(
category_id NUMBER PRIMARY KEY,
category_name VARCHAR2(15),
description VARCHAR2(15)
);
CREATE SEQUENCE product_id
START WITH 2000
INCREMENT BY 1;

CREATE TABLE Products(
product_id NUMBER PRIMARY KEY,
product_name VARCHAR2(15) NOT NULL,
supplier_id VARCHAR2(15) NOT NULL,
CONSTRAINT products_fk_Suppliers FOREIGN KEY(supplier_id)
    REFERENCES Suppliers(supplier_id),
category_id NUMBER,
CONSTRAINT products_fk_Categories FOREIGN KEY(category_id)
    references Categories(category_id),
unit VARCHAR2(15) NOT NULL,
price NUMBER DEFAULT 0
);
CREATE SEQUENCE order_detail_id
START WITH 3000
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

select * from customers;
select * from employees;
select * from shippers;
select * from orders;
select * from Oder_Details;
select * from suppliers;
select * from products;
select * from categories;

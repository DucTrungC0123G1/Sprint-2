create database dried_sea_food;
use dried_sea_food;

create table roles (
    id int primary key auto_increment,
    `name` varchar(50) not null unique
);

create table accounts (
    id int primary key auto_increment,
    username varchar(50) not null unique,
    `password` varchar(255),
    is_deleted bit(1) default 0
);

create table role_accounts (
	id int primary key auto_increment,
    account_id int,
    role_id int,
    foreign key (account_id) references accounts(id),
	foreign key (role_id) references roles(id)
);

create table type_employee(
	id int primary key,
    name varchar(50) not null
);

create table employees(
	id int primary key auto_increment,
    empolyee_code varchar(50) not null unique,
    avatar longtext,
    name varchar(50) not null,
    date_of_birth date not null,
    gender bit(1) not null,
    id_card varchar(50) not null unique,
    phone_number varchar(50) not null unique,
    address varchar(50),
    type_employee_id int,
    salary double not null,
    is_delete bit(1) default 0,
    account_id int,
    foreign key (type_employee_id) references type_employee(id),
    foreign key (account_id) references accounts(id)
);

create table type_customer(
	id int primary key,
    name varchar(50)
);

create table customers(
	id int primary key auto_increment,
    customer_code varchar(50) not null unique,
    name varchar(50) not null,
    date_of_birth date not null,
    gender bit(1) not null,
    id_card varchar(50) not null,
    phone_number varchar(50) not null,
    address varchar(50),
	customer_type_id int,
	is_delete bit(1) default 0,
    account_id int,
    foreign key (customer_type_id) references type_customer(id),
    foreign key (account_id) references accounts(id)
);

CREATE TABLE type_product (
	id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(150) NOT NULL UNIQUE
);

create table images(
id int primary key auto_increment,
name longtext not null
);
create table products(
	id int primary key auto_increment,
    product_code varchar(50) not null unique,
    name varchar(50) not null,
    `description` longtext not null,
    is_deleted bit(1) default 0,
	type_product_id int,
    image_id int,
    FOREIGN KEY (type_product_id) REFERENCES type_product(id),
    FOREIGN KEY (image_id) REFERENCES images(id)
);


create table sizes(
	id int primary key auto_increment,
    name varchar(50)
);

create table size_details(
	id int primary key auto_increment,
    size_id int,
    product_id int,
    price double not null,
    quantity int not null,
    foreign key (size_id) references sizes(id),
    foreign key (product_id) references products(id)
);

create table cart(
	id int primary key auto_increment,
    purchased_quantity int not null,
    size_detail_id int,
	customer_id int,
	foreign key (size_detail_id) references size_details(id),
	foreign key (customer_id) references customers(id)
);

create table orders(
	id int primary key auto_increment,
    order_code varchar(50) not null unique,
    purchased_date datetime not null,
    customer_id int,
    employee_id int,
    foreign key (customer_id) references customers(id),
    foreign key (employee_id) references employees(id)
);

create table order_details(
	id int primary key auto_increment,
    purchased_quantity int not null,
    order_id int,
    product_id int,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);
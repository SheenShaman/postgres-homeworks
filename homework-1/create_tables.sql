-- SQL-команды для создания таблиц

CREATE DATABASE north;

CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100),
	birth_date date,
	notes text
);

SELECT * FROM employees

CREATE TABLE customers
(
	customer_id varchar(10) UNIQUE NOT NULL,
	company_name varchar(100),
	contact_name varchar(100)
);

SELECT * FROM customers

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(10) REFERENCES customers(customer_id),
	employee_id int REFERENCES employees(employee_id),
	order_date date,
	ship_city varchar(100)
);

SELECT * FROM orders

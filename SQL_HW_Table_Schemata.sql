--0) Import each CSV file into the corresponding SQL table.
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(50))
;
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no VARCHAR(10),
	from_date VARCHAR(15),
	to_date VARCHAR(15))
;
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) not null,
	emp_no int,
	from_date VARCHAR(15),
	to_date VARCHAR(15))
;
CREATE TABLE employees (
	emp_no int not null,
	birth_date VARCHAR(15),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(30),
	hire_date VARCHAR(15))
; 
CREATE TABLE salaries (
	emp_no int not null,
	salary int,
	from_date VARCHAR(15),
	to_date VARCHAR(15))
; 
CREATE TABLE titles (
	emp_no int NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date VARCHAR(15),
	to_date VARCHAR(15))
;

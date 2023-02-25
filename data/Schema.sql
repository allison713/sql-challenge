--Drop tables
DROP TABLE departments;
DROP TABLE dept_employee;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--Create Tables for each CSV
CREATE TABLE departments (
 	dept_no CHAR(4) NOT NULL PRIMARY KEY,
  	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_employee (
	emp_no INT NOT NULL, 
 	dept_no CHAR(4) NOT NULL
);

CREATE TABLE dept_manager (
  	dept_no CHAR(4) NOT NULL,
  	emp_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE employees (
 	emp_no INT NOT NULL PRIMARY KEY,
	title_id CHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1),
	hire_date DATE
);

CREATE TABLE salaries (
 	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL
);

CREATE TABLE titles (
	title_id CHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR NOT NULL
);


--Import data into tables
COPY departments FROM  'E:\Downloads\sql-challenge\data\departments.csv' WITH delimiter ','  CSV HEADER;
COPY dept_employee FROM  'E:\Downloads\sql-challenge\data\dept_emp.csv' WITH delimiter ','  CSV HEADER;
COPY dept_manager FROM  'E:\Downloads\sql-challenge\data\dept_manager.csv' WITH delimiter ','  CSV HEADER;
COPY employees FROM  'E:\Downloads\sql-challenge\data\employees.csv' WITH delimiter ','  CSV HEADER;
COPY salaries FROM  'E:\Downloads\sql-challenge\data\salaries.csv' WITH delimiter ','  CSV HEADER;
COPY titles FROM  'E:\Downloads\sql-challenge\data\titles.csv' WITH delimiter ','  CSV HEADER;

--Adding Foreign Keys
ALTER TABLE dept_employee
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	ADD PRIMARY KEY (emp_no,dept_no);
	
ALTER TABLE dept_manager
	ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE salaries
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE employees
	ADD FOREIGN KEY (title_id) REFERENCES titles(title_id);
--Create Tables for each CSV
CREATE TABLE departments (
 	dept_no VARCHAR(4) NOT NULL,
  	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
 	 emp_no INT NOT NULL, 
 	 dept_no CHAR(4) NOT NULL
);

CREATE TABLE dept_manager (
  	dept_no CHAR(4) NOT NULL,
  	emp_no INT NOT NULL
);

CREATE TABLE employees (
 	emp_no INT NOT NULL,
	title_id CHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1),
	hire_date DATE
);

CREATE TABLE salaries (
 	emp_no INT NOT NULL,
	salary INT NOT NULL
);

CREATE TABLE titles (
	title_id CHAR(5) NOT NULL,
	title VARCHAR NOT NULL
);


--Import data into tables
COPY departments FROM  'E:\Downloads\sql-challenge\data\departments.csv' WITH delimiter ','  CSV HEADER;
COPY dept_emp FROM  'E:\Downloads\sql-challenge\data\dept_emp.csv' WITH delimiter ','  CSV HEADER;
COPY dept_manager FROM  'E:\Downloads\sql-challenge\data\dept_manager.csv' WITH delimiter ','  CSV HEADER;
COPY employees FROM  'E:\Downloads\sql-challenge\data\employees.csv' WITH delimiter ','  CSV HEADER;
COPY salaries FROM  'E:\Downloads\sql-challenge\data\salaries.csv' WITH delimiter ','  CSV HEADER;
COPY titles FROM  'E:\Downloads\sql-challenge\data\titles.csv' WITH delimiter ','  CSV HEADER;

--data type link :https://www.postgresql.org/docs/current/datatype.html
-- need to add not NULL; use drop table to change the table frame
--DROP TABLE departments
CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(dept_no)

);




SELECT * FROM departments;
--drop table titles




CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL


);

SELECT * FROM titles;



-- NOTE Alter the source data in excel : emp_no from general to number; hire_date from general to Date
-- nOTE WE need the same data type in order to import properly
-- DROP TABLE employees2
-- SHOW DATESTYLE;
-- SET datestyle=SQL,MDY;
--note try to create table employees2 not be able to import data with datestyle error; try with SET datestyle=SQL,MDY not working
---#### ideal table with data type#### below for assigment grading purpose--- employees to is workaround to import data in to SQL

-- CREATE TABLE employees2(
-- 	emp_no INT NOT NULL,
-- 	emp_title_id VARCHAR (5) NOT NULL ,
-- 	birth_date DATE NOT NULL,
-- 	first_name VARCHAR(20) NOT NULL,
-- 	last_name VARCHAR (20) NOT NULL,
-- 	sex VARCHAR(1) NOT NULL,
-- 	hire_date DATE NOT NULL,
-- 	PRIMARY KEY (emp_no),
-- 	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
-- );


CREATE TABLE employees(
	emp_no  VARCHAR(10) NOT NULL,
	emp_title_id VARCHAR (5) NOT NULL ,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

--drop table employees
SELECT * FROM employees;
--after import data alter the data type



ALTER TABLE employees
ALTER COLUMN emp_no TYPE INT
USING (emp_no::integer);


--try to alter data type to date not working
ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE
USING (birth_date::date);




CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR (5) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)


);

--drop table dept_emp
SELECT * FROM dept_emp



--set composite primary key (dept_no, emp_no) ensure there will be no duplicated rows with same (dept_no,emp_no) combo duplicated
--primary keys are unique

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no,emp_no)
	

);

SELECT * FROM dept_manager



CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(emp_no)


);

SELECT * FROM salaries



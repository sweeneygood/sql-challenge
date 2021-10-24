-- First Exported from QuickDBD: https://www.quickdatabasediagrams.com/, then modified 
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/jAk7P9


/***********************************
Drop Table If they exists
***********************************/

DROP TABLE IF EXISTS dept_emp CASCADE; 
DROP TABLE IF EXISTS dept_manager CASCADE; 
DROP TABLE IF EXISTS salaries CASCADE; 
DROP TABLE IF EXISTS departments CASCADE; 
DROP TABLE IF EXISTS titles CASCADE; 
DROP TABLE IF EXISTS employees CASCADE; 

/***********************************
Create Tables 
***********************************/

CREATE TABLE departments (
    dept_no VARCHAR(20)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE titles (
    title_id VARCHAR(20)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id VARCHAR(20)   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex VARCHAR(10)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR(20)  NOT NULL,
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20)  NOT NULL,
    emp_no int   NOT NULL,
	PRIMARY KEY (dept_no,emp_no)
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);


/*********************************************************
When importing tables, do it in the following order to 
   avoid constraint issues 

departments
titles
employees
salaries
dep_emp
dep_manager 

********************************************************/
/****************************************************
List the following details of each employee: 
employee number, last name, first name, sex, and salary.
****************************************************/
SELECT 	employees.emp_no, 
		employees.last_name, 
		employees.first_name, 	
		employees.sex, 	
		salaries.salary 
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salary DESC;

/****************************************************
List first name, last name, and hire date
for employees who were hired in 1986.
****************************************************/
SELECT 	first_name, 
		last_name, 
		hire_date 
FROM employees
WHERE hire_date >= '1996-01-01' AND hire_date <= '1996-12-31';

/****************************************************
List the manager of each department with the following 
information: department number, department name, 
the manager's employee number, last name, first name.
****************************************************/
SELECT 	departments.dept_no AS "Dept No",
		departments.dept_name AS "Dept Name", 
		dept_manager.emp_no AS "Manager Emp No", 
		employees.first_name AS "Manager First Name", 
		employees.last_name AS "Manager Last Name"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON dept_manager.emp_no = employees.emp_no;

/****************************************************
List the department of each employee with the 
following information: employee number, 
last name, first name, and department name.
****************************************************/
SELECT 	departments.dept_name AS "Department",
		dept_emp.emp_no AS "Employee Number",
		employees.first_name AS "Employee First Name", 
		employees.last_name AS "Employee Last Name"
FROM ((dept_emp
		INNER JOIN employees ON employees.emp_no = dept_emp.emp_no)
	  	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no)
ORDER BY "Department", "Employee Number";

/****************************************************
List first name, last name, and sex for employees 
whose first name is "Hercules" and last names begin with "B."
****************************************************/
SELECT 	employees.first_name AS "Employee First Name", 
		employees.last_name AS "Employee Last Name",
		employees.sex 
FROM 	employees
WHERE 	employees.first_name = 'Hercules' 
AND		employees.last_name LIKE 'B%';

/****************************************************
List all employees in the Sales department, 
including their employee number, last name, 
first name, and department name.
****************************************************/
SELECT 	departments.dept_name AS "Department",
		dept_emp.emp_no AS "Employee Number",
		employees.first_name AS "Employee First Name", 
		employees.last_name AS "Employee Last Name"
FROM ((dept_emp
		INNER JOIN employees ON employees.emp_no = dept_emp.emp_no)
	  	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no)
WHERE 	departments.dept_name = 'Sales';

/****************************************************
List all employees in the Sales and Development 
departments, including their employee number, 
last name, first name, and department name.
****************************************************/
SELECT 	departments.dept_name AS "Department",
		dept_emp.emp_no AS "Employee Number",
		employees.first_name AS "Employee First Name", 
		employees.last_name AS "Employee Last Name"
FROM ((dept_emp
		INNER JOIN employees ON employees.emp_no = dept_emp.emp_no)
	  	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no)
WHERE 	departments.dept_name = 'Sales'
		OR departments.dept_name = 'Development';

/****************************************************
In descending order, list the frequency count 
of employee last names, i.e., how many 
employees share each last name.
****************************************************/
SELECT 	last_name as "Last Name", 	
		count(last_name) AS "Last Name Count"
FROM 	employees
GROUP BY (last_name)
ORDER BY "Last Name Count" DESC;


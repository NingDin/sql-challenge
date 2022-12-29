--1.List the employee number, last name, first name, sex, and salary of each employee.
-- SELECT*FROM employees
-- SELECT*FROM salaries

SELECT employees.emp_no As employee_number, employees.last_name,
employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no=salaries.emp_no


--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name,hire_date
FROM employees
WHERE hire_date between '1986-1-1'and '1987-1-1';
-- WHERE (hire_date>='1986-1-1':: date) & (hire_date<'1987-1-1'::date)
--Note the date is not be able to import properly

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- SELECT* FROM departments
-- SELECT*FROM dept_manager


SELECT dpm.dept_no, dp.dept_name, dpm.emp_no, e.last_name, e.first_name
FROM dept_manager as dpm
JOIN departments as dp
ON dpm.dept_no=dp.dept_no
JOIN employees as e
ON dpm.emp_no=e.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--SELECT* FROM dept_emp;

SELECT dpe.dept_no, dpe.emp_no, e.last_name, e.first_name
FROM dept_emp as dpe
JOIN departments as dp
ON dpe.dept_no=dp.dept_no
JOIN employees as e
ON dpe.emp_no=e.emp_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.


SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';


--6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT dpe.emp_no, e.last_name,e.first_name
FROM dept_emp as dpe
JOIN employees as e
ON dpe.emp_no = e.emp_no
WHERE dept_no='d007';

select * from departments
--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dpe.emp_no, e.last_name,e.first_name, dp.dept_name
FROM dept_emp as dpe
JOIN departments as dp
ON dpe.dept_no = dp.dept_no
JOIN employees as e
ON dpe.emp_no = e.emp_no
WHERE (dpe.dept_no='d007') or (dpe.dept_no='d005') ;



-- SELECT  dp.dept_no, dpe.emp_no
-- FROM departments as dp
-- JOIN dept_emp as dpe
-- ON dp.dept_no = dpe.dept_no
-- WHERE emp_no='13616'; 
--here we find out it is many to many relationship




--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, count(emp_no) AS share_name_count
FROM employees
GROUP BY last_name
ORDER BY share_name_count DESC;
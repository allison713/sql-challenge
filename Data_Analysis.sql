--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT j.dept_no, j.dept_name, j.emp_no, e.last_name, e.first_name
FROM (
	SELECT dm.dept_no, dm.emp_no, d.dept_name
	FROM dept_manager as dm, departments as d
	WHERE dm.dept_no = d.dept_no) j
INNER JOIN employees as e ON j.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT j.dept_no, j.emp_no, e.last_name, e.first_name, j.dept_name
FROM (
	SELECT de.dept_no, de.emp_no, d.dept_name
	FROM dept_employee as de, departments as d
	WHERE de.dept_no = d.dept_no) j
INNER JOIN employees as e ON j.emp_no = e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT j.emp_no, e.last_name, e.first_name, j.dept_name
FROM (
	SELECT de.dept_no, de.emp_no, d.dept_name
	FROM dept_employee as de, departments as d
	WHERE de.dept_no = d.dept_no) j
INNER JOIN employees as e ON j.emp_no = e.emp_no
WHERE j.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT j.emp_no, e.last_name, e.first_name, j.dept_name
FROM (
	SELECT de.dept_no, de.emp_no, d.dept_name
	FROM dept_employee as de, departments as d
	WHERE de.dept_no = d.dept_no) j
INNER JOIN employees as e ON j.emp_no = e.emp_no
WHERE j.dept_name = 'Sales' OR j.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT Count(last_name) as "count", last_name
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;
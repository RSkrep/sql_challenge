	
-- 	List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
	FROM employees inner join salaries on employees.emp_no = salaries.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT  first_name, last_name,hire_date
	FROM employees 
	where hire_date between '1986-01-01' And '1986-12-31'
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT titles.title_id, employees.first_name, employees.last_name, employees, departments.dept_no, departments.dept_name, employees.emp_no
	FROM employees
	inner join dept_manager on employees.emp_no = dept_manager.emp_no
	inner join departments on dept_manager.dept_no = departments.dept_no
	inner join titles on employees.emp_title_id = titles.title_id
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT departments.dept_no, employees.first_name, employees.last_name, departments.dept_name, employees.emp_no
	FROM employees
	full join dept_emp on employees.emp_no = dept_emp.emp_no
	full join departments on dept_emp.dept_no = departments.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
	from employees
	Where first_name = 'Hercules' and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.first_name, employees.last_name, employees.emp_no
	FROM employees
	full join dept_emp on employees.emp_no = dept_emp.emp_no
	full join departments on dept_emp.dept_no = departments.dept_no
	Where departments.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, departments.dept_name, employees.emp_no
	FROM employees
	full join dept_emp on employees.emp_no = dept_emp.emp_no
	full join departments on dept_emp.dept_no = departments.dept_no
	Where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;

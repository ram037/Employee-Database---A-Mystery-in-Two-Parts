
--1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no 
;
--2) List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
From employees
Where hire_date LIKE '1986%' 
;
--3) List the manager of each department with the following information: department number, department 
--   name, the manager's employee number, last name, first name, and start and end employment dates.
CREATE VIEW Managers_Info AS
SELECT dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no

CREATE VIEW Manager_Dept_Info AS
SELECT Managers_Info.dept_no, departments.dept_name, Managers_Info.emp_no, Managers_Info.last_name, 
	Managers_Info.first_name, Managers_Info.hire_date
FROM Managers_Info
INNER JOIN departments ON Managers_Info.dept_no=departments.dept_no

CREATE VIEW Complete_Manager AS
SELECT Manager_Dept_Info.dept_no, Manager_Dept_Info.dept_name, Manager_Dept_Info.emp_no, 
	Manager_Dept_Info.last_name, Manager_Dept_Info.first_name, Manager_Dept_Info.hire_date, 
	dept_emp.from_date, dept_emp.to_date
FROM Manager_Dept_Info
INNER JOIN dept_emp ON Manager_Dept_Info.emp_no=dept_emp.emp_no

SELECT * FROM Complete_Manager
;
--4) List the department of each employee with the following information: employee number, last name, 
--   first name, and department name.
CREATE VIEW Employee_DepartmentNo AS
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no

SELECT emp_no, last_name, first_name, departments.dept_name
FROM Employee_DepartmentNo
INNER JOIN departments ON Employee_DepartmentNo.dept_no=departments.dept_no
;
--5) List all employees whose first name is "Hercules" and last names begin with "B."
Select * 
From employees
Where first_name='Hercules' AND last_name LIKE 'B%'
;
--6) List all employees in the Sales department, including their employee number, last name, first name,
--   and department name.
-- Notes: Sales d007 and Development d005
CREATE VIEW Sales_Employees AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_emp.dept_no='d007'

SELECT Sales_Employees.emp_no, Sales_Employees.last_name, Sales_Employees.first_name, departments.dept_name
From Sales_Employees
INNER JOIN departments ON Sales_Employees.dept_no=departments.dept_no
;

--7) List all employees in the Sales and Development departments, including their employee number, 
--   last name, first name, and department name.
CREATE VIEW SalesDev_Employees AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
WHERE dept_emp.dept_no='d007' OR dept_emp.dept_no='d005' 

SELECT SalesDev_Employees.emp_no, SalesDev_Employees.last_name, SalesDev_Employees.first_name, departments.dept_name
From SalesDev_Employees
INNER JOIN departments ON SalesDev_Employees.dept_no=departments.dept_no
;

--8) In descending order, list the frequency count of employee last names, i.e., how many employees 
--   share each last name.
SELECT COUNT(emp_no), last_name
FROM employees
GROUP BY last_name
ORDER BY count desc;

-- ** Search your ID number 499942
SELECT *
FROM employees
WHERE emp_no=499942;
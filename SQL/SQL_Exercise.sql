

2. Create a report that displays the employee number, last name, and salary of 
all employees who earn more than the average salary. Sort the results in order of ascending salary.

select employee_id,last_name,salary from employees  
where salary > (select AVG(salary) from employees)
order by salary asc

3. Write a query that displays the employee number and last name of all 
employees who work in a department with any employee whose last name contains the letter “u”

select e.employee_id,e.last_name from employees e
join  departments d on e.department_id = d.department_id
where e.last_name like '%u%'

4. The HR department needs a report that displays the last name, department number, and job ID of all 
employees whose department location ID is 1700.

select e.last_name, e.department_id, e.job_id from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where city = 'Seattle'

5. Create a report for HR that displays the last name and salary of every employee who reports to King

select last_name, salary from employees
where manager_id = 100

select e.employee_id,e.last_name, d.department_name from employees e
left join  departments d on e.department_id = d.department_id

6. 

//union va union all

select d.department_id, e.last_name, e.job_id
from employees e join departments d on e.department_id = d.department_id 
where d.department_id = 90

7. 

select employee_id, last_name, salary
from employees
where salary > (select AVG(salary) from employees)
UNION
select e.employee_id, e.last_name, e.salary
from employees e
join departments d on e.department_id = d.department_id
where e.last_name like '%u%'

8.

select round(MAX(salary),0) 'Maximum',
round(MIN(salary),0) 'Minimum',
round(SUM(salary),0) 'Sum',
round(AVG(salary),0) 'Average'
from employees;

9.

select UPPER(last_name) as LastName, LEN(last_name) as LengthName
from employees
where last_name like 'j%' or last_name like 'a%' or last_name like 'm%'
order by last_name desc

10.

select employee_id, last_name, salary, convert (int, round(salary + (salary*15.5)/100 ,0)) as New_Salary
from employees

11.

select last_name, department_id, cast(NULL as varchar(15))
from employees
union
select cast(NULL as varchar(15)), department_id, department_name
from departments

12.

select e.last_name, e.department_id, e.job_id
from employees e
inner join employees e1 on e.employee_id = e1.manager_id
where e.hire_date > e1.hire_date
UNION
select e.last_name, e.department_id, e.job_id from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where city = 'Toronto'
  
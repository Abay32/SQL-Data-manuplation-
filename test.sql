use employees;
SELECT 
    first_name, last_name
FROM
    employees;
    

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
	(first_name ='Kellie' Or first_name= 'Aruna') AND gender='F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

select * from departments where dept_no is null; -- between 66000 and 70000;

select count(*) from salaries where salary>=100000;

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name desc;
--  BY first_name DESC;


SELECT 
    emp_no, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary; 

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
order by emp_no;


SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary < 120000
GROUP BY emp_no
ORDER BY emp_no;


SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) > 200
order by first_name;

SELECT 
    emp_no, COUNT(dept_no)
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(dept_no) > 1
ORDER BY emp_no
LIMIT 10;

select * from dept_emp limit 100;

select count(distinct dept_no) from dept_emp;

select sum(salary) from salaries where from_date > '1997-01-01';

select round(avg(salary), 2) from salaries where from_date > '1997-01-01';


drop table if exists departments_dup;
CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

insert into departments_dup (dept_no, dept_name) select * from departments;

insert into departments_dup (dept_name) values ('Public relation');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
    
insert into departments_dup(dept_no) values('d010'),('d011');

drop table if exists dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(100) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

insert into dept_manager_dup select * from dept_manager;

insert into dept_manager_dup(emp_no, from_date) values (999904, '2017-01-01'),(999905,'2017-01-01'),(999906,'2017-01-01'),(999907,'2017-01-01');

delete from dept_manager where dept_no='d001';

SELECT 
    *
FROM
    dept_manager_dup;
    
 
-- Inner join 
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup AS m
        INNER JOIN
    departments_dup AS d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.dept_no,
    e.hire_date,
    e.first_name,
    e.last_name,
    e.emp_no
FROM
    dept_manager m
        INNER JOIN
    employees e ON e.emp_no=m.emp_no;

SELECT 
    d.dept_name, AVG(salery) AS av_salaey
FROM
    departments d
        JOIN
    dept_manager m
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salary > 60000
ORDER BY avg_salary DESC;

-- how many m and f mamnagers do we have in the data base
SELECT 
    e.gender, COUNT(m.emp_no)
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender;

-- Union all - the same column name, and field 
-- e.g. 

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    e.gender,
    e.hire_date,
    NULL AS from_date,
    NULL AS to_date,
    NULL AS dept_no
FROM
    employees e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    NULL AS birth_date,
    NULL AS gender,
    NULL AS hire_date,
    d.from_date,
    d.to_date,
    d.dept_no
FROM
    dept_manager d;

-- Subquery 

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
SELECT 
    e.first_name, e.last_name, e.emp_no
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;

-- Exercise 

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer');
                
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(d.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(d.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;

-- Create the ‘emp_manager’ table, using the following code:
drop table if exists emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);




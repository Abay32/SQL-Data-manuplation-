use employees;
# Select all fiels from the employee table 
SELECT 
    *
FROM
    employees;

# Task 1: list the first and last name of employees 
SELECT 
 first_name, last_name
FROM
 employees;
 
# Task 2: list the department number from departments table
SELECT 
 dept_no
FROM
 departments;
 
# Task 3: list all employees whose first name is 'Denis'
SELECT 
 *
FROM
 employees
WHERE
 first_name = 'Denis';

# Task 4: list all employees whose first name is 'Denis' or 'Elvis'
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';


# Task 5: list all male employes whose first name is Denis
SELECT 
 *
FROM
 employees
WHERE
 (first_name = 'Denis')
 AND (gender = 'M');
 
/*	Oprator precedence:
		sql excutes AND oprator first and the OR, so we have to be carful 
        when we use AND & OR orators at the same time 
	Task 6: list all employees from employees table where last name is Denis and gender is either female or male 
*/        
# Task 6 wrong soution: it includes all females and Denis. This can be corrected by using parantesis
SELECT 
 *
FROM
 employees
WHERE
 last_name = 'Denis' AND 'gender' = 'M'
 OR gender = 'F';
 

# Task 6 correct query
SELECT 
 *
FROM
 employees
WHERE
 last_name = 'Denis'
 AND (gender = 'M' OR gender = 'F');
 
 
# Task 7: Extract all fimale employees whose name is either Kellie or Aruna
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

/*	In or not in function: 
		These functions are used to identify a given enrtity is in the list or not in the list
        
        Used as a short cut for OR prator
*/
# Task 8: Extraxt all employes whise name is in the list ['Cathie', 'Mark', 'Nathan']
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

# Task 9- "NOT IN" oprator exaple: It returns all employs who are not in the list ['Cathie', 'Mark', 'Nathan']
SELECT 
 *
FROM
 employees
WHERE
 first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

/*	The LIKE command is used in a WHERE clause to search for a specified pattern in a column.

	We can use two wildcards with LIKE:

    % - Represents zero, one, or multiple characters
    _ - Represents a single character (MS Access uses a question mark (?) instead)
*/

# Task 10: list all employees whose first name starts with 'Mar'
SELECT 
 *
FROM
 employees
WHERE
 first_name LIKE ('Mar%');
 
# Task 11: list all employees whose first name ends with 'Mar'
SELECT 
 *
FROM
 employees
WHERE
 first_name LIKE ('%ar');

# Task 11: list all employees whose first name contains 'ar'
SELECT 
 *
FROM
 employees
WHERE
 first_name LIKE ('%ar%');
 
# Task 12: Retrieve a list with all employees who have been hired in the year 2000
SELECT 
 *
FROM
 employees
WHERE
 hire_date LIKE ('2000%');

# Task 13: Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT 
 *
FROM
 employees
WHERE
 LENGTH(emp_no) = 5
 AND emp_no LIKE ('1000%');

# A single character inclusion after emp_no = 1000
SELECT 
 *
FROM
 employees
WHERE
 LENGTH(emp_no) = 5
 AND emp_no LIKE ('1000_');

# Task 14: list all employess whose first name ends with 'Jack'
SELECT 
 *
FROM
 employees
WHERE
 first_name LIKE ('%Jack');
 
/*	The BETWEEN operator selects values within a given range. 
	The values can be numbers, text, or dates.
    
    The BETWEEN operator is inclusive: begin and end values are included. 
*/
#Task 15: list employes who were hired between 1st of January 1999 nd 1st January, 2020
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01' AND '2020-01-01';

# Task 16: Select salaries between 66000 and 70000 in saleries table 
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

# Task 17: list all salries for employees number below 10004 and above 10012    
SELECT 
 *
FROM
 salaries
WHERE
 emp_no NOT BETWEEN 10004 AND 10012;
 
/*	The IS NULL or IS NOT NULL conditions are used in SQL to test for a NULL or non-NULL value. 
	Eg:-  IS NOT NULL conditions returns TRUE if a non-NULL value is found, otherwise it returns FALSE. The smae works for the IS NULL conditions
    They can be used in a SELECT, INSERT, UPDATE, or DELETE statement.
*/

# Task 18: list all 'not null' values in first name column of employee table
SELECT 
 *
FROM
 employees
WHERE
 first_name IS NOT NULL;

/*	A comparison (or relational) operator is a mathematical symbol which is used to compare two values.
	Comparison operators are used in conditions that compares one expression with another. 
    The result of a comparison can be TRUE, FALSE, or UNKNOWN (an operator that has one or two NULL expressions returns UNKNOWN).

	The following table describes different types of comparison operators
		- <, > less than, greater than: oprates on any compatible data types
        - <=, >= less than or equal, greater than or equal: oprates on any compatible data types
        - = equal: oprates on any compatible data types
        - <>, != not equal: oprates on any compatible data types
*/ 
# Task 19: list all employees who were hired after 1st january 2000. 
SELECT 
 *
FROM
 employees
WHERE
 hire_date > '2000-01-01';

# Task 20: list all female employees who were hired after 1st january 2000. 
SELECT  
 *
FROM
 employees
WHERE
 gender = 'F'
 AND hire_date >= '2000-01-01';

/*	The SELECT DISTINCT statement is used to return only distinct (different) values.

	Inside a table, a column often contains many duplicate values; 
    and sometimes you only want to list the different (distinct) values.
*/
#Task 21: list distinct hire dates from employees 
SELECT DISTINCT
 hire_date
FROM
 employees;

/*	Aggregate functions in SQL
		- COUNT counts how many rows are in a particular column.
		- SUM adds together all the values in a particular column.
		- MIN and MAX return the lowest and highest values in a particular column, respectively.
		- AVG calculates the average of a group of selected values.
*/ 

#Task 22: Count the number of employees in the employees table 
SELECT 
 COUNT(emp_no)
FROM
 employees;
 
#Task 23: Find the number of distinct first names in employees table 
SELECT 
 COUNT(DISTINCT first_name)
FROM
 employees;

# Task 24: Find the number of employees whose contract salary is higher or equall to 100000 per anumm. 
SELECT 
 COUNT(emp_no)
FROM
 salaries
WHERE
 salary >= 100000;
 
# Task 25: Count the number of employees with at manager position
SELECT 
 COUNT(*)
FROM
 titles
WHERE
 title = 'Manager';

/*
	The GROUP BY statement groups rows that have the same values into summary rows, 
    like "find the number of customers in each country".

	The GROUP BY statement is often used with aggregate functions 
    (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
*/
#Task 26: Find the number of employees wich are grouoed by their first name 
SELECT 
 COUNT(first_name)
FROM
 employees
GROUP BY first_name;


/*	The ORDER BY keyword is used to sort the result-set in ascending or descending order.

	The ORDER BY keyword sorts the records in ascending order by default. 
    To sort the records in descending order, use the DESC keyword.
*/
# Task 27: Sort the employees table in descending order according to the emplyees hiring date
SELECT 
 *
FROM
 employees
ORDER BY hire_date DESC;

#Task 28: Extract the first name and their number of occurence in the employee table
SELECT 
 first_name, COUNT(first_name)
FROM
 employees
GROUP BY first_name;

#Task 28: Extract the first name and their number of occurence in the employee table and sort the result in descending order according to the first name
SELECT 
 first_name, COUNT(first_name)
FROM
 employees
GROUP BY first_name
ORDER BY first_name DESC;

/*	Aliases:
		SQL aliases are used to give a table, or a column in a table, a temporary name. 
		Aliases are often used to make column names more readable. 
		An alias only exists for the duration of that query. An alias is created with the AS keyword.
    
    Task 29: Write a query that obtains an output whose first column must contain annual salaries higher than 80,000 dollars. 
			The second column, renamed to “emps_with_same_salary”, must show the number of employee contracts signed with this salary.
*/
#Task 29 solution
SELECT 
 salary, COUNT(emp_no) AS epms_with_same_salery
FROM
 salaries
WHERE
 salary > 80000
GROUP BY salary;

/*	The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of conditions.	
    The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
*/
# Task 31: Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
 emp_no, AVG(salary) AS avg_salary
FROM
 salaries
GROUP BY emp_no
HAVING avg_salary > 120000;

# Task 32: list the names whose count id is higher than 250 and sort the result according to their first name 
SELECT 
 first_name, COUNT(first_name) AS cnt_name
FROM
 employees
GROUP BY first_name
HAVING cnt_name > 250
ORDER BY first_name DESC;

# Task 33: list the names whose count id is higher than 250 and sort the result according to their first name in descenging order and number of counts in ascending order
SELECT 
    first_name, COUNT(first_name) AS cnt_name
FROM
    employees
GROUP BY first_name
HAVING cnt_name > 250
ORDER BY first_name DESC , cnt_name ASC;

# Task 34: Extract a list of all names that are encountered less than 200 times. let the data refer to people hired after the 1st of January 1999.
SELECT 
 first_name, COUNT(first_name) AS cnt_fname
FROM
 employees
WHERE
 hire_date > '1999-01-01'
GROUP BY first_name
HAVING cnt_fname < 200
ORDER BY first_name ASC;

# Task 35: Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
 emp_no, COUNT(emp_no) AS cnt_emp
FROM
 salaries
WHERE
 from_date > '2000-01-01'
GROUP BY emp_no
HAVING cnt_emp > 1;
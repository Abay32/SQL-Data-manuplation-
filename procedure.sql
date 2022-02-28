use employees;
drop procedure if exists select_employees;
delimiter $$ 
create procedure select_employees()
begin select * from employees limit 1000; end $$ delimiter ;

call employees.select_employees();

drop procedure if exists average_salery;
delimiter $$
create procedure average_salery()
begin select avg(salary) from salaries; end $$ delimiter ;


call average_salery();

drop procedure if exists emp_salary;

delimiter $$
use employees $$ 
create procedure emp_salary(in p_emp_no integer) 
begin select e.first_name, e.last_name, s.salary, s.from_date, s.to_date from employees e join salaries s on s.emp_no=e.emp_no where e.emp_no = p_emp_no; end $$ delimiter ;

call emp_salary(10001);


delimiter $$
use employees $$ 
create procedure emp_salary_avg_out(in p_emp_no integer, out p_avg_salary decimal(10,2)) 
begin select avg(s.salary) into p_avg_salary from employees e join salaries s on s.emp_no=e.emp_no where e.emp_no = p_emp_no; end$$ delimiter ;

call emp_salary_avg_out(11300)

delimiter $$
use employees $$

create procedure emp_info(in fn character, in ln character, out emno integer)
begin select e.emp_no into emno from employees where first_name=fn and last_name=ln; end$$ delimiter ;




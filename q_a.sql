
-- 16/6/260
use school;
select * from cars;

-- 1q =find the ave selling price of cars each brand 
select brand, avg(selling_price) as avg_sell from cars group by brand;

-- 2q = calculate the total selling 
select fuel, sum(selling_price) from cars group by fuel;

-- 3q = find the number of cars available from each owner category
select owner,count(*) as no_of_car from cars group by owner;

-- 4q = write a query to get the min kilometers driven fro cars in each fuel
select fuel, min(km_driven) from cars group by fuel; 

-- 5q = determine the highest selling price from each breand
select brand, max(selling_price) from cars group by brand order by brand desc limit 1; 

-- 6q= list brands whose average selling price is greater then 500000
select brand , avg(selling_price) as avg_sell from cars group by brand having avg_sell>500000;  

-- 7q try to find out fuel types that have more than 50 cars listed
select fuel, count(*) as no_of_cars  from cars group by fuel having no_of_cars >50;

-- 8q identify owner types where totle selling price of cars exceeds 1000000
select owner , sum(selling_price) as total from cars group by owner having total>1000000; 

-- 9q calculate avg kilometers driven fro ech brand
 select brand, avg(km_driven) from cars group by brand;

-- 10q find out brands that have more than one car listed in the dataset
select brand,count(*) as no_of_car from cars group by brand having  no_of_car>1;


-- add more 2 table form  flip_user and flip_order than the sol the quetion
select * from flip_user; -- user_id n name , state, city
select * from flip_order; -- order_id , user_id order_date
-- 11q filde out the orderid,name ,city

select order_id,name,city from flip_order t1  join flip_user t2 on t1.user_id=t2.user_id;
-- select order_id from flip_order inner join flip_user a.name as user_name, b.city as city  

-- department 
-- dept_id pk ,dept_name,dept_location  
-- employe
-- emp_id pk, emp_name , emp_salary ,dep_id  

-- 17/06/2026 
create table department(
	dept_id int primary key,
    dept_name varchar(100),
    location varchar(100)
    );

create table employees(
	emp_id int primary key,
    emp_name varchar(100),
    salary decimal (10,2),
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);
use school;

insert into department value
(1 , 'it' , 'mumbai'),
(2 , 'hr' , 'delhi'),
(3 , 'finance' , 'bangalore'),
(4 , 'marketing' , 'chennai'),
(5, 'operations' , 'pune');


insert into employees value
(101 , 'amit', 75000,1),
(102 , 'priya', 55000,2),
(103 , 'rahul', 65000,1),
(104 , 'sneha', 45000,3),
(105 , 'ananya', 70000,null);
select * from employees;
select * from department;

-- 1q = retrieve employee names along with their  department names
select emp_name , dept_name from employees t1 join department t2 on t1.dept_id= t2.dept_id; 

-- 2q display all employees including thoes without a department .  
select emp_name , dept_name from employees t1 left join department t2 on t1.dept_id= t2.dept_id; 

-- 3q find employees not assigned to any department 
select emp_name , dept_name from employees t1 left join department t2 on t1.dept_id=t2.dept_id where t2.dept_id is null;
select * from employees where dept_id is null;

-- 4q find department with no employees
select dept_name,emp_name from employees t1 right join department t2 on t1.dept_id=t2.dept_id where emp_name is null;

-- 5q diplay name whit department locations
select emp_name, location from employees t1 inner join department t2 on t1.dept_id = t2.dept_id;  

-- 6q count number of employees in each department
select dept_name, count(emp_id) as totle_emp from department t1 left join employees t2 on t1.dept_id = t2.dept_id group by dept_name; 
select dept_name, count(emp_id) as totle_emp from employees t1 left join department t2 on t1.dept_id = t2.dept_id group by t2.dept_name,t2.dept_id;

-- 7q list empoyees working in it department 
select emp_id, emp_name,salary from employees t1 inner join department t2 on t1.dept_id = t2.dept_id where dept_name = 'it';
select * from employees t1 inner join department t2 on t1.dept_id = t2.dept_id where dept_name = 'it'; 
select dept_name, count(emp_id) as totle_emp from employees t1 right join department t2 on t1.dept_id = t2.dept_id group by t2.dept_name,t2.dept_id; 

-- 11q diplay all combinations of employees and departments
select emp_name , dept_name from employees t1 cross join department;
select * from employees cross join department;

-- 12q find out the retrieve employees whit salary greater than 60000 alog with department names  
select emp_id, emp_name,salary , dept_name from employees t1 inner join department t2 on t1.dept_id= t2.dept_id where salary>60000;
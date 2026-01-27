-- #1.	Create a database named dbemp and switch to it.
-- show databases;
-- create database dbemp;
-- use dbemp;
-- #2.	Create an employee table with appropriate data types 
-- #and constraints for employee details.
-- create table employee(
-- 		EmployeeID varchar(20) NOT NULL PRIMARY KEY,
--         FirstName varchar(20),
--         LastName varchar(20),
--         Gender char(1),
--         DateofBirth DATE,
--         Designation varchar(50),
--         DepartmentName varchar(20),
--         ManagerId varchar(20),
--         JoinedDate DATE,
--         Salary decimal(10,0)
-- );
-- #3.	Insert at least two employee records into the employee table.
-- insert into employee (
-- EmployeeID,FirstName,LastName,Gender,DateofBirth,Designation,
-- DepartmentName,ManagerId,JoinedDate,Salary)
-- values (
-- '0009','Season','Maharjan','M','1996-04-02','Engineer',
-- 'Software Engineering', '0005','2022-04-02','5000000'
-- ),(
-- '0010','Ramesh','Rai','M','2000-04-02','Manager',
-- 'Software Engineering', '0003','2022-04-02','1000000'
-- );
select * from employee;
#4.Update the gender of an employee whose EmployeeID is 0010.
use dbemp;
UPDATE employee
SET Gender='F'
WHERE EmployeeID = '0010';
#5.Display the first name, current date, date of birth, and age of employees who are older then 25 years.
SELECT FirstName,current_date() as CurrentDate,DateofBirth,
timestampdiff(Year, DateofBirth,CURDATE()) as Age 
FROM Employee where 
timestampdiff(Year,DateofBirth,CURDATE()) >25;
#6. Write a query to find the oldest employee.
SELECT FirstName,current_date() as CurrentDate,DateofBirth,
timestampdiff(Year, DateofBirth,CURDATE()) as Age 
FROM employee
ORDER BY DateofBirth ASC
LIMIT 1;
#7 youngest employee
SELECT FirstName,current_date() as CurrentDate,DateofBirth,
timestampdiff(Year, DateofBirth,CURDATE()) as Age 
FROM employee
ORDER BY DateofBirth DESC
LIMIT 1;
#8. Display the maximum salary department-wise.
SELECT DepartmentName, MAX(Salary) AS max_salary
FROM employee
Group By DepartmentName;
#9. List the employees who act as managers.
select * from employee
where EmployeeID in (select ManagerId from employee);
#10. Display the details of the most recently joined employee.
select * from employee where 
JoinedDate = (select Max(JoinedDate) from employee);





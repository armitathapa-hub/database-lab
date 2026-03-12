#PART A
#Create a database named TechSolutionsDB and switch to it
#Create the following tables with appropriate data types and constraints

Create Database TechSolutionDB;
Use TechSolutionDB;

Create Table Department(
DeptID INT Primary Key,
DeptName VARCHAR (255) NOT NULL,
Location VARCHAR (255)
);

Drop Table if exists Project;
Create Table Project(
ProjectID Int Primary Key,
ProjectName VARCHAR (255),
EndDate DATE,
Budget Decimal(19,0),
StartDate DATE
);
Drop Table if exists WORKS_ON;
Drop Table if exists Employee;
Create Table Employee(
EmpID INT Primary Key,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Gender CHAR(1),
Salary Decimal(19,0),
HireDate DATE,
DeptID INT,
FOREIGN KEY (DeptID) References Department (DeptID)
);

Create Table WORKS_ON(
EmpId INT,
FOREIGN KEY (EmpID) References Employee(EmpID),
ProjectID INT,
FOREIGN KEY (ProjectID) References Project(ProjectID),
HoursWorked Time
);

#PART B
#Insert at least 5 records into each table
#Update the salary of an employee whose EmpID=102 by increasing it by 10%
#Delete a project whose ProjectID=5

INSERT INTO Department VALUES
(1, 'IT', 'Kathmandu'),
(2, 'HR','Lalitpur'),
(3, 'Finance','Bhaktapur'),
(4, 'Marketing','Hetauda'),
(5, 'Admin','Chitwan');

INSERT INTO Project VALUES
(1,'Website Development','2025-12-30',50000,'2025-01-10'),
(2,'Mobile App','2025-10-15',40000,'2025-02-01'),
(3,'Database System','2025-08-20',30000,'2025-03-05'),
(4,'Cloud Migration','2025-11-25',60000,'2025-01-15'),
(5,'AI Chatbot','2025-09-10',45000,'2025-04-01');

INSERT INTO Employee Values
(101, 'John', 'Smith', 'M', 50000, '2022-01-15', 1),
(102, 'Emma', 'Brown', 'F', 45000, '2021-06-10', 2),
(103, 'David', 'Lee', 'M', 52000, '2020-03-20', 3),
(104, 'Sophia', 'Miller', 'F', 48000, '2023-02-01', 1),
(105, 'Michael', 'Johnson', 'M', 55000, '2019-11-12', 2);

INSERT INTO WORKS_ON VALUES
(101,1,'05:00:00'),
(102,2,'04:30:00'),
(103,3,'06:00:00'),
(104,4,'03:45:00'),
(105,5,'05:30:00');

UPDATE Employee
SET Salary = Salary * 1.10
WHERE EmpID = 102;

DELETE FROM WORKS_ON
WHERE ProjectID = 5;

DELETE FROM Project
WHERE ProjectID = 5;

#PART C: Basic Queries
#Display all employees who earn more than 50,000
#Display FirstName, LastName, and Salary of employees sorted by Salary in descending order
#Display employees who belong to the IT department
#Show the total number of employees in each department 
#Display employees who were hired after Janauray 1, 2022

Select * from Employee where Salary>50000;

Select FirstName, LastName, Salary from Employee order by Salary desc;

Select FirstName, LastName, DeptName from Employee
join Department
on Employee.DeptID = Department.DeptID
where DeptName = 'IT';

Select DeptName, COUNT(EmpID) AS TotalEmployees from Employee
join Department
on Employee.DeptID = Department.DeptID
group by DeptName;

Select * from Employee where HireDate>'2022-01-01';

#PART D: Join Queries
#Display employee names along with their department names
#Show employees and the project they working on
#Display project names with the total hours worked by employees

Select E.FirstName, E.LastName, D.DeptName from Employee E
join Department D
on E.DeptID = D.DeptID;

Select E.FirstName from Employee E
join WORKS_ON W on E.EmpID = W.EmpID
join Project P on W.ProjectID = P.ProjectID;

Select ProjectName, SUM(HoursWorked) as TotalHours from Project P
join WORKS_ON W on P.ProjectID = W.ProjectID
group by ProjectName;

#PART E: Aggregrate and Advanced Queries
#Find the average salary of employees in each department
#Display the department with the highest number of employees
#Find employees whose salary is greater than the average salary of all employees

Select DeptID, avg(Salary) as AverageSalary
from Employee
group by DeptID;

Select DeptName, COUNT(EmpID) as TotalEmployees
from Employee E
join Department D on E.DeptID = D.DeptID
group by DeptName
order by TotalEmployees DESC
limit 1;

Select FirstName, LastName, Salary
from Employee 
where Salary > (select avg(Salary) from Employee);

#PART F: Additional Tasks
#Create a view named HighSalaryEmployees that shows employeed with salary greater than 60,000
#Create an index on the LastName column of the EMPLOYEE table

Create View HighSalaryEmployees as
Select EmpID, FirstName, LastName, Salary, DeptID
from Employee
where Salary > 60000;
Select * from HighSalaryEmployees;

Create Index idx_LastName
on Employee (LastName);



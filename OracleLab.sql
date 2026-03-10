-- #2 Create Employee Table
CREATE TABLE Employee (
    EmployeeID VARCHAR2(20) PRIMARY KEY,
    FirstName VARCHAR2(20),
    LastName VARCHAR2(20),
    Gender CHAR(1),
    DateOfBirth DATE,
    Designation VARCHAR2(50),
    DepartmentName VARCHAR2(20),
    ManagerID VARCHAR2(20),
    JoinedDate DATE,
    Salary NUMBER(10,0)
);

-- #3 Insert Employee Records
INSERT INTO Employee VALUES
('0009','Season','Maharjan','M', DATE '1996-04-02','Engineer',
'Software Engineering','0005', DATE '2022-04-02',5000000);

INSERT INTO Employee VALUES
('0010','Ramesh','Rai','M', DATE '2000-04-02','Manager',
'Software Engineering','0003', DATE '2022-04-02',1000000);

-- View data
SELECT * FROM Employee;

-- #4 Update gender of employee 0010
UPDATE Employee
SET Gender = 'F'
WHERE EmployeeID = '0010';

-- #5 Employees older than 25
SELECT FirstName,
SYSDATE AS CurrentDate,
DateOfBirth,
TRUNC(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) AS Age
FROM Employee
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) > 25;

-- #6 Oldest employee
SELECT FirstName,
SYSDATE AS CurrentDate,
DateOfBirth,
TRUNC(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) AS Age
FROM Employee
ORDER BY DateOfBirth ASC
FETCH FIRST 1 ROW ONLY;

-- #7 Youngest employee
SELECT FirstName,
SYSDATE AS CurrentDate,
DateOfBirth,
TRUNC(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) AS Age
FROM Employee
ORDER BY DateOfBirth DESC
FETCH FIRST 1 ROW ONLY;

-- #8 Maximum salary department-wise
SELECT DepartmentName, MAX(Salary) AS Max_Salary
FROM Employee
GROUP BY DepartmentName;

-- #9 Employees who act as managers
SELECT *
FROM Employee
WHERE EmployeeID IN (
    SELECT ManagerID FROM Employee
);

-- #10 Most recently joined employee
SELECT *
FROM Employee
WHERE JoinedDate = (
    SELECT MAX(JoinedDate) FROM Employee
);
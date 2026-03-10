-- Drop tables first if they exist (optional, for rerun)
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employee';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE departments';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Create Departments table first (because Employee references it)
CREATE TABLE Departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50)
);

-- Create Employee table
CREATE TABLE Employee (
    Id NUMBER,
    employee_name VARCHAR2(25),
    department_id NUMBER
);

-- Insert records into Departments
INSERT INTO Departments VALUES (1,'Sales');
INSERT INTO Departments VALUES (2,'Engineering');
INSERT INTO Departments VALUES (3,'Human Resource');
INSERT INTO Departments VALUES (4,'Customer Service');
INSERT INTO Departments VALUES (5,'Research and Development');

-- Insert records into Employee
INSERT INTO Employee VALUES (1, 'Homer Simpson', 4);
INSERT INTO Employee VALUES (2, 'Ned Flanders', 1);
INSERT INTO Employee VALUES (3, 'Barney Gamble', 3);
INSERT INTO Employee VALUES (4, 'Clancy Wiium', 3);
INSERT INTO Employee VALUES (5, 'Moe Syzslax', NULL);

-- View tables
SELECT * FROM Employee;
SELECT * FROM Departments;

-- Inner Join
SELECT *
FROM Employee emp
INNER JOIN Departments dep
ON emp.department_id = dep.department_id;

-- Left Join (Departments + Employees)
SELECT *
FROM Departments dep
LEFT JOIN Employee emp
ON emp.department_id = dep.department_id;

-- Right Join (Employees + Departments)
-- Note: Oracle does not support RIGHT JOIN directly; we swap tables
SELECT *
FROM Employee emp
LEFT JOIN Departments dep
ON emp.department_id = dep.department_id;
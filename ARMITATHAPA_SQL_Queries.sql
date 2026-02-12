CREATE DATABASE testDB;
CREATE TABLE Persons(
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
DROP DATABASE testDB;
CREATE DATABASE testDB;
USE testDB;
CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    PRIMARY KEY (PersonID)
);
SELECT *FROM Persons;

ALTER TABLE Persons
ADD Email varchar(255);

ALTER TABLE Persons
RENAME COLUMN City to Country;

SELECT *FROM Persons;

ALTER TABLE Persons
MODIFY COLUMN PersonID int NOT NULL;

ALTER TABLE Persons
ADD Age int NOT NULL;

INSERT INTO Persons (PersonID, LastName, FirstName, Address, Country, Email, Age)
VALUES ('101', 'Thapa', 'Armita', 'Sunakothi', 'Nepal', 'armita005@gmail.com', '19'),
('105', 'Shrestha', 'Supriya', 'Kathmandu', 'Nepal', 'supriya077@gmail.com', '19'),
('109', 'Maharjan', 'Shreya', 'Lubhu', 'Nepal', 'shreya099@gmail.com', '19');

SELECT *FROM Persons;

SELECT PersonID, FirstName, Email FROM Persons;

SELECT *FROM Persons
WHERE Address = 'Kathmandu' OR Age = '21';
#AND
SELECT *FROM Persons
WHERE Address = 'Lubhu' AND Age = '20';
#NOT
SELECT * FROM Persons
WHERE NOT Age = '21';

CREATE TABLE Office (
    OfficeNo int,
    OfficeName varchar(255),
    Salary int
);
INSERT INTO Office (OfficeNo, OfficeName, Salary)
VALUES ('999', 'Everest', '99999'),
('888', 'Swivt', '70000'),
('666', 'Lhotse', '88000');

ALTER TABLE Persons 
ADD COLUMN OfficeID int;

UPDATE Persons SET OfficeID = 999 WHERE PersonID = 101;
UPDATE Persons SET OfficeID = 888 WHERE PersonID = 105;
UPDATE Persons SET OfficeID = 777 WHERE PersonID = 109;

SELECT 
    p.FirstName, 
    p.LastName, 
    o.OfficeName, 
    o.Salary
FROM Persons p
INNER JOIN Office o ON p.OfficeID = o.OfficeNo;

SELECT 
    p.FirstName, 
    p.LastName, 
    o.OfficeName
FROM Persons p
LEFT JOIN Office o ON p.OfficeID = o.OfficeNo;

SELECT 
    p.FirstName, 
    p.LastName, 
    o.OfficeName
FROM Persons p
RIGHT JOIN Office o ON p.OfficeID = o.OfficeNo;

SELECT 
    p.FirstName, 
    p.LastName, 
    o.OfficeName
FROM Persons p
LEFT JOIN Office o ON p.OfficeID = o.OfficeNo;

SELECT MAX(Salary) AS Highest_Salary 
FROM Office;

SELECT MIN(Salary) AS Lowest_Salary 
FROM Office;

SELECT 
    MAX(o.Salary) AS Top_Pay,
    MIN(o.Salary) AS Bottom_Pay
FROM Persons p
INNER JOIN Office o ON p.OfficeID = o.OfficeNo;

SELECT p.FirstName, p.LastName, o.Salary
FROM Persons p
JOIN Office o ON p.OfficeID = o.OfficeNo
WHERE o.Salary = (SELECT MAX(Salary) FROM Office);
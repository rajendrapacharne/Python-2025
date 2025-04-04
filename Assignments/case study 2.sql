use empdb
-- Create LOCATION table
CREATE TABLE LOCATION (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50)
);

INSERT INTO LOCATION VALUES (122, 'New York'), (123, 'Dallas'), (124, 'Chicago'), (167, 'Boston');

-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT,
    FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT VALUES (10, 'Accounting', 122), (20, 'Sales', 124), (30, 'Research', 123), (40, 'Operations', 167);

-- Create JOB table
CREATE TABLE JOB (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

INSERT INTO JOB VALUES (667, 'Clerk'), (668, 'Staff'), (669, 'Analyst'), (670, 'Sales Person'), (671, 'Manager'), (672, 'President');

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Employee_Id INT PRIMARY KEY,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Job_Id INT,
    Hire_Date DATE,
    Salary DECIMAL(10, 2),
    Commission DECIMAL(10, 2),
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES JOB(Job_ID),
    FOREIGN KEY (Department_Id) REFERENCES DEPARTMENT(Department_Id)
);

INSERT INTO EMPLOYEE VALUES 
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30);

-- Queries
-- 1. List all the employee details
SELECT * FROM EMPLOYEE;

-- 2. List all the department details
SELECT * FROM DEPARTMENT;

-- 3. List all job details
SELECT * FROM JOB;

-- 4. List all the locations
SELECT * FROM LOCATION;

-- 5. List First Name, Last Name, Salary, Commission
SELECT First_Name, Last_Name, Salary, Commission FROM EMPLOYEE;

-- 6. Alias columns
SELECT Employee_Id AS "ID of the Employee", Last_Name AS "Name of the Employee", Department_Id AS "Dep_id" FROM EMPLOYEE;

-- 7. Annual salary of employees
SELECT First_Name, Last_Name, Salary * 12 AS Annual_Salary FROM EMPLOYEE;

-- WHERE Conditions
-- 1. Details about "Smith"
SELECT * FROM EMPLOYEE WHERE Last_Name = 'Smith';

-- 2. Employees in department 20
SELECT * FROM EMPLOYEE WHERE Department_Id = 20;

-- 3. Salary between 2000 and 3000
SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 2000 AND 3000;

-- 4. Employees in department 10 or 20
SELECT * FROM EMPLOYEE WHERE Department_Id IN (10, 20);

-- 5. Not in department 10 or 30
SELECT * FROM EMPLOYEE WHERE Department_Id NOT IN (10, 30);

-- 6. Name starts with 'L'
SELECT * FROM EMPLOYEE WHERE First_Name LIKE 'L%';

-- 7. Name starts with 'L' and ends with 'E'
SELECT * FROM EMPLOYEE WHERE First_Name LIKE 'L%E';

-- 8. Name length 4 and starts with 'J'
SELECT * FROM EMPLOYEE WHERE LENGTH(First_Name) = 4 AND First_Name LIKE 'J%';

-- 9. Department 30, salary > 2500
SELECT * FROM EMPLOYEE WHERE Department_Id = 30 AND Salary > 2500;

-- 10. Employees without commission
SELECT * FROM EMPLOYEE WHERE Commission IS NULL;

-- ORDER BY Clause
-- 1. Employee ID and Last Name in ascending order
SELECT Employee_Id, Last_Name FROM EMPLOYEE ORDER BY Employee_Id ASC;

-- 2. Employee ID and Name in descending order by salary
SELECT Employee_Id, Last_Name FROM EMPLOYEE ORDER BY Salary DESC;

-- 3. Employee details by Last Name ascending
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC;

-- 4. Employee details by Last Name ascending, Department ID descending
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC, Department_Id DESC;

-- GROUP BY and HAVING Clause
-- 1. Department wise salary stats
SELECT Department_Id, MAX(Salary), MIN(Salary), AVG(Salary) FROM EMPLOYEE GROUP BY Department_Id;

-- 2. Job wise salary stats
SELECT Job_Id, MAX(Salary), MIN(Salary), AVG(Salary) FROM EMPLOYEE GROUP BY Job_Id;

-- 3. Employees joined each month
SELECT MONTH(Hire_Date) AS Month, COUNT(*) FROM EMPLOYEE GROUP BY MONTH(Hire_Date) ORDER BY Month;

-- 4. Employees joined each month and year
SELECT YEAR(Hire_Date) AS Year, MONTH(Hire_Date) AS Month, COUNT(*) FROM EMPLOYEE GROUP BY YEAR(Hire_Date), MONTH(Hire_Date) ORDER BY Year, Month;

-- 5. Department with at least 4 employees
SELECT Department_Id FROM EMPLOYEE GROUP BY Department_Id HAVING COUNT(*) >= 4;

-- Joins
-- 1. Employees with department names
SELECT E.*, D.Name AS Department_Name FROM EMPLOYEE E JOIN DEPARTMENT D ON E.Department_Id = D.Department_Id;

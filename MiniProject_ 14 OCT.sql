CREATE DATABASE companyABC;
use companyABC;

-- 1)	Create  manger table--- table name= Manager

CREATE TABLE Manager(
		Manager_ID VARCHAR(10) NOT NULL, 
        Manager_name VARCHAR(20) , 
        City VARCHAR(20),
		PRIMARY key(Manager_ID)
        );
        
INSERT INTO manager values ("M101", "Ajay","Pune"),
							("M102", "Amit","Mumbaie"),
                            ("M103", "Sandeep","Banglore"),
                            ("M104", "Prakhar","Pune"),
                            ("M105", "Jaydeep","Indore"),
                            ("M106", "Shubham","Banglore");
                            
update manager SET city = "Mumbai" where manager_id = "m102";
                            
-- 2)	Create department table--- table name= Department

CREATE TABLE Department(
		dept_ID int NOT NULL, 
        dept_name VARCHAR(20) , 
        PRIMARY key(dept_ID)
        );

INSERT INTO Department values (1, "Admin"),
							(2, "HR"),
                            (3, "Developer"),
                            (4, "Tester"),
                            (5, "Accounts");
                            
-- 3)	Create  employee table--- table name= Employee
       
CREATE TABLE Employee(
		Emp_ID VARCHAR(10) NOT NULL, 
        Emp_Name VARCHAR(20) , 
        Salary INT,
        City VARCHAR(20),
        Dept_ID INT,
        Manager_ID VARCHAR(20),
        PRIMARY key(Emp_ID),
        FOREIGN KEY(dept_ID) REFERENCES Department(dept_ID),
        FOREIGN KEY(Manager_ID) REFERENCES Manager(Manager_ID)                
        );

INSERT INTO Employee values (1, "Karan", 300000, "Mumbai", 2, "M102"),
							(2, "Rohit", 75000, "Banglore", 1, "M106"),
                            (3, "Ankush", 35000, "Ahemdabad", 5, "M105"),
                            (4, "Priyanshi", 500000, "Kolkata", 3, "M102"),
                            (5, "Sanket", 100000, "Pune", 3, "M101"),
                            (6, "Shruti", 80000, "Indore", 4, "M105"),
                            (7, "Jayaraj", 75000, "Bhopal", 2, "M103"),
                            (8, "Dilip", 66000, "Mumbai", 3, "M102"),
                            (9, "Geet", 17000, "Mumbai", 2, "M101");
      
     
SELECT * from manager;
SELECT * from department;
SELECT * from employee;

-- QUESTIONS:
-- 1)	Write a SQL query to find the name of the department where more than two employees are working.

SELECT Dept_ID
    FROM Employee
    GROUP BY Dept_ID
    HAVING COUNT(Emp_ID) > 2;

SELECT Dept_Name
FROM Department
WHERE Dept_ID IN (
    SELECT Dept_ID
    FROM Employee
    GROUP BY Dept_ID
    HAVING COUNT(Emp_ID) > 2
);


-- 2)	Write SQL query to calculate the average salary of each department which is higher than 75000. 
-- 	Find department name also in descending order.

SELECT Dept_ID
    FROM Employee
    GROUP BY Dept_ID
    having avg (salary) > 75000;
    
    SELECT Dept_Name
	FROM Department
    where dept_Id in (
    SELECT Dept_ID
    FROM Employee
    GROUP BY Dept_ID
    having avg (salary) > 75000);
    
-- 3)	Write a SQL query to find the manager and employee who belongs to same city.

SELECT emp_name, manager_Id from employee
where city IN (
select city from manager
where manager_id in ( 
select distinct manager_id from employee)
);

-- 4)	Write a SQL query to find those employee whose salary exist between 35000 and 90000 with the department and manger name.

SELECT Emp_name, dept_id, manager_id
FROM Employee
    where salary BETWEEN 35000 and 90000;

 

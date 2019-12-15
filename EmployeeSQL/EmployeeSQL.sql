-- Import schema from quickdatabasediagrams.com

CREATE TABLE Departments (
    Dept_No VARCHAR   NOT NULL,
    Dept_Name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_No
     )
);

CREATE TABLE Dept_Emp (
    Emp_No INT   NOT NULL,
    Dept_No VARCHAR   NOT NULL,
    From_Date DATE   NOT NULL,
    To_Date DATE   NOT NULL
);

CREATE TABLE Dept_Manager (
    Dept_No VARCHAR   NOT NULL,
    Emp_No INT   NOT NULL,
    From_Date DATE   NOT NULL,
    To_Date DATE   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (
        Emp_No
     )
);

CREATE TABLE Employees (
    Emp_No INT   NOT NULL,
    Birth_Date DATE   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    GENDER VARCHAR   NOT NULL,
    Hire_Date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);

CREATE TABLE Salaries (
    Emp_No INT   NOT NULL,
    Salary MONEY   NOT NULL,
    From_Date DATE   NOT NULL,
    To_Date DATE   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_No
     )
);

CREATE TABLE Titles (
    Emp_No INT   NOT NULL,
    Title VARCHAR   NOT NULL,
    From_Date DATE   NOT NULL,
    To_Date DATE   NOT NULL
);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_Emp_No FOREIGN KEY(Emp_No)
REFERENCES Employees (Emp_No);

-- DATA ANALYSIS --

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM Employees
JOIN Salaries
on employees.emp_no = salaries.emp_no
ORDER BY emp_no;

-- 2. List employees who were hired in 1986.

SELECT hire_date, emp_no, last_name, first_name, gender, birth_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, employees.hire_date, dept_manager.to_date
FROM departments
JOIN Dept_Manager
ON Departments.dept_no = Dept_Manager.dept_no
JOIN Employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
JOIN Dept_Emp
ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments
ON Departments.dept_no = Dept_Emp.Dept_no
ORDER BY emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY emp_no;

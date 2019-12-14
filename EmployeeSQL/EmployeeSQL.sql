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

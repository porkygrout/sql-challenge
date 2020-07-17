-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title" VARCHAR(30)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(35)   NOT NULL,
    "last_name" VARCHAR(35)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");


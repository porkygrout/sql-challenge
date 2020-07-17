--Salaries
SELECT "Employee"."Employee_num", "Employee"."Last_Name", "Employee"."First_Name", "Employee"."Sex",
"Salaries"."Salary"
FROM "Employee"
INNER JOIN "Salaries" ON
"Employee"."Employee_num" = "Salaries"."Employee_num";


-- How many employees from 1986
SELECT "Employee"."First_Name", "Employee"."Last_Name", "Employee"."Hire_Date" 
FROM "Employee"
WHERE "Hire_Date" >= '1985-12-31' AND "Hire_Date" < '1987-01-01';

--Number of Last Names
SELECT "Last_Name", COUNT("Last_Name") FROM "Employee"
GROUP BY "Last_Name"
ORDER BY count("Last_Name") desc;

--Department Managers
SELECT "Employee"."Last_Name", 
		"Employee"."First_Name",
		"Department_Mgr"."Employee_num", 
		"Departments"."Department_no", 
		"Departments"."Department_name" 
FROM "Departments" 
INNER JOIN (("Employee" INNER JOIN "Department_Mgr" ON "Department_Mgr"."Employee_num" = "Employee"."Employee_num") 
INNER JOIN "Department_Employees" ON "Employee"."Employee_num" = "Department_Employees"."Employee_num") 
ON ("Departments"."Department_no" = "Department_Mgr"."Dept_no") AND ("Departments"."Department_no" = "Department_Employees"."Departments");

--Employees By Department
SELECT "Employee"."Employee_num", 
	   "Employee"."Last_Name", 
	   "Employee"."First_Name",
	   "Departments"."Department_name"
FROM "Employee"
INNER JOIN "Department_Employees" ON
"Employee"."Employee_num" = "Department_Employees"."Employee_num"
INNER JOIN "Departments" ON
"Department_Employees"."Departments" = "Departments"."Department_no";

--Hurcules's

SELECT  "Employee"."First_Name", 
        "Employee"."Last_Name", 
		"Employee"."Sex" 
		FROM "Employee"
		WHERE "First_Name" = 'Hercules' AND "Employee"."Last_Name" Like 'B%';
		
--Sales Employees
SELECT "Employee"."Employee_num", 
	   "Employee"."Last_Name", 
	   "Employee"."First_Name",
	   "Departments"."Department_name"
FROM "Employee"
INNER JOIN "Department_Employees" ON
"Employee"."Employee_num" = "Department_Employees"."Employee_num"
INNER JOIN "Departments" ON
"Department_Employees"."Departments" = "Departments"."Department_no"
WHERE ((("Departments"."Department_name")='Sales'));

--Sales and Development Employees
SELECT "Employee"."Employee_num", 
	   "Employee"."Last_Name", 
	   "Employee"."First_Name",
	   "Departments"."Department_name"
FROM "Employee"
INNER JOIN "Department_Employees" ON
"Employee"."Employee_num" = "Department_Employees"."Employee_num"
INNER JOIN "Departments" ON
"Department_Employees"."Departments" = "Departments"."Department_no"
WHERE ((("Departments"."Department_name")='Sales') OR(("Departments"."Department_name")='Development') );
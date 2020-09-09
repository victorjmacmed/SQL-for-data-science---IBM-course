-- Here we use the tables EMPLOYEES and DEPARTMENTS (you can find these tables on another GitHub folder).  --

-- PART A -- SUB-QUERIES AND NESTED-SELECTS --

-- Query A1: Enter a failing (i.e. which gives an error) to retrieve all employees whose salary is greater than the average salary --

select * from EMPLOYEES
		WHERE SALARY > AVG(SALARY);

-- THIS CODE IS NOT RIGHT ON PURPOSE --
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A2: Enter a working query using a sub-select to retrieve all employees whose salary is greater than the average salary -- 

SELECT EMP_ID, F_NAME, L_NAME, SALARY FROM EMPLOYEES
			where SALARY > (select AVG(SALARY) FROM EMPLOYEES );

-- HERE WE USE A SUB-QUERY.
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A3: Enter a failing query (i.e. that gives an error) that retrieves all employees records and average salary in every row

select EMP_ID, SALARY, AVG(SALARY) AS AVG_SALARY from employees ;


-- THIS CODE IS NOT RIGHT ON PURPOSE --
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A4: Enter a Column Expression that retrieves all employees records and average salary in every row --

select EMP_ID, SALARY, (select AVG(SALARY) FROM EMPLOYEES) AS AVG_SALARY FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query A5: Enter a Table Expression that retrieves only the columns with non-sensitive (sensitive -> salary, address, job id, manager id) employee data --


select * from (select EMP_ID, F_NAME, L_NAME, DEP_ID from EMPLOYEES) AS NONSENSITIVE;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- PART B -- ACCESSING MULTIPLE TABLES WITH SUB-QUERIES --

-- Query B1: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table --

select * from EMPLOYEES
            WHERE DEP_ID IN (select  DEPT_ID_DEP from DEPARTMENTS);
            
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query B2: Retrieve only the list of employees from location L0002 --

select * from EMPLOYEES
			WHERE DEP_ID IN (select DEPT_ID_DEP from DEPARTMENTS WHERE LOC_ID = 'L0002');

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query B3: Retrieve the department ID and name for employees who earn more than $70,000 --

select DEPT_ID_DEP, DEP_NAME FROM DEPARTMENTS
				WHERE DEPT_ID_DEP IN (select DEP_ID from EMPLOYEES WHERE SALARY > 70000);

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query B4: Specify 2 tables in the FROM clause - 

select * from EMPLOYEES, DEPARTMENTS;
				
-- This 'pastes' both tables. --

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- PART C -- MULTIPLE TABLES WITH IMPLICITY JOINS --

-- Query B5: Retrieve only the EMPLOYEES records that correspond to departments in the DEPARTMENTS table -- 

select * from EMPLOYEES, DEPARTMENTS
 			WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;
 			
 select * from EMPLOYEES 
              WHERE DEP_ID IN (select DEPT_ID_DEP FROM DEPARTMENTS);
 			
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query B6: Use shorter aliases for table names --

select * from EMPLOYEES E, DEPARTMENTS D 
			WHERE E.DEP_ID = D.DEPT_ID_DEP;

select * from EMPLOYEES E 
			WHERE E.DEP_ID IN (select DEPT_ID_DEP FROM DEPARTMENTS);			

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query B7: Retrieve only the Employee ID and Department name in the above query --

select EMP_ID, DEP_NAME from EMPLOYEES E, DEPARTMENTS D
			WHERE E.DEP_ID = D.DEPT_ID_DEP;

-----------------------------------------------------------------------------------------------------------------------------------------------------------








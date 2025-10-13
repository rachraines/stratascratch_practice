/*
Task ID 10299 - Finding Updated Records: 
We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
Find the current salary of each employee assuming that salaries increase each year. 
Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.
*/

SELECT 
  id, 
  first_name, 
  last_name, 
  department_id, 
  salary 
  FROM(
    SELECT 
      id, 
      first_name, 
      last_name, 
      department_id, salary,
      RANK() OVER (PARTITION BY id ORDER BY salary DESC) AS `rank`
    FROM ms_employee_salary
) AS ranked
WHERE `rank` = 1
ORDER BY id;

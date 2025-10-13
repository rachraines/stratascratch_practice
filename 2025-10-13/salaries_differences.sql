/*
Task ID 10308 - Salaries Differences: Calculates the difference between the highest salaries in the marketing and engineering departments. 
Output just the absolute difference in salaries.
*/

SELECT ABS(MAX(CASE
                    WHEN dept.department = "marketing" THEN emp.salary 
                    END) - MAX(CASE
                                    WHEN dept.department = "engineering" THEN emp.salary END)) AS salary_difference  
FROM db_employee emp
JOIN db_dept dept ON dept.id = emp.department_id;

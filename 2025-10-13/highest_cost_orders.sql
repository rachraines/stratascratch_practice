/*
Task ID 9915 - Highest Cost Orders: Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. 
If a customer had more than one order on a certain day, sum the order costs on a daily basis. 
Output each customer's first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique.
*/

SELECT 
first_name, 
total_spent, 
order_date
FROM(
    SELECT
        first_name,
        total_spent,
        order_date,
        RANK() over(PARTITION BY order_date ORDER BY total_spent DESC) AS `rank`
FROM(
    SELECT 
        first_name, 
        SUM(total_order_cost) AS total_spent, 
        order_date
    FROM orders o
    JOIN customers c on o.cust_id = c.id
    WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY cust_id, order_date
    ) AS daily_totals
) AS ranked
WHERE `rank` = 1
ORDER BY order_date;

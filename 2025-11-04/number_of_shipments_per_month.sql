/*
Task ID 2056 - Number of Shipments per Month: 
Write a query that will calculate the number of shipments per month. 
The unique key for one shipment is a combination of shipment_id and sub_id. 
Output the year_month in format YYYY-MM and the number of shipments in that month.
*/

SELECT
    LEFT(shipment_date, 7) AS `year_month`,
    COUNT(*) AS shipments
FROM amazon_shipment
GROUP BY LEFT(shipment_date, 7)
ORDER BY `year_month`;

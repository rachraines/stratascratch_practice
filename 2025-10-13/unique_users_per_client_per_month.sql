/*
Task ID 2024 - Unique Users per Client per Month: 
Write a query that returns the number of unique users per client for each month. 
Assume all events occur within the same year, so only month needs to be be in the output as a number from 1 to 12.
*/

SELECT client_id, 
  COUNT(DISTINCT user_id) AS unique_users, 
  SUBSTRING(time_id, 6, 2) AS `month`
FROM fact_events
GROUP BY client_id, `month`;

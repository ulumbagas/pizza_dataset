-- trends total quantity of pizzas over time
SELECT 
    FORMAT_DATE('%B', o.date) AS `Month`, SUM(od.quantity)
FROM
    `pizza.order_details` od
        LEFT JOIN
    `pizza.orders` o USING (order_id)
GROUP BY `Month`;

SELECT 
    FORMAT_DATE('%A', o.date) AS `Day`, SUM(od.quantity)
FROM
    `pizza.order_details` od
        LEFT JOIN
    `pizza.orders` o USING (order_id)
GROUP BY `Day`;

SELECT 
    EXTRACT(HOUR FROM `time`) AS Hour, SUM(quantity) AS Quantity
FROM
    `pizza.order_details` od
        JOIN
    `pizza.orders` o USING (order_id)
GROUP BY Hour
ORDER BY Hour;

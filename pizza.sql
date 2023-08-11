SELECT 
    FORMAT_DATE('%B', o.date) AS `Month`, SUM(od.quantity)
FROM
    `pizza.order_details` od
        LEFT JOIN
    `pizza.orders` o USING (order_id)
GROUP BY `Month`;
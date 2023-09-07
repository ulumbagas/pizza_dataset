-- trends total quantity of pizzas over time

-- Total Revenue and Total Quantity
select concat("$ ",sum(od.quantity * p.price)) as Total_Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id;

select sum(od.quantity) as total_quantity
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id;


--show monhtly Total quantity and Revenue
SELECT
  FORMAT_DATE('%B',o.date) AS `Month`,
  SUM(od.quantity) AS quantity,
  SUM(od.quantity * p.price) AS Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
GROUP BY
  `Month`;

--show Dayly Total quantity and Revenue
SELECT
  FORMAT_DATE('%A',o.date) AS `Month`,
  SUM(od.quantity) AS quantity,
  SUM(od.quantity * p.price) AS Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
GROUP BY
  `Month`;
  
--show Date Total quantity and Revenue
SELECT
  EXTRACT(Day
  FROM
    o.date) AS `Date`,
  SUM(od.quantity),
  SUM(od.quantity * p.price) AS Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id=o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
GROUP BY
  `Date`
ORDER BY
  `Date`;

--show Total quantity and Revenue each Hour
SELECT
  EXTRACT(HOUR FROM `time`) AS Hour,
  SUM(od.quantity) AS Quantity,
  SUM(od.quantity * p.price) AS Revenue
FROM
  `pizza.order_details` od
JOIN
  `pizza.orders` o
ON
  od.order_id=o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
GROUP BY
  Hour
ORDER BY
  Hour;

-- Pizza name Revenue
SELECT
  pt.name as name, sum(od.quantity) as Total_Quantity, sum(od.quantity * p.price) as Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
left join 
 `pizza.pizza_type` pt
ON
p.pizza_type_id = pt.pizza_type_id
group by name
order by Revenue;

-- Pizza category Revenue
SELECT
  pt.category as category, sum(od.quantity) as Total_Quantity, sum(od.quantity * p.price) as Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
left join 
 `pizza.pizza_type` pt
ON
p.pizza_type_id = pt.pizza_type_id
group by category
order by Revenue;

-- Pizza size Revenue
SELECT
  p.size as size, sum(od.quantity) as Total_Quantity, sum(od.quantity * p.price) as Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
left join 
 `pizza.pizza_type` pt
ON
p.pizza_type_id = pt.pizza_type_id
group by size
order by Revenue;

-- Summarizing Pizza name, Size, and Price
SELECT
  DISTINCT(pt.name) AS name,
  p.size AS size,
  p.price AS price
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
LEFT JOIN
  `pizza.pizza_type` pt
ON
  p.pizza_type_id = pt.pizza_type_id;

-- Summarizing Pizza name, Size, and Revenue
SELECT
  pt.name AS name,
  p.size AS size,
  sum(od.quantity * p.price) AS Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.orders` o
ON
  od.order_id = o.order_id
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
LEFT JOIN
  `pizza.pizza_type` pt
ON
  p.pizza_type_id = pt.pizza_type_id
group by name, size
order by name;

--Size Percentage
SELECT
  p.size AS size, ROUND(SUM(od.quantity * p.price),2) Total_revenue
  (SUM(od.quantity * p.price)/(
    SELECT
      SUM(od.quantity * p.price)
    FROM
      `pizza.order_details` od
    LEFT JOIN
      `pizza.pizzas` p
    ON
      od.pizza_id = p.pizza_id
    LEFT JOIN
      `pizza.pizza_type` pt
    ON
      p.pizza_type_id = pt.pizza_type_id))*100 AS percentage_Revenue
FROM
  `pizza.order_details` od
LEFT JOIN
  `pizza.pizzas` p
ON
  od.pizza_id = p.pizza_id
LEFT JOIN
  `pizza.pizza_type` pt
ON
  p.pizza_type_id = pt.pizza_type_id
GROUP BY
  size;




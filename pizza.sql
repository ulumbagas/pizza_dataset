-- trends total quantity of pizzas over time

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

-- Pizza name Revenue
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
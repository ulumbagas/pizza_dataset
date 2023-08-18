# pizza_dataset
This analysis project focuses on one of the most popular global food icons "pizza" and in this analysis i am using Bigquery. My main goal is to uncover valuable insights from a collection of datasets that encompass various aspects. By carefully analyzing the pizza dataset, we can identify interesting patterns, evolving consumer trends, and perhaps even determine whether there is a relationship between certain factors, such as weather or seasons, and pizza preferences. Through this approach, we hope to provide beneficial insights for the culinary industry. <br/>
### About Dataset.
The pizza dataset comprises four tables:

1. The 'order' table with 4 columns: order_id, date, time.
2. The 'order_detail' table with 4 columns: order_id, order_details_id, pizza_id, quantity.
3. The 'pizzas' table with 4 columns: pizza_id, pizza_type_id, size, price.
4. The 'pizza_types' table with 4 columns: pizza_type_id, name, category, ingredient.

In total, there have been 48,620 transactions. In this analysis, I assume that the currency is in $.
<br/>
### Revenue and Quantity
The first step in this analysis is to calculate the Total Revenue and Total Quantity from all transactions.
<br/>
```
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
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/6e5a71c0-fb28-489b-ba34-4919a3910600)--->

<p align="center" width="30%">
    <img width="30%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/6e5a71c0-fb28-489b-ba34-4919a3910600"> 
</p>
<br/>

```
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
```
<!---[image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/8f16a596-4f97-417f-8900-caca04ed4d5b)--->

<p align="center" width="30%">
    <img width="30%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/8f16a596-4f97-417f-8900-caca04ed4d5b"> 
</p>
<br/>

### Monthly Quantity and Revenue
By analyzing the monthly Quantity, I could identify trends in terms of when pizzas are ordered the most and whether there are any seasonal variations. Additionally, calculating monthly Revenue would provide insights into the revenue generated during different months, helping to identify peak periods and potential areas for improvement in terms of marketing.

```
SELECT
  FORMAT_DATE('%B',o.date) AS `Month`,
  SUM(od.quantity) AS quantity,
  CONCAT("$ ",SUM(od.quantity * p.price)) AS Revenue
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
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/030e6095-6e04-46aa-87ab-62b06d737bd4) --->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/030e6095-6e04-46aa-87ab-62b06d737bd4"> 
</p>
<br/>
From the analysis results, it can be observed that the highest sales occurred in the month of July with total revenue $ 72557, followed by May, and then trailed by March. In my opinion, there are several reasons that could possibly explain this phenomenon: <br/>

1. Summer and Holidays: July is usually in the summertime in many places around the world. During summer, people are often more relaxed and gather together or celebrate events like school holidays. This can make more people want to order fast food like pizza. <br/>

2. Weather and Social Activities: Warmer weather can also have an impact. Those months might have weather conditions that are more suitable for outdoor activities or social gatherings, which can increase the demand for fast food like pizza. <br/>

### Daily Quantity and Revenue
The objective of analysis daily Quantity and Revenue is to get a deep insight into daily patterns in pizza sales and revenue. <br/>
1. Identifying Daily Patterns, by analyzing the daily quantity and income, you can identify daily patterns or trends in sales. This can help you understand when the demand is highest and lowest throughout the day. <br/>
2. Inventory Management, by knowing the daily sales pattern, you can optimize inventory management. You can ensure that the stock of pizza is sufficient to meet high demand and avoid overstocking in periods of low demand. <br/>
3. Promotional Optimization, by knowing when sales tend to be lower, you can plan promotions or special offers to drive increased demand at certain times. <br/>

```
SELECT
  FORMAT_DATE('%A',o.date) AS `Day`,
  SUM(od.quantity) AS quantity,
  Concat("$ ",SUM(od.quantity * p.price)) AS Revenue
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
  `Day`;
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/48055e8d-7d99-47b8-b7e9-1a1cc534ff3f)--->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/48055e8d-7d99-47b8-b7e9-1a1cc534ff3f"> 
</p>



# pizza_dataset
This project focuses on one of the most popular global food icons "pizza" and in this analysis i am using Bigquery. My main goal is to uncover valuable insights from a collection of datasets that encompass various aspects. By carefully analyzing the pizza dataset, we can identify interesting patterns, evolving consumer trends, and perhaps even determine whether there is a relationship between certain factors, such as weather or seasons, and pizza preferences. Through this approach, we hope to provide beneficial insights for the culinary industry. <br/>
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
From the analysis results, it can be observed that the highest sales occurred in the month of July with total revenue $ 72,557, followed by May, and then trailed by March. In my opinion, there are several reasons that could possibly explain this phenomenon: <br/>

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
<br/>

Based on the analysis of the pizza dataset, Friday stands out as the day with the highest weekly sales, generating a revenue of $ 123,528 and total quantity 8242, here are the potential reasons <br/>
1. Fridays are often associated with the start of the weekend, a time when people are more likely to relax and indulge in convenience foods like pizza. Many individuals might prefer to order in or dine out on Fridays as a way to unwind from the workweek and kick off the weekend. <br/>
2. Fridays are a favorite day for social gatherings. People often spend time with friends, family, or coworkers after work. There could be events, meetups, or casual get-togethers. Pizza is often chosen for these situations because it's easy to share. <br/>
3. Fridays get busy as people finish work and prepare for the weekend. Ordering pizza is an easy meal choice for those who don't have time or energy to cook. <br/>

### Daily Date Quantity and Revenue 
Analyzing Quantity and Revenue on each date in every month in the pizza dataset can involve several important aspects for business understanding and decision-making. <br/>
1. Understanding Buying Habits: By looking at how many pizzas are sold on each date, you can see when customers tend to buy. This helps identify busy days and plan supplies effectively. For instance, you can spot if certain days of the month have higher sales. <br/>
2. Sales Trends: By analyzing Revenue (income from sales) on each date, you can recognize sales trends throughout the month. This can help identify periods when revenue is typically higher or lower. This information can be valuable for promotional planning and pricing strategies. <br/>

<!--- [image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/58dcc5f1-799f-41f4-b9e2-ae5dccd8774c)--->

```
SELECT
  EXTRACT(Day
  FROM
    o.date) AS `Date`,
  SUM(od.quantity) quantity,
  Concat("$ ",SUM(od.quantity * p.price)) AS Revenue
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
  `Date`;
```
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/58dcc5f1-799f-41f4-b9e2-ae5dccd8774c"> 
</p>

Based on the result the highest sales performance occurs in the middle and beginning of the month.  There could be several possible reasons for the  pizza sales performance <br/>
1. Paycheck Timing: Many people receive their paychecks at the beginning of the month. This influx of disposable income could lead to increased spending on items like pizza as a convenient and enjoyable treat. <br/>
2. Monthly Routines: People might establish a pattern of dining out or ordering in during specific times of the month, such as the middle and beginning, when they may be more likely to socialize, celebrate, or simply take a break from cooking. <br/>
3. Social Events: Social activities like sports events, movie nights, or game nights might be planned more often during the middle and beginning of the month, and pizza is a popular choice for such gatherings. <br/>

### Total quantity and Revenue each Hour
Analyzing the total quantity and revenue each hour can help you understand your customers, how your business runs, and revenue pattern. here are the potential reasons <br/>
1. Peak Sales Hours: Analyzing total quantity and revenue each hour can help identify the peak sales hours throughout the day. This information can be used to allocate resources, such as staff and ingredients, more effectively during these busy periods. <br/>
2. Promotions: When we know the busiest times for sales, we can plan when to offer special deals or discounts. This can help bring in more orders during the slower hours. <br/>
3. Demand Forecasting: By analyzing hourly sales we can guess how many orders we might get in the future. This helps us get ready with enough ingredients and staff for busy times. <br/>

```
SELECT
  EXTRACT(HOUR FROM `time`) AS Hour,
  SUM(od.quantity) AS Quantity,
  Concat("$ ",SUM(od.quantity * p.price)) AS Revenue
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
  Hour;
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/63dce195-5934-45de-ba2f-5912f7eff97e)
 --->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/63dce195-5934-45de-ba2f-5912f7eff97e"> 
</p>
<br/>
Based on the analysis, sales began at 09:00 and ended at 23:00. Peak sales occurred from 12:00 to 13:00, followed by 17:00 to 18:00. The peak sales from 12:00 to 13:00 could be attributed to the lunchtime rush. Many people prefer ordering food during their lunch breaks, and pizza is a convenient and quick option. People like ordering pizza in the late afternoon, around 17:00 to 18:00. This might be because they want a  snack or an early dinner. After a busy day at work or school, they want something tasty and easy to eat. <br/>

### Pizza with the Highest Revenue
Analyzing the pizza that generates the most revenue provides insights into customer preferences. Understanding what customers like  and marketing strategies to fill to their demand.

```
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
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/8c8a2775-e757-49cf-bc36-7ca0357d06f4)
 --->
 <p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/8c8a2775-e757-49cf-bc36-7ca0357d06f4"> 
</p>

From the analysis results, it is evident that <b> The Thai Chicken Pizza </b> has the highest revenue. However, in terms of quantity, both <b>The Barbecue Chicken Pizza</b> and <b>The Classic Deluxe Pizza</b> have higher numbers. This difference could be due to <b>The Thai Chicken Pizza</b> having a higher price per unit compared to <b>The Barbecue Chicken Pizza</b> and <b>The Classic Deluxe Pizza</b>. Furthermore, the size of the pizzas being sold also influences the price. As a result, the prices for each pizza based on their sizes will be presented next.

### Summarizing Pizza name, Size, and Price
```
SELECT
  pt.name AS name,
  p.size AS size,
  p.price, 
  sum(od.quantity) as Total_quantity, sum(od.quantity * p.price) as Total_price
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
where name in ('The Thai Chicken Pizza','The Barbecue Chicken Pizza','The Classic Deluxe Pizza')
GROUP BY name, size, p.price;
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/7db741a1-8cf4-40b6-bd25-11716b7782c0)
 --->

 <p align="center" width="75%">
    <img width="75%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/7db741a1-8cf4-40b6-bd25-11716b7782c0"> 
</p>
Based on the comparison results of the pizzas above, I have drawn two conclusions: <br/>

1. The price for each size of The Barbecue Chicken Pizza is higher compared to The Classic Deluxe Pizza. However, the sales of The Classic Deluxe Pizza are only significant for size M. On the other hand, The Barbecue Chicken Pizza's sales are high for two sizes, L and M, which collectively impact the total revenue <br/>

2. The price per unit for The Barbecue Chicken Pizza and The Thai Chicken Pizza is the same. The difference lies in the total number of orders, where The Thai Chicken Pizza is only high in one size, which is L, while The Barbecue Chicken Pizza is high in two sizes, L and M, which impacts the total revenue. <br/>

### Size Percentage
```
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
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/07e70247-535e-41a4-b6ec-dbc99a1b0d6c)
 --->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/07e70247-535e-41a4-b6ec-dbc99a1b0d6c"> 
</p>
<br/>
Based on the above analysis, pizza sales by size reveal that size L has the highest revenue, exceeding $300,000  and is the most favored by customers, accounting for 45% of total sales. <br/>

### Revenue by Category
Next, i will show revenue per category to see which category has the highest revenue
```
SELECT
  pt.category as category, sum(od.quantity) as Total_Quantity, ROUND(sum(od.quantity * p.price),2) as Revenue
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
order by Revenue DESC;
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/40a387cd-a7f2-455f-8967-fca9d92b2c47)--->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/40a387cd-a7f2-455f-8967-fca9d92b2c47"> 
</p>
<br/>
Based on the analysis results, it is evident that the "Classic" category ranks first with a revenue of $220,053.1 and a total quantity of 14,888. next I will show top 2 pizza name each category by revenue. <br/>

```
SELECT
  rank() over(partition by category order by revenue desc) as `Rank`,
  category,
  name,
  round(revenue,2) as revenue
FROM (
  SELECT
    pt.category AS category,
    pt.name AS name,
    SUM(od.quantity * p.price) AS revenue,
    RANK() OVER(PARTITION BY category ORDER BY SUM(od.quantity * p.price) DESC) AS number
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
    category,
    name
  ORDER BY
    revenue DESC,
    category DESC) ranked
WHERE
  number <3;
```
<!--- ![image](https://github.com/ulumbagas/pizza_dataset/assets/58242856/c4a9fbda-53c9-4389-baeb-dbd1add667a5)--->
<p align="center" width="50%">
    <img width="50%" src="https://github.com/ulumbagas/pizza_dataset/assets/58242856/c4a9fbda-53c9-4389-baeb-dbd1add667a5"> 
</p>

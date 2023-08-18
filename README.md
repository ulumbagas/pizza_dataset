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

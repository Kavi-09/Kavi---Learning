-- List all customers from Chennai --

select * from customers
where city = 'Chennai'


-- Show all orders above 1000, newest first --

select * from orders
where total_amount > 1000
order by order_date desc

--How many orders did each customer place?--

select customer_id,count(customer_id) as orders_per_customer
from orders
group by customer_id

-- Total revenue by product category --

select category, sum(price*quantity) as revenue
from products
group by category

-- Which customer spent the most overall? --

select customer_id, sum(total_amount) as Overall_price
from orders
group by customer_id
order by Overall_price desc
limit 1

-- Show customer NAME alongside their order amount--

select c.name, sum(o.total_amount)
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.name

-- Customers who placed more than 1 order --

select c.name , count(o.order_id) as order_per_customers
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.name
having count(o.order_id) > 1

-- Most expensive product in each category--

select category, Max(price)
from products
group by category

-- Customers who spent more than the average order amount --

select c.name, Avg(o.total_amount)
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.name
having o.total_amount > Avg(o.total_amount) 


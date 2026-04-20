use ecommerce;
-- QUESTION 1
/* Total Sales by Employee: 
   - Write a query to calculate the total sales (in dollars) made by each employee, considering the quantity and unit price of products sold.
*/
select * from employees;
select * from orders;
select * from orderdetails;
select employees.employeeid, employees.firstname, employees.lastname,
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as "Total Sales"
from employees
inner join orders 
on employees.employeeid = orders.employeeid
inner join orderdetails
on orderdetails.orderid = orders.orderid
group by employees.employeeid;

-- EMPLOYEEID 10 made no sales. Truly he's an old chum.


-- QUESTION 2
/* Top 5 Customers by Sales:
   - Identify the top 5 customers who have generated the most revenue. Show the customer’s name and the total amount they’ve spent.
*/
select * from customers;
select * from orderdetails;
select * from orders;
select customers.customername, 
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as Top5Revenue
from customers
inner join orders 
on customers.customerid = orders.customerid
inner join orderdetails
on orderdetails.orderid = orders.orderid
group by orders.customerid
order by top5revenue desc
limit 5;


-- QUESTION 3
/*Monthly Sales Trend:
   - Write a query to display the total sales amount for each month in the year 1997.
*/
select * from orders;
select * from orderdetails;
select monthname(orders.orderdate) as Month,
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as "Total Sales"
from orders
inner join orderdetails
on orders.orderid = orderdetails.orderid
where year(orders.orderdate) = 1997
group by monthname(orders.orderdate)
order by Month desc;


-- QUESTION 4
/*Order Fulfilment Time:
   - Calculate the average time (in days) taken to fulfil an order for each employee. 
   Assuming shipping takes 3 or 5 days respectively depending on if the item was ordered in 1996 or 1997.
*/
-- FOR 1996 = 3 days, FOR 1997 = 5 days
select * from employees;
select * from orders;
select E.employeeid, E.firstname, E.lastname,
avg(if(year(O.orderdate) = 1996, 3, 5)) as "AverageFulfillTime"
from employees E
inner join orders O
on E.employeeid = O.employeeid
where year(O.orderdate) in (1996, 1997)
group by E.employeeid, E.firstname, E.lastname
order by E.employeeid, E.firstname, E.lastname;


-- QUESTION 5
/*Products by Category with No Sales:
   - List the customers operating in London and total sales for each. 
*/
select * from customers;
select * from orders;
select * from orderdetails;
select customers.customername, customers.city, 
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as "Total Sales"
from customers
inner join orders
on customers.customerid = orders.customerid
inner join orderdetails
on orders.orderid = orderdetails.orderid
where customers.city = "London"
group by orders.customerid;


-- QUESTION 6
/*Customers with Multiple Orders on the Same Date:
   - Write a query to find customers who have placed more than one order on the same date.
*/
select * from customers;
select * from orders;
select customers.customername, customers.customerid, orders.orderdate,
count(orders.orderid) as "No Of Orders"
from customers
inner join orders
on customers.customerid = orders.customerid
group by customers.customerid,
orders.orderdate
having count(orders.orderid) > 1;
-- NOTE: WHERE filters individual rows before they are grouped, while
-- HAVING filters after the maths has been done so where clause wouldn't have worked except you used a CTE


-- QUESTION 7
/*. Average Discount per Product:
   - Calculate the average discount given per product across all orders. Round to 2 decimal places.
*/
select * from products;
select * from orderdetails;
select products.ProductId, products.ProductName, 
round(avg(orderdetails.discount), 2) as AvgDiscount from orderdetails
inner join products
on orderdetails.productid = products.productid
group by productid;


-- QUESTION 8
/*Products Ordered by Each Customer:
   - For each customer, list the products they have ordered along with the total quantity of each product ordered.
*/
select * from customers;
select * from orderdetails;
select * from products;
select c.CustomerId, c.CustomerName, p.ProductName, sum(o.Quantity) as TotalQuantity
from customers c
inner join orders 
on c.customerid = orders.customerid
inner join orderdetails o
on orders.orderid = o.orderid
inner join products p
on o.productid = p.productid
group by c.customerid, p.productid,
p.productname, c.customername;


-- QUESTION 9
/*Employee Sales Ranking:
   - Rank employees based on their total sales. Show the employeename, total sales, and their rank.
*/
select * from employees;
select * from orders;
select * from orderdetails;
select employees.EmployeeId,
concat(employees.firstname, " ", employees.lastname) as Employeename,
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as TotalSales,
rank() over(order by 
sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)) 
desc) as TotalRank
from employees
inner join orders 
on employees.employeeid = orders.employeeid
inner join orderdetails
on orderdetails.orderid = orders.orderid
group by employees.employeeid;


-- QUESTION 10
/*Sales by Country and Category:
    - Write a query to display the total sales amount for each product category, grouped by country.
*/
select * from customers;
select * from orderdetails;
select * from categories;
select * from products;
select * from orders;
select customers.Country,
round(sum(orderdetails.quantity * orderdetails.unitprice * (1 - orderdetails.discount)), 4)
as TotalSales,
categories.CategoryName, categories.CategoryId
from categories
inner join products
on categories.categoryid = products.categoryid
inner join orderdetails
on products.productid = orderdetails.productid
inner join orders
on orderdetails.orderid = orders.orderid
inner join customers
on orders.customerid = customers.customerid
group by customers.country, categories.categoryname, categories.categoryid
order by customers.country,
categories.categoryname,
categories.categoryid;


-- QUESTION 11
/*Year-over-Year Sales Growth:
    - Calculate the percentage growth in sales from one year to the next for each product.
*/
select * from products;
select * from orderdetails;
select * from orders;
select 
    p.ProductId, 
    p.ProductName,
    round(sum(case when year(o.OrderDate) = 1996 
    then d.Quantity * d.UnitPrice * (1 - d.Discount) else 0 end), 2) as Sales_1996,
    round(sum(case when year(o.OrderDate) = 1997 
    then d.Quantity * d.UnitPrice * (1 - d.Discount) else 0 end), 2) as Sales_1997,

    round(
        (sum(case when year(o.OrderDate) = 1997 
        then d.Quantity * d.UnitPrice * (1 - d.Discount) else 0 end) - 
         sum(case when year(o.OrderDate) = 1996 
         then d.Quantity * d.UnitPrice * (1 - d.Discount) else 0 end)) * 100/
        nullif(sum(case when year(o.OrderDate) = 1996 
        then d.Quantity * d.UnitPrice * (1 - d.Discount) else 0 end), 0), 2) 
	as Percentage_Growth
    
from products p
inner join orderdetails d
on p.productid = d.productid
inner join orders o
on d.orderid = o.orderid
group by p.ProductId, p.ProductName;


-- QUESTION 12
/*Order Quantity Percentile:
    - Calculate the percentile rank of each order based on the total quantity of products in the order. 
*/
select * from orderdetails;
select OrderId, sum(quantity) TotalQuantity,
	   round(percent_rank() over(order by sum(quantity) asc), 4) PercentileRank
from orderdetails
group by orderid;



-- QUESTION 13
/*Products Never Reordered:
    - Identify products that have been sold but have never been reordered (ordered only once). 
*/
select * from orderdetails;
select * from products;
select p.ProductId, p.ProductName, 
count(o.productid) = 1 as NoOfOrders
from orderdetails o
inner join products p 
on o.productid = p.productid
group by p.productid, p.productname
order by NoOfOrders desc;
-- ProductId 9 ordered once
-- ProductId 45 ordered once
-- ProductId 48 ordered once
-- ProductId 67 ordered once


-- QUESTION 14
/*Most Valuable Product by Revenue:
    - Write a query to find the product that has generated the most revenue in each category.
*/
select * from products;
select * from orderdetails;
select * from categories;
select c.categoryid, c.categoryname, p.productid, p.productname, 
round(sum(o.quantity * o.unitprice * (1 - o.discount)), 4)
as TopRevenue
from orderdetails o
inner join products p
on o.productid = p.productid
inner join categories c
on p.categoryid = c.categoryid
group by c.categoryname, c.categoryid, p.productname, p.productid
order by c.categoryid, toprevenue desc;


-- QUESTION 15
/*. Complex Order Details:
    - Identify orders where the total price of all items exceeds $100 and contains at least one product with a discount of 5% or more.
*/
select * from orderdetails;
select OrderId, round(sum(UnitPrice*Quantity*(1 - discount)), 2) TotalPrice
from orderdetails
group by OrderId
having sum(UnitPrice*Quantity*(1 - discount)) > 100
and max(Discount) >= 0.05
order by OrderId, TotalPrice;

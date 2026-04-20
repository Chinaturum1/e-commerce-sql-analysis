# E-Commerce Data Analysis — SQL Project

**Author:** Okonkwo Uchechukwu Faith  
**Dataset:** E-Commerce Database (Northwind-style)  
**Project Type:** SQL Data Analysis  
**Date:** April 2026

---

## 📌 Project Overview

This project involves querying and analyzing an e-commerce relational database using SQL. The database contains transactional records of a retail business, including information on employees, customers, orders, products, and product categories — covering sales activity across multiple countries in 1996 and 1997.

The goal was to answer **15 business-driven questions** that explore sales performance, customer behavior, employee productivity, discount patterns, and product trends. All queries were written and executed in SQL, with results documented in a formal analysis report.

---

## Repository Contents

```
├── queries/
│   ├── 01_total_sales_by_employee.sql
│   ├── 02_top_5_customers_by_sales.sql
│   ├── 03_monthly_sales_trend_1997.sql
│   ├── 04_order_fulfilment_time.sql
│   ├── 05_london_customers_sales.sql
│   ├── 06_customers_multiple_orders_same_date.sql
│   ├── 07_average_discount_per_product.sql
│   ├── 08_products_ordered_by_customer.sql
│   ├── 09_employee_sales_ranking.sql
│   ├── 10_sales_by_country_and_category.sql
│   ├── 11_year_over_year_sales_growth.sql
│   ├── 12_order_quantity_percentile.sql
│   ├── 13_products_never_reordered.sql
│   ├── 14_most_valuable_product_by_category.sql
│   └── 15_complex_order_details.sql
├── report/
│   └── E-COMMERCE_REPORT-Chinaturum.docx
└── README.md
```

---

## ❓ The 15 Analysis Questions

| # | Question |
|---|----------|
| 1 | Calculate the total sales (in dollars) made by each employee, considering quantity and unit price |
| 2 | Identify the top 5 customers who have generated the most revenue |
| 3 | Display the total sales amount for each month in the year 1997 |
| 4 | Calculate the average order fulfilment time per employee (3 days for 1997 orders, 5 days for 1996) |
| 5 | List the customers operating in London and total sales for each |
| 6 | Find customers who have placed more than one order on the same date |
| 7 | Calculate the average discount given per product across all orders (rounded to 2 decimal places) |
| 8 | For each customer, list the products they ordered along with the total quantity |
| 9 | Rank employees based on their total sales |
| 10 | Display the total sales amount for each product category, grouped by country |
| 11 | Calculate the percentage growth in sales from 1996 to 1997 for each product |
| 12 | Calculate the percentile rank of each order based on total quantity of products |
| 13 | Identify products that have been sold but never reordered (ordered only once) |
| 14 | Find the product that has generated the most revenue in each category |
| 15 | Identify orders where total price exceeds $100 and includes at least one item with a 5%+ discount |

---

## 🔍 Key Findings

- **Top Employee:** Margaret Peacock led all employees with **$9,164.997** in total sales — nearly double the second-place finisher.
- **Top Customer:** Ernst Handel was the highest-spending customer at **$3,476.62** in total revenue.
- **Sales Trend:** January 1997 recorded the highest monthly sales at **$5,925.20**, with a notable dip in February to $2,007.64.
- **Fulfilment Times:** All employees processed orders within **3.0 to 3.84 days** on average, indicating a consistent shipping workflow.
- **Year-over-Year Growth:** Most products declined in sales from 1996 to 1997. However, **Queso Manchego La Pastora** grew by **+414.27%** and **Aniseed Syrup** by **+230.17%**.
- **Never-Reordered Products:** Four products were identified — *Mishi Kobe Niku*, *Chocolade*, *Røgede sild*, and *Laughing Lumberjack Lager*.
- **Discount Patterns:** A significant number of high-value orders (over $100) also contained discounted items, suggesting discounts are commonly applied to large purchases.
- **London Customers:** Seven Seas Imports was the top-performing London-based customer at **$1,010.62**.

---

## Tools Used

- **SQL** — core querying language used for all 15 analyses
- **Microsoft SQL Server / SSMS** — query execution environment
- **Microsoft Word** — formal report documentation

---

## SQL Concepts Applied

- `JOIN` (INNER)
- Aggregate functions (`SUM`, `AVG`, `COUNT`)
- `GROUP BY` and `ORDER BY`
- `HAVING` clause
- Window functions (`RANK()`, `PERCENT_RANK()`)
- Conditional logic (`CASE WHEN`)
- Date functions (`YEAR()`, `MONTH()`, `DATENAME()`)

---

## 📄 Report

The full written analysis is available in the `report/` folder. It includes the query questions, result screenshots, interpretations for each finding, and a conclusion with business recommendations.


---

## Contact

Feel free to connect or reach out for questions about this project.

**Okonkwo Uchechukwu Faith**  
SQL Data Analysis | April 2026

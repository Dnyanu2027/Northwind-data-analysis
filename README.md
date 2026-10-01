# SQL Aggregation Basics

Ten SQL queries practicing COUNT, SUM, AVG, MIN, and MAX — half on the whole table, half combined with GROUP BY — on a Northwind-style dataset, with cleaned data and a PDF report of results.

**Objective:** learn aggregate functions. **Tools:** MySQL, PostgreSQL.

## Repository contents

| Path | What it is |
|---|---|
| `data/` | 7 cleaned CSV files (Categories, Customers, Products, Suppliers, Shippers, Orders, OrderDetails) |
| `sql/schema.sql` | `CREATE TABLE` statements |
| `sql/queries.sql` | The 10 queries |
| `reports/SQL_Aggregation_Report.pdf` | Report with every query and its output |

## Queries covered

1. Total number of products (`COUNT`)
2. Products per category (`COUNT` + `GROUP BY`)
3. Total quantity ordered, all order lines (`SUM`)
4. Total quantity ordered per order (`SUM` + `GROUP BY`)
5. Average price of all products (`AVG`)
6. Average price per category (`AVG` + `GROUP BY`)
7. Cheapest and priciest product overall (`MIN`, `MAX`)
8. Price range per category (`MIN`, `MAX` + `GROUP BY`)
9. Number of orders per customer (`COUNT` + `GROUP BY`)
10. Suppliers with more than 2 products (`COUNT`, `AVG` + `HAVING`)

## How to run

1. Create a database and run `sql/schema.sql`.
2. Import each file in `data/` into the table of the same name.
   - **MySQL Workbench:** right-click the schema, then *Table Data Import Wizard*.
3. Run the queries in `sql/queries.sql`.

## What I noticed testing each function

- `COUNT(*)` counts every row in the group, including rows with NULLs elsewhere; `COUNT(column)` skips NULLs in that column.
- `SUM` and `AVG` only work on numeric columns and ignore NULLs automatically — a NULL is left out of the total and the divisor, not treated as zero.
- `GROUP BY` must include every non-aggregated column in the SELECT list (PostgreSQL enforces this; MySQL is more lenient).
- `HAVING` filters groups after aggregation, while `WHERE` filters rows before aggregation — used in query 10 to keep only suppliers with more than 2 products.

## Data notes

- 18 of 21 orders use a `CustomerID` that is not in `Customers`.
- 17 of 26 order lines use a `ProductID` that is not in `Products`.

These queries aggregate within single tables, so they're unaffected, but a JOIN across these tables would drop many rows.

## Interview questions

- **Why use GROUP BY?** It splits rows into groups sharing the same value in one or more columns, so an aggregate function is calculated per group instead of across the whole table.
- **How does AVG handle nulls?** It ignores NULLs completely — they're excluded from both the sum and the count used to calculate the average.

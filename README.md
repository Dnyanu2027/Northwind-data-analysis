# SQL Joins Practice

Ten SQL queries practicing INNER JOIN, LEFT JOIN, and multi-table joins on a Northwind-style dataset, with cleaned data and a PDF report that documents how a real data-quality gap affects join results.

**Objective:** combine tables with JOINs and understand INNER vs LEFT JOIN. **Tools:** MySQL, PostgreSQL.

## Repository contents

| Path | What it is |
|---|---|
| `data/` | 7 cleaned CSV files (Categories, Customers, Products, Suppliers, Shippers, Orders, OrderDetails) |
| `sql/schema.sql` | `CREATE TABLE` statements (no foreign keys — see below) |
| `sql/queries.sql` | The 10 queries |
| `reports/SQL_Joins_Report.pdf` | Report with every query, its output, and row-count notes |

## Queries covered

1. Orders with customer name (`INNER JOIN`)
2. Products with category name (`INNER JOIN`)
3. Products with supplier name (`INNER JOIN`)
4. Order lines with product names (`INNER JOIN`)
5. Orders with shipper name (`INNER JOIN`)
6. Every customer, with orders if any (`LEFT JOIN`)
7. Customers with no matching orders (`LEFT JOIN` + `IS NULL`)
8. Every product, with order quantities if ordered (`LEFT JOIN`)
9. Order lines with customer and product names (3-table `JOIN`)
10. Total revenue per product (`JOIN` + `GROUP BY`)

## How to run

1. Create a database and run `sql/schema.sql`.
2. Import each file in `data/` into the table of the same name.
   - **MySQL Workbench:** right-click the schema, then *Table Data Import Wizard*.
3. Run the queries in `sql/queries.sql`.

## Data quality finding

Table row counts: Customers 23, Orders 21, Products 25, OrderDetails 26.

Checking the foreign keys: **only 3 of 21 orders** have a `CustomerID` that matches a row in Customers, and **only 9 of 26 order lines** have a `ProductID` that matches a row in Products. This means:

- Query 1 (Orders ⋈ Customers) keeps only 3 of 21 orders.
- Query 4 (OrderDetails ⋈ Products) keeps only 9 of 26 order lines.
- Query 7 shows 20 of 23 customers as "no orders" — mostly a side effect of the ID mismatch, not necessarily true zero-order customers.
- Query 9, which chains three INNER JOINs, keeps only 1 row, since it needs every join in the chain to find a match.

No foreign keys are declared in `schema.sql` because of this gap. The PDF report flags every affected query with a note explaining the row count.

## What I noticed testing each join type

- `INNER JOIN` drops unmatched rows silently — no error, so checking row counts before/after a join matters.
- `LEFT JOIN` keeps every row from the left table, filling unmatched right-table columns with NULL.
- `WHERE right_table.column IS NULL` after a `LEFT JOIN` is the standard way to find unmatched rows.
- Chaining INNER JOINs multiplies the mismatch problem — every join in the chain must find a match for a row to survive.

## Interview questions

- **INNER JOIN vs LEFT JOIN?** INNER JOIN returns only rows with a match in both tables. LEFT JOIN returns every row from the left table, with NULLs filling the right table's columns where there's no match.
- **Why use IS NULL after a LEFT JOIN?** Unmatched left-table rows get NULL in every right-table column after a LEFT JOIN, so filtering on `IS NULL` isolates exactly those unmatched rows.

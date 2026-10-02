# SQL Subqueries & Window Functions

Twenty SQL queries — 10 subqueries and 10 window functions — on a Northwind-style dataset, with cleaned data and a PDF report of every output.

**Objective:** practice correlated/non-correlated subqueries, derived tables, and window functions (RANK, ROW_NUMBER, DENSE_RANK, LAG, LEAD, NTILE, running totals). **Tools:** MySQL, PostgreSQL.

## Repository contents

| Path | What it is |
|---|---|
| `data/` | 7 cleaned CSV files (Categories, Customers, Products, Suppliers, Shippers, Orders, OrderDetails) |
| `sql/schema.sql` | `CREATE TABLE` statements |
| `sql/queries.sql` | All 20 queries |
| `reports/SQL_Subqueries_Windows_Report.pdf` | Report with every query, its SQL, and its real output |

## Part 1 — Subqueries (1–10)

1. Products priced above the overall average (scalar subquery)
2. Products priced above their own category's average (correlated subquery)
3. Most expensive product in each category (correlated subquery)
4. Categories whose average price beats the overall average
5. Suppliers who supply more products than the average supplier
6. Products never appearing in an order line (`NOT IN`)
7. Products appearing in at least one order line (`IN`)
8. Customers who placed more orders than average (returns 0 rows — see Data notes)
9. Second most expensive product (nested `MAX`)
10. Orders whose total quantity beats the average order (subquery in `FROM`, a derived table)

## Part 2 — Window Functions (11–20)

11. Rank all products by price (`RANK`)
12. Rank products within each category (`ROW_NUMBER` + `PARTITION BY`)
13. Dense-rank categories by product count (`DENSE_RANK`)
14. Running total of quantity across order lines (`SUM() OVER`, ordered)
15. Each product's price next to its category average (`AVG() OVER`, `PARTITION BY`)
16. Each product vs. the next cheaper product (`LAG`)
17. Each product vs. the next pricier product (`LEAD`)
18. Products split into 4 price quartiles (`NTILE`)
19. Total quantity per order shown on every line, with each line's share (`SUM() OVER PARTITION BY`)
20. Cheapest/priciest product name per category, shown on every row (`FIRST_VALUE`)

## How to run

1. Create a database and run `sql/schema.sql`.
2. Import each file in `data/` into the table of the same name.
   - **MySQL Workbench:** right-click the schema, then *Table Data Import Wizard*.
3. Run the queries in `sql/queries.sql`.

## What I noticed

**Subqueries**
- A *correlated* subquery (queries 2, 3) re-evaluates once per outer row, referencing a column from the outer query; a plain subquery runs once.
- A subquery in `FROM` (query 10) is a derived table — it must be aliased and can be filtered, grouped or joined like a real table.
- `NOT IN` with a subquery (query 6) silently returns zero rows if the subquery can produce a NULL — worth checking for NULLs before relying on it.

**Window functions**
- Unlike `GROUP BY`, a window function keeps every row — `PARTITION BY` groups the calculation without collapsing rows.
- `RANK()` leaves gaps after ties (1, 2, 2, 4); `DENSE_RANK()` doesn't (1, 2, 2, 3); `ROW_NUMBER()` never ties.
- `LAG`/`LEAD` look at a neighboring row without a self-join.
- `FIRST_VALUE` needs its own `ORDER BY` inside the window — it doesn't reuse the outer query's `ORDER BY`.

## Data notes

Query 8 returns 0 rows: all 21 orders in this dataset belong to 21 different customers, so no customer has more than one order and none is "above average." This is a correct result, not an error.

As in earlier projects: 18 of 21 orders reference a `CustomerID` not in Customers, and 17 of 26 order lines reference a `ProductID` not in Products. Queries here mostly work within single tables or compare a table to its own aggregate, so this affects fewer queries than in the joins project — but it's why no foreign keys are declared in `schema.sql`.

## Interview questions

- **What is a subquery?** A query nested inside another, used to supply a value, a list of values, or a derived table the outer query filters, joins against, or selects from.
- **Subquery vs JOIN — when to use which?** A JOIN combines columns from two tables into one row and is usually clearer when you need data from both tables in the output. A subquery fits better when you only need to filter or compare against a value from another table, without pulling its columns into the result.
- **What is a window function?** A calculation across a set of related rows (a "window," defined with `OVER()`) that returns a value for every row, instead of collapsing rows into one summary row the way `GROUP BY` does.
- **RANK vs DENSE_RANK vs ROW_NUMBER?** `RANK` skips numbers after a tie, `DENSE_RANK` doesn't, and `ROW_NUMBER` assigns a unique number to every row regardless of ties.

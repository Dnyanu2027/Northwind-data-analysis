# SQL Practice: Basic SELECT & Filtering

Beginner SQL exercises on a Northwind-style dataset: 10 SELECT/ORDER BY queries plus 12 filtering queries (WHERE, IN, BETWEEN, LIKE), with cleaned data and PDF reports for each.

**Objective:** build SQL fundamentals and practice common filters. **Tools:** MySQL, PostgreSQL.

## Repository contents

| Path | What it is |
|---|---|
| `data/` | 7 cleaned CSV files (Categories, Customers, Products, Suppliers, Shippers, Orders, OrderDetails) |
| `sql/schema.sql` | `CREATE TABLE` statements |
| `sql/queries.sql` | 10 queries: SELECT, WHERE, ORDER BY |
| `sql/filtering_queries.sql` | 12 queries: WHERE, IN, BETWEEN, LIKE |
| `reports/SQL_Project_Report.pdf` | Report for the 10 SELECT/ORDER BY queries, with cleaning summary and outputs |
| `reports/SQL_Filtering_Report.pdf` | Report for the 12 filtering queries, with outputs |

## Project 1 — Basic SQL SELECT

1. List all categories
2. Customers from Germany (`WHERE`)
3. Products priced above 20 (`WHERE` with comparison)
4. Products by price, high to low (`ORDER BY DESC`)
5. US suppliers sorted by city (`WHERE` + `ORDER BY`)
6. Condiments under 20 (`AND`)
7. Customers starting with 'A' (`LIKE`)
8. First five shippers by name
9. Orders between 10 and 20 July 2022 (`BETWEEN`)
10. Five largest order lines (`ORDER BY` + `LIMIT`)

## Project 2 — SQL Filtering Practice

1. Products priced between 15 and 30 (`BETWEEN`)
2. Customers from Germany, France or Mexico (`IN`)
3. Products outside two category IDs (`NOT IN`)
4. Customer names ending in 's' (`LIKE`)
5. Product names containing "Cha" (`LIKE`, wildcard both sides)
6. Suppliers not from the USA (`<>`)
7. Orders from two chosen shippers (`IN`)
8. Orders in a date range (`BETWEEN` on dates)
9. Order lines with quantity 5–10 (`BETWEEN`)
10. Products priced under 10 or over 50 (`OR`)
11. Customer cities starting with 'M' (`LIKE`)
12. Categories by a chosen ID list (`IN`)

## How to run

1. Create a database and run `sql/schema.sql`.
2. Import each file in `data/` into the table of the same name.
   - **MySQL Workbench:** right-click the schema, then *Table Data Import Wizard*.
3. Run the queries in `sql/queries.sql` and `sql/filtering_queries.sql`.

## Data cleaning

Raw files had unquoted commas inside values, stray extra columns and trailing spaces. All were fixed; the files are UTF-8 with quoted text fields. Postal codes and phone numbers are kept as text to preserve leading zeros and formatting. Details are in the PDF report.

## Data notes

- 18 of 21 orders use a `CustomerID` that is not in `Customers`.
- 17 of 26 order lines use a `ProductID` that is not in `Products`.

The 10 queries each read one table, so they are unaffected, but joins across these tables will drop many rows. That is why no foreign keys are defined.

## Interview questions

- **What does SELECT do?** Retrieves data from one or more tables, chosen columns or all with `*`.
- **What does ORDER BY do?** Sorts results by one or more columns, ascending (default) or descending.
- **LIKE vs =?** `=` matches a value exactly. `LIKE` matches a pattern using wildcards (`%` for any characters, `_` for a single character), so it's used for partial or fuzzy text matches, not exact ones.
- **When to use BETWEEN?** For a continuous range — price, date or quantity — instead of writing `column >= low AND column <= high`. It's inclusive of both endpoints.

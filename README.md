# Uber Net Profit Analysis using SQL

## Project Overview

This project analyzes Uber/taxi driving data using PostgreSQL.

The goal is to calculate gross earnings, net profit, fuel costs, trip performance, platform performance, shift profitability, and monthly earning trends.

## Tools Used

- PostgreSQL
- SQL
- GitHub

## Dataset

The dataset contains Uber/taxi work records, including:

- work date
- platform
- city
- shift
- hours worked
- trips completed
- kilometers driven
- gross earnings
- tips
- fuel costs
- parking/tolls
- commission fees

## Business Questions Answered

1. Calculate total gross earnings.
2. Calculate total net earnings.
3. Calculate total fuel cost.
4. Count total trips completed.
5. Calculate average net earnings per hour.
6. Calculate average net earnings per kilometer.
7. Find the best earning day by net earnings.
8. Find the worst earning day by net earnings.
9. Retrieve total net earnings by platform.
10. Retrieve total net earnings by shift.
11. Count total trips by day of week.
12. Calculate fuel cost percentage of gross earnings.
13. Show the top 5 most profitable days.
14. Calculate average trip value by platform.
15. Show monthly net profit trend.

## SQL Skills Demonstrated

- Creating tables
- Importing CSV data
- Aggregation using SUM, AVG, and COUNT
- GROUP BY analysis
- ORDER BY and LIMIT
- Date functions using DATE_TRUNC and EXTRACT
- Arithmetic calculations for net profit and KPIs
- Business-focused SQL analysis

## Key Insights

- Net profit gives a more realistic view than gross earnings.
- Fuel cost, parking/tolls, and commission fees reduce actual income.
- Earnings per hour and earnings per kilometer are better performance indicators than gross income alone.
- Monthly trend analysis helps identify whether earning performance is improving or declining.
- Platform and shift analysis can help identify better working patterns.

## Files

- `uber_project.sql` - SQL table setup, CSV import instruction, and analysis queries
- `uber_taxi_earnings.csv` - Dataset used for the analysis
- `README.md` - Project explanation and summary

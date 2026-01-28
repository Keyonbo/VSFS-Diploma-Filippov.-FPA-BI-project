# FPABI dbt demo project (seeds-only)

This project is designed to be tested purely on CSV seeds.
It builds a minimal CFO pack:
- Weekly P&L
- Weekly PVM (NUP-based)
- 13-week cash inflow forecast (trend + seasonality)

## Snowflake bootstrap (one-time)
1) Log in to Snowsight as ACCOUNTADMIN (your admin user).
2) Go to: Worksheets -> + Worksheet
3) Paste and run: setup/bootstrap.sql

Demo credentials created by bootstrap.sql:
- DBT_USER / lKx^4j^B#P&fYs!aQ(%Y
- PBI_USER / +SCH9XNem_uppgsf6Kk1

## Configure dbt profile
Copy profiles_example.yml to your dbt profiles path:
- Windows: C:\Users\<you>\.dbt\profiles.yml
- Mac/Linux: ~/.dbt/profiles.yml

## Test dbt connection (before seeding)
From the project root:
    dbt debug

Expected: Connection test OK.

## Run the pipeline
    dbt deps
    dbt seed
    dbt run
    dbt test

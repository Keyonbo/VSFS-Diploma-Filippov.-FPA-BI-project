
  
    

        create or replace transient table FPABI.DBT_MART.mart_finance__pnl_monthly
         as
        (

-- Monthly P&L in long format for Power BI.
-- Columns: value, account, month, year (month_start is technical).

with base as (
    select
        date_trunc('month', posting_date) as month_start,
        account_id,
        sum(amount) as value
    from FPABI.DBT_STG.stg_nav_gl_entry
    group by 1, 2
)

select
    value,
    account_id as account,
    month(month_start) as month,
    year(month_start) as year,
    month_start
from base
        );
      
  
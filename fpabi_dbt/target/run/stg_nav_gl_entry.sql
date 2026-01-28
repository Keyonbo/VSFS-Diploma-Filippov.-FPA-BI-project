
  create or replace   view FPABI.DBT_STG.stg_nav_gl_entry
  
   as (
    

-- Staging model for NAV general ledger entries (seeded CSV in this demo).
with src as (
  select * from FPABI.DBT_RAW.f_gl_entry
)
select
  gl_entry_id,
  to_date(to_varchar(date_key), 'YYYYMMDD') as posting_date,
  date_key,
  entity_id,
  account_id,
  nullif(cost_center_id, 0)::number as cost_center_id,
  amount::number(18,2) as amount,
  currency
from src
  );


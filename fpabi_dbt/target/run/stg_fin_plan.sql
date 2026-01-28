
  create or replace   view FPABI.DBT_STG.stg_fin_plan
  
   as (
    

-- Staging model for plan/forecast lines (seeded CSV in this demo).
with src as (
  select * from FPABI.DBT_RAW.f_plan
)
select
  plan_line_id,
  version,
  to_date(to_varchar(month_key), 'YYYYMMDD') as plan_month,
  month_key,
  entity_id,
  cost_center_id,
  account_id,
  amount::number(18,2) as amount
from src
  );


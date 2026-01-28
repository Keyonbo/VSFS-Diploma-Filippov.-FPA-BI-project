
  create or replace   view FPABI.DBT_STG.stg_fin_access
  
   as (
    

-- Staging model for Power BI RLS mapping (seeded CSV in this demo).
select
  lower(user_upn) as user_upn,
  role,
  allowed_region_id::number as allowed_region_id,
  allowed_cost_center_id::number as allowed_cost_center_id
from FPABI.DBT_RAW.t_access
  );


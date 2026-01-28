
  
    

        create or replace transient table FPABI.DBT_CORE.dim_date
         as
        (

-- Conformed date dimension.
select
  date_key,
  to_date(to_varchar(date_key), 'YYYYMMDD') as date,
  year, quarter, month, month_name,
  week_iso,
  day_of_week,
  is_month_end,
  is_week_end
from FPABI.DBT_RAW.dim_date
        );
      
  
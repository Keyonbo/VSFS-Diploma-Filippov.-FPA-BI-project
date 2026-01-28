
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select week_start
from FPABI.DBT_MART.mart_finance__cash_inflow_13w
where week_start is null



  
  
      
    ) dbt_internal_test
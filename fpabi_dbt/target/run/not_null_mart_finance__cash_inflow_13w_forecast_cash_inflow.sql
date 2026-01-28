
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select forecast_cash_inflow
from FPABI.DBT_MART.mart_finance__cash_inflow_13w
where forecast_cash_inflow is null



  
  
      
    ) dbt_internal_test
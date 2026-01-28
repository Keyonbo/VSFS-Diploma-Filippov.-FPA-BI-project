
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select entity_id
from FPABI.DBT_MART.mart_finance__pnl_weekly
where entity_id is null



  
  
      
    ) dbt_internal_test
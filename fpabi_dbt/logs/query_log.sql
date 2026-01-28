-- created_at: 2026-01-28T13:15:58.250858300+00:00
-- finished_at: 2026-01-28T13:15:58.433184300+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_mart_finance__pnl_weekly_entity_id.1d6c8fa74f
-- query_id: 01c208bb-0205-f85b-0000-0004803a253d
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select entity_id
from FPABI.DBT_MART.mart_finance__pnl_weekly
where entity_id is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_mart_finance__pnl_weekly_entity_id.1d6c8fa74f"} */;
-- created_at: 2026-01-28T13:15:58.906002400+00:00
-- finished_at: 2026-01-28T13:15:58.994161600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_mart_finance__cash_inflow_13w_week_start.39753b3742
-- query_id: 01c208bb-0205-f9bd-0000-0004803a6485
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select week_start
from FPABI.DBT_MART.mart_finance__cash_inflow_13w
where week_start is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_mart_finance__cash_inflow_13w_week_start.39753b3742"} */;
-- created_at: 2026-01-28T13:15:59.598838900+00:00
-- finished_at: 2026-01-28T13:15:59.941462800+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_fct_reservation_product_id.f512c52487
-- query_id: 01c208bb-0205-f970-0000-0004803a7425
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from FPABI.DBT_CORE.fct_reservation
where product_id is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_fct_reservation_product_id.f512c52487"} */;
-- created_at: 2026-01-28T13:16:00.018535200+00:00
-- finished_at: 2026-01-28T13:16:00.206112100+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_fct_reservation_reservation_id.d3858ac653
-- query_id: 01c208bc-0205-f9bd-0000-0004803a6489
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select reservation_id
from FPABI.DBT_CORE.fct_reservation
where reservation_id is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_fct_reservation_reservation_id.d3858ac653"} */;
-- created_at: 2026-01-28T13:16:00.195483500+00:00
-- finished_at: 2026-01-28T13:16:00.467441600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_mart_finance__pnl_weekly_week_start.1a4356b5e4
-- query_id: 01c208bc-0205-f970-0000-0004803a7429
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select week_start
from FPABI.DBT_MART.mart_finance__pnl_weekly
where week_start is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_mart_finance__pnl_weekly_week_start.1a4356b5e4"} */;
-- created_at: 2026-01-28T13:16:00.461701900+00:00
-- finished_at: 2026-01-28T13:16:00.891279300+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.not_null_mart_finance__cash_inflow_13w_forecast_cash_inflow.a82ac8687e
-- query_id: 01c208bc-0205-f9bd-0000-0004803a648d
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select forecast_cash_inflow
from FPABI.DBT_MART.mart_finance__cash_inflow_13w
where forecast_cash_inflow is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.not_null_mart_finance__cash_inflow_13w_forecast_cash_inflow.a82ac8687e"} */;
-- created_at: 2026-01-28T13:16:00.972500600+00:00
-- finished_at: 2026-01-28T13:16:01.092232700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.unique_fct_reservation_reservation_id.78c1cf2edf
-- query_id: 01c208bc-0205-f85b-0000-0004803a2541
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    reservation_id as unique_field,
    count(*) as n_records

from FPABI.DBT_CORE.fct_reservation
where reservation_id is not null
group by reservation_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.unique_fct_reservation_reservation_id.78c1cf2edf"} */;
-- created_at: 2026-01-28T13:16:01.212121100+00:00
-- finished_at: 2026-01-28T13:16:02.221482700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: test.fpabi.relationships_fct_reservation_3410d5884006139a52dc87bcdbadc931.47950aceec
-- query_id: 01c208bc-0205-f970-0000-0004803a742d
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select product_id as from_field
    from FPABI.DBT_CORE.fct_reservation
    where product_id is not null
),

parent as (
    select product_id as to_field
    from FPABI.DBT_CORE.dim_product_core
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"test.fpabi.relationships_fct_reservation_3410d5884006139a52dc87bcdbadc931.47950aceec"} */;

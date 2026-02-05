-- created_at: 2026-02-05T12:55:54.925537800+00:00
-- finished_at: 2026-02-05T12:55:55.130427100+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c235a7-0206-09ea-0004-803a0001c092
-- desc: execute adapter call
show terse schemas in database FPABI
    limit 10000
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","connection_name":""} */;
-- created_at: 2026-02-05T12:55:55.775988200+00:00
-- finished_at: 2026-02-05T12:55:56.019935200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pvm_monthly
-- query_id: 01c235a7-0206-0543-0004-803a0001f006
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_MART" LIMIT 10000;
-- created_at: 2026-02-05T12:55:56.027580200+00:00
-- finished_at: 2026-02-05T12:55:57.775388+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pvm_monthly
-- query_id: 01c235a7-0206-09ea-0004-803a0001c096
-- desc: execute adapter call
create or replace transient table FPABI.DBT_MART.mart_finance__pvm_monthly
         as
        (

-- Monthly PVM base metrics for Power BI.
-- Account values: Reservations, Revenue.

with monthly as (
    select
        date_trunc('month', reservation_date) as month_start,
        entity_id,
        product_id,
        sum(qty) as reservations_value,
        sum(revenue_amount) as revenue_value
    from FPABI.DBT_CORE.fct_reservation
    group by 1, 2, 3
),

unpvt as (
    select
        month_start,
        entity_id,
        product_id,
        'Reservations' as account,
        reservations_value as value
    from monthly

    union all

    select
        month_start,
        entity_id,
        product_id,
        'Revenue' as account,
        revenue_value as value
    from monthly
)

select
    value,
    account,
    month(month_start) as month,
    year(month_start) as year,
    product_id as product,
    entity_id as entity,
    month_start
from unpvt
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__pvm_monthly"} */;

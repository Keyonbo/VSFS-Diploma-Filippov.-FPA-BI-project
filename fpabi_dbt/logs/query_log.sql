-- created_at: 2026-01-28T15:24:26.808513400+00:00
-- finished_at: 2026-01-28T15:24:26.892643100+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c2093c-0205-f85b-0000-0004803a2925
-- desc: execute adapter call
show terse schemas in database FPABI
    limit 10000
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","connection_name":""} */;
-- created_at: 2026-01-28T15:24:27.122192800+00:00
-- finished_at: 2026-01-28T15:24:27.216313500+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_product_core
-- query_id: 01c2093c-0205-f85b-0000-0004803a2929
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_CORE" LIMIT 10000;
-- created_at: 2026-01-28T15:24:27.342204+00:00
-- finished_at: 2026-01-28T15:24:27.428703+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_access
-- query_id: 01c2093c-0205-f85b-0000-0004803a2931
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_STG" LIMIT 10000;
-- created_at: 2026-01-28T15:24:27.482422600+00:00
-- finished_at: 2026-01-28T15:24:27.609895600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_account_core
-- query_id: 01c2093c-0205-f9bd-0000-0004803a6895
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_CORE" LIMIT 10000;
-- created_at: 2026-01-28T15:24:27.432646100+00:00
-- finished_at: 2026-01-28T15:24:27.731247200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_access
-- query_id: 01c2093c-0205-f812-0000-0004803a398d
-- desc: execute adapter call
create or replace   view FPABI.DBT_STG.stg_fin_access
  
   as (
    

-- Staging model for Power BI RLS mapping (seeded CSV in this demo).
select
  lower(user_upn) as user_upn,
  role,
  allowed_region_id::number as allowed_region_id,
  allowed_cost_center_id::number as allowed_cost_center_id
from FPABI.DBT_RAW.t_access
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.stg_fin_access"} */;
-- created_at: 2026-01-28T15:24:27.221192400+00:00
-- finished_at: 2026-01-28T15:24:28.019003200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_product_core
-- query_id: 01c2093c-0205-f85b-0000-0004803a292d
-- desc: execute adapter call
create or replace transient table FPABI.DBT_CORE.dim_product_core
         as
        (

-- Conformed product dimension (SCD1 in this demo).
select
  product_id::number as product_id,
  product_code,
  product_name,
  product_category
from FPABI.DBT_RAW.dim_product
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.dim_product_core"} */;
-- created_at: 2026-01-28T15:24:27.890934300+00:00
-- finished_at: 2026-01-28T15:24:28.042656100+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_plan
-- query_id: 01c2093c-0205-f812-0000-0004803a3991
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_STG" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.101495700+00:00
-- finished_at: 2026-01-28T15:24:28.235094500+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_bank_txn
-- query_id: 01c2093c-0205-f812-0000-0004803a3995
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_STG" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.047208200+00:00
-- finished_at: 2026-01-28T15:24:28.235169200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_plan
-- query_id: 01c2093c-0205-f85b-0000-0004803a2939
-- desc: execute adapter call
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
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.stg_fin_plan"} */;
-- created_at: 2026-01-28T15:24:27.613929200+00:00
-- finished_at: 2026-01-28T15:24:28.314919200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_account_core
-- query_id: 01c2093c-0205-f85b-0000-0004803a2935
-- desc: execute adapter call
create or replace transient table FPABI.DBT_CORE.dim_account_core
         as
        (

-- Conformed account dimension (SCD1 in this demo).
select
  account_id::number as account_id,
  account_code,
  account_name,
  statement,
  account_group
from FPABI.DBT_RAW.dim_account
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.dim_account_core"} */;
-- created_at: 2026-01-28T15:24:28.307748800+00:00
-- finished_at: 2026-01-28T15:24:28.396948800+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_date
-- query_id: 01c2093c-0205-f9bd-0000-0004803a6899
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_CORE" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.239255800+00:00
-- finished_at: 2026-01-28T15:24:28.580479+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_fin_bank_txn
-- query_id: 01c2093c-0205-f812-0000-0004803a3999
-- desc: execute adapter call
create or replace   view FPABI.DBT_STG.stg_fin_bank_txn
  
   as (
    

-- Staging model for bank transactions (seeded CSV in this demo).
with src as (
  select * from FPABI.DBT_RAW.f_bank_txn
)
select
  bank_txn_id,
  to_date(to_varchar(date_key), 'YYYYMMDD') as txn_date,
  date_key,
  entity_id,
  txn_type,
  amount::number(18,2) as amount,
  currency
from src
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.stg_fin_bank_txn"} */;
-- created_at: 2026-01-28T15:24:28.496754700+00:00
-- finished_at: 2026-01-28T15:24:28.622218600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_res_sales_line
-- query_id: 01c2093c-0205-f9bd-0000-0004803a689d
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_STG" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.626981900+00:00
-- finished_at: 2026-01-28T15:24:28.807191700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_res_sales_line
-- query_id: 01c2093c-0205-f85b-0000-0004803a2941
-- desc: execute adapter call
create or replace   view FPABI.DBT_STG.stg_res_sales_line
  
   as (
    

-- Staging model for reservation system sales lines (seeded CSV in this demo).
with src as (
  select * from FPABI.DBT_RAW.f_sales_line
)
select
  sales_line_id,
  to_date(to_varchar(date_key), 'YYYYMMDD') as sold_date,
  date_key,
  entity_id,
  customer_id,
  product_id,
  channel_id,
  qty::number as qty,
  net_unit_price::number(18,2) as net_unit_price,
  net_amount::number(18,2) as revenue_amount,
  cogs_amount::number(18,2) as cogs_amount,
  currency
from src
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.stg_res_sales_line"} */;
-- created_at: 2026-01-28T15:24:28.740649+00:00
-- finished_at: 2026-01-28T15:24:28.819257400+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_nav_gl_entry
-- query_id: 01c2093c-0205-f9bd-0000-0004803a68a1
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_STG" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.912677600+00:00
-- finished_at: 2026-01-28T15:24:29.027232700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__cash_inflow_13w
-- query_id: 01c2093c-0205-f9bd-0000-0004803a68a9
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "FPABI"."DBT_MART" LIMIT 10000;
-- created_at: 2026-01-28T15:24:28.823509200+00:00
-- finished_at: 2026-01-28T15:24:29.060175100+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.stg_nav_gl_entry
-- query_id: 01c2093c-0205-f85b-0000-0004803a2945
-- desc: execute adapter call
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
  )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.stg_nav_gl_entry"} */;
-- created_at: 2026-01-28T15:24:28.401198200+00:00
-- finished_at: 2026-01-28T15:24:29.092758600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.dim_date
-- query_id: 01c2093c-0205-f85b-0000-0004803a293d
-- desc: execute adapter call
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
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.dim_date"} */;
-- created_at: 2026-01-28T15:24:28.811840300+00:00
-- finished_at: 2026-01-28T15:24:29.791947600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.fct_reservation
-- query_id: 01c2093c-0205-f9bd-0000-0004803a68a5
-- desc: execute adapter call
create or replace transient table FPABI.DBT_CORE.fct_reservation
         as
        (

-- Reservation-grain fact.
-- Demo assumption: we do not have a real reservation_id in seeds, so we use sales_line_id.
-- In production replace reservation_id with the booking/reservation identifier from the source system.
with s as (
  select * from FPABI.DBT_STG.stg_res_sales_line
)
select
  sales_line_id as reservation_id,
  sold_date as reservation_date,
  date_key,
  entity_id,
  customer_id,
  product_id,
  channel_id,
  qty,
  revenue_amount,
  cogs_amount,
  (revenue_amount - cogs_amount) as gross_margin_amount
from s
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.fct_reservation"} */;
-- created_at: 2026-01-28T15:24:29.063971100+00:00
-- finished_at: 2026-01-28T15:24:30.032698200+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pnl_weekly
-- query_id: 01c2093c-0205-f9bd-0000-0004803a68ad
-- desc: execute adapter call
create or replace transient table FPABI.DBT_MART.mart_finance__pnl_weekly
         as
        (

-- Standard weekly P&L based on GL.
with gl as (
  select
    date_trunc('week', posting_date) as week_start,
    entity_id,
    a.account_group,
    sum(amount) as amount
  from FPABI.DBT_STG.stg_nav_gl_entry g
  join FPABI.DBT_CORE.dim_account_core a on g.account_id = a.account_id
  where a.statement = 'P&L'
  group by 1,2,3
),
pnl as (
  select
    week_start,
    entity_id,
    sum(case when account_group='Revenue' then amount else 0 end) as revenue,
    sum(case when account_group='COGS' then amount else 0 end) as cogs,
    sum(case when account_group='OPEX' then amount else 0 end) as opex
  from gl
  group by 1,2
)
select
  week_start,
  entity_id,
  revenue,
  cogs,
  (revenue + cogs) as gross_profit,        -- COGS is negative in this demo GL
  opex,
  (revenue + cogs + opex) as ebitda_proxy  -- simplified EBITDA proxy
from pnl
order by week_start, entity_id
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__pnl_weekly"} */;
-- created_at: 2026-01-28T15:24:29.064404+00:00
-- finished_at: 2026-01-28T15:24:30.154698700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pnl_monthly
-- query_id: 01c2093c-0205-f812-0000-0004803a399d
-- desc: execute adapter call
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
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__pnl_monthly"} */;
-- created_at: 2026-01-28T15:24:29.795911100+00:00
-- finished_at: 2026-01-28T15:24:30.508867700+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pvm_monthly
-- query_id: 01c2093c-0205-f9bd-0000-0004803a68b1
-- desc: execute adapter call
create or replace transient table FPABI.DBT_MART.mart_finance__pvm_monthly
         as
        (

-- Monthly PVM base metrics for Power BI.
-- Account values: Reservations, Revenue.

with monthly as (
    select
        date_trunc('month', reservation_date) as month_start,
        product_id,
        sum(qty) as reservations_value,
        sum(revenue_amount) as revenue_value
    from FPABI.DBT_CORE.fct_reservation
    group by 1, 2
),

unpvt as (
    select
        month_start,
        product_id,
        'Reservations' as account,
        reservations_value as value
    from monthly

    union all

    select
        month_start,
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
    month_start
from unpvt
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__pvm_monthly"} */;
-- created_at: 2026-01-28T15:24:29.031412500+00:00
-- finished_at: 2026-01-28T15:24:30.517963800+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__cash_inflow_13w
-- query_id: 01c2093c-0205-f85b-0000-0004803a2949
-- desc: execute adapter call
create or replace transient table FPABI.DBT_MART.mart_finance__cash_inflow_13w
         as
        (

-- 13-week cash inflow forecast (weekly buckets), inflows only.
-- Forecast method:
--   1) Trend = 8-week moving average of historical inflows
--   2) Seasonality = week-of-year seasonal index
--   3) Forecast = Trend * SeasonalityIndex
with hist as (
  select
    date_trunc('week', txn_date) as week_start,
    entity_id,
    sum(case when txn_type='RECEIPT_AR' then amount else 0 end) as inflow
  from FPABI.DBT_STG.stg_fin_bank_txn
  group by 1,2
),
hist_woy as (
  select
    week_start,
    entity_id,
    inflow,
    weekofyear(week_start) as woy
  from hist
),
overall as (
  select
    entity_id,
    avg(inflow) as avg_inflow
  from hist_woy
  group by 1
),
season as (
  select
    entity_id,
    woy,
    avg(inflow) as avg_inflow_woy
  from hist_woy
  group by 1,2
),
season_index as (
  select
    s.entity_id,
    s.woy,
    iff(o.avg_inflow=0, 1.0, s.avg_inflow_woy / o.avg_inflow) as season_idx
  from season s
  join overall o on s.entity_id=o.entity_id
),
trend as (
  select
    entity_id,
    week_start,
    avg(inflow) over (partition by entity_id order by week_start rows between 8 preceding and 1 preceding) as ma8
  from hist_woy
),
future_weeks as (
  select
    dateadd(week, seq4(), date_trunc('week', current_date())) as week_start
  from table(generator(rowcount => 13))
),
entities as (
  select distinct entity_id from FPABI.DBT_RAW.dim_entity
),
scaffold as (
  select e.entity_id, f.week_start, weekofyear(f.week_start) as woy
  from entities e
  cross join future_weeks f
),
last_trend as (
  select
    entity_id,
    max_by(ma8, week_start) as last_ma8
  from trend
  group by 1
)
select
  s.week_start,
  s.entity_id,
  lt.last_ma8 as base_trend_inflow,
  coalesce(si.season_idx, 1.0) as season_idx,
  (lt.last_ma8 * coalesce(si.season_idx, 1.0)) as forecast_cash_inflow
from scaffold s
left join last_trend lt on s.entity_id=lt.entity_id
left join season_index si on s.entity_id=si.entity_id and s.woy=si.woy
order by week_start, entity_id
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__cash_inflow_13w"} */;
-- created_at: 2026-01-28T15:24:29.987767300+00:00
-- finished_at: 2026-01-28T15:24:30.897212600+00:00
-- outcome: success
-- dialect: snowflake
-- node_id: model.fpabi.mart_finance__pvm_weekly
-- query_id: 01c2093c-0205-f85b-0000-0004803a294d
-- desc: execute adapter call
create or replace transient table FPABI.DBT_MART.mart_finance__pvm_weekly
         as
        (

-- Weekly PVM decomposition using NUP (Net Unit Price) at product level.
-- Baseline is a 4-week rolling window (previous 4 weeks).
with base as (
  select
    date_trunc('week', reservation_date) as week_start,
    entity_id,
    product_id,
    sum(qty) as volume_qty,
    sum(revenue_amount) as revenue
  from FPABI.DBT_CORE.fct_reservation
  group by 1,2,3
),
with_nup as (
  select
    week_start,
    entity_id,
    product_id,
    volume_qty,
    revenue,
    iff(volume_qty=0, null, revenue/volume_qty) as nup
  from base
),
baseline as (
  select
    entity_id,
    product_id,
    week_start,
    avg(nup) over (partition by entity_id, product_id order by week_start rows between 4 preceding and 1 preceding) as nup_base,
    avg(volume_qty) over (partition by entity_id, product_id order by week_start rows between 4 preceding and 1 preceding) as vol_base
  from with_nup
),
joined as (
  select
    w.week_start,
    w.entity_id,
    w.product_id,
    w.volume_qty,
    w.revenue,
    w.nup,
    b.nup_base,
    b.vol_base
  from with_nup w
  left join baseline b
    on w.entity_id=b.entity_id and w.product_id=b.product_id and w.week_start=b.week_start
),
calc as (
  select
    week_start,
    entity_id,
    product_id,
    revenue,
    volume_qty,
    nup,
    nup_base,
    vol_base,
    (nup - nup_base) * vol_base as price_effect,
    (volume_qty - vol_base) * nup_base as volume_effect,
    (revenue
      - (nup_base*vol_base)
      - ((nup - nup_base)*vol_base)
      - ((volume_qty - vol_base)*nup_base)
    ) as mix_effect
  from joined
)
select * from calc
order by week_start, entity_id, product_id
        )
/* {"app":"dbt","dbt_version":"2.0.0","profile_name":"fpabi","target_name":"dev","node_id":"model.fpabi.mart_finance__pvm_weekly"} */;

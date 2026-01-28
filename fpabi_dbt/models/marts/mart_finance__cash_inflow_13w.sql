{{ config(materialized='table') }}

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
  from {{ ref('stg_fin_bank_txn') }}
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
  select distinct entity_id from {{ source('raw','dim_entity') }}
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

{{ config(materialized='table') }}

-- Standard weekly P&L based on GL.
with gl as (
  select
    date_trunc('week', posting_date) as week_start,
    entity_id,
    a.account_group,
    sum(amount) as amount
  from {{ ref('stg_nav_gl_entry') }} g
  join {{ ref('dim_account_core') }} a on g.account_id = a.account_id
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



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
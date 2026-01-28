{{ config(materialized='table') }}

-- Monthly PVM base metrics for Power BI.
-- Account values: Reservations, Revenue.

with monthly as (
    select
        date_trunc('month', reservation_date) as month_start,
        product_id,
        sum(qty) as reservations_value,
        sum(revenue_amount) as revenue_value
    from {{ ref('fct_reservation') }}
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

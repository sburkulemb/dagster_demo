with shop as (

    select *
    from {{ var('shopify_shop') }}
),

calendar as (

    select *
    from {{ ref('shopify__calendar') }}
    where cast({{ dbt.date_trunc('day','date_day') }} as date) = date_day
),
daily_orders as (

    select *
    from {{ ref('int_shopify__daily_orders_adjusted') }}
),

shop_calendar as (

    select
        cast({{ dbt.date_trunc('day','calendar.date_day') }} as date) as date_day,
        shop.shop_id,
        shop.name,
        shop.domain,
        shop.is_deleted,
        shop.currency,
        shop.enabled_presentment_currencies,
        shop.iana_timezone,
        shop.created_at,
        shop.source_relation

    from calendar
    join shop 
        on cast(shop.created_at as date) <= calendar.date_day
),
final as (

    select 
        shop_calendar.*,
        new_vs_repeat,
        coalesce(daily_orders.count_orders, 0) as count_orders,
        coalesce(daily_orders.count_line_items, 0) as count_line_items,
        coalesce(daily_orders.count_customers, 0) as count_customers,
        coalesce(daily_orders.count_customer_emails, 0) as count_customer_emails,
        coalesce(daily_orders.gross_revenue, 0) as gross_revenue,
        coalesce(daily_orders.gross_revenue_net_discounts, 0) as gross_revenue_net_discounts,
        coalesce(daily_orders.total_discounts, 0) as total_discounts,
        coalesce(daily_orders.count_orders_with_discounts, 0) as count_orders_with_discounts
    from shop_calendar
    left join daily_orders 
        on shop_calendar.source_relation = daily_orders.source_relation
        and shop_calendar.date_day = daily_orders.date_day
    
)

select *
from final
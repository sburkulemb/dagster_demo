with orders as (

    select *
    from {{ ref('shopify__orders_adjusted') }}
),

order_aggregates as (

    select
        source_relation,
        new_vs_repeat,
        cast({{ dbt.date_trunc('day','processed_timestamp') }} as date) as date_day,
        count(distinct order_id) as count_orders,
        sum(line_item_count) as count_line_items,
        count(distinct customer_id) as count_customers,
        count(distinct email) as count_customer_emails,
        sum(total_line_items_price) as gross_revenue,
        sum(subtotal_price) as gross_revenue_net_discounts,
        sum(total_discounts) as total_discounts,
        sum(case when count_discount_codes_applied > 0 then 1 else 0 end) as count_orders_with_discounts
    from orders
    group by 1,2,3

),

final as (

    select 
        order_aggregates.*
    from order_aggregates

)

select *
from final
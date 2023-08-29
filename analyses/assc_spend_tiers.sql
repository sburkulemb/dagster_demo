with
    orders as (select * from {{ ref("shopify__orders") }}),
    cohorts as (select * from {{ ref("shopify__customer_email_cohorts") }}),
    assc_order_details as (
        select customer_id, email, processed_timestamp, subtotal_price
        from orders
        where source_relation = 'assc_shopify'
    ),
    assc_cohort_details as (
        select email, cohort_month
        from cohorts
        where source_relation = 'assc_shopify'
        group by 1, 2
    ),
    cohort_joined as (
        select c.email, cohort_month, o.processed_timestamp, o.subtotal_price
        from assc_cohort_details c
        left join assc_order_details o on c.email = o.email
    ),
    lifetime_totals as (
        select 
            email, 
            cohort_month, 
            sum(subtotal_price) lifetime_subtotal, 
            case
                when sum(subtotal) between 0 and 499 then '0-499'
                when sum(subtotal) between 500 and 999 then '5000-999'
                when sum(subtotal) between 1000 and 2499 then '1000-2499'
                when sum(subtotal) between 2500 and 4999 then '2500-4999'
                when sum(subtotal) between 5000 and 9999 then '5000-9999'
                when sum(subtotal) between 10000 and 19999 then '10000-19999'
                else '20000+'
            end
        from cohort_joined
        group by 1,2
    ),
    yearly_totals as (
        select 
            email, 
            cohort_month, 
            year(processed_timestamp) as order_year, 
            sum(subtotal_price) year_subtotal, 
            case
                when sum(subtotal) between 0 and 499 then '0-499'
                when sum(subtotal) between 500 and 999 then '5000-999'
                when sum(subtotal) between 1000 and 2499 then '1000-2499'
                when sum(subtotal) between 2500 and 4999 then '2500-4999'
                when sum(subtotal) between 5000 and 9999 then '5000-9999'
                when sum(subtotal) between 10000 and 19999 then '10000-19999'
                else '20000+'
            end
        from cohort_joined
        group by 1,2,3
    ),
    aggregation as (
        select 
    )
select *
from bucketed_aggregation

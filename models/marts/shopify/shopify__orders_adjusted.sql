with
    revenue_fields as (
        select
            source_relation,
            source_name,
            processed_timestamp,
            order_id,
            customer_id,
            email,
            subtotal_price,
            total_line_items_price - subtotal_price as total_discounts,
            total_discounts as total_discounts_old,
            total_line_items_price,
            total_price,
            total_tax,
            total_shipping_price_set,
            refund_subtotal,
            refund_total_tax,
            shipping_cost,
            order_adjusted_total,
            line_item_count,
            shipping_discount_amount,
            percentage_calc_discount_amount,
            fixed_amount_discount_amount,
            count_discount_codes_applied,
            order_total_shipping_tax,
            new_vs_repeat
        from {{ ref("shopify__orders") }}
        where
            concat(source_relation, source_name) not in (
                'shopify_mhTestMarketplace 092-39712997',
                'shopify_mhWalmart.com',
                'shopify_mh5381409'
            ) and coalesce(FULFILLMENT_SERVICES,'') <> 'gift_card'
    ),
    refunds as (select * from {{ ref("stg_shopify__refund") }}),
    refund_lines as (select * from {{ ref("stg_shopify__order_line_refund") }}),
    adjustments as (select * from {{ ref("stg_shopify__order_adjustment") }}),
    refund_fields as (
        select
            refunds.order_id,
            refunds.source_relation,
            zeroifnull(sum(refund_lines.subtotal)) line_refund_amount,
            zeroifnull(sum(refund_lines.quantity)) line_refund_units,
            zeroifnull(sum(adjustments.amount) * - 1) order_refund_amount
        from refunds
        left join refund_lines on refunds.refund_id = refund_lines.refund_id
        left join adjustments on refunds.refund_id = adjustments.refund_id
        group by 1, 2
    ),
    joined as (
        select
            revenue_fields.source_relation,
            revenue_fields.source_name,
            revenue_fields.order_id,
            revenue_fields.customer_id,
            revenue_fields.email,
            revenue_fields.processed_timestamp,
            revenue_fields.new_vs_repeat,
            revenue_fields.subtotal_price,
            revenue_fields.total_discounts,
            revenue_fields.total_discounts_old,
            revenue_fields.total_line_items_price,
            revenue_fields.total_price,
            revenue_fields.total_tax,
            revenue_fields.refund_subtotal,
            revenue_fields.refund_total_tax,
            revenue_fields.shipping_cost,
            revenue_fields.order_adjusted_total,
            revenue_fields.line_item_count,
            revenue_fields.shipping_discount_amount,
            revenue_fields.percentage_calc_discount_amount,
            revenue_fields.fixed_amount_discount_amount,
            revenue_fields.count_discount_codes_applied,
            revenue_fields.order_total_shipping_tax,
            refund_fields.line_refund_amount,
            refund_fields.line_refund_units,
            refund_fields.order_refund_amount
        from revenue_fields
        left join refund_fields on revenue_fields.order_id = refund_fields.order_id
    )
select *
from
    joined


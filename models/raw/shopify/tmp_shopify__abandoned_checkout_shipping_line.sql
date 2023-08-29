{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'abandoned_checkout_shipping_line').database,
        schema=source('shopify', 'abandoned_checkout_shipping_line').schema,
        identifier=source('shopify', 'abandoned_checkout_shipping_line').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='abandoned_checkout_shipping_line', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='abandoned_checkout_shipping_line_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}
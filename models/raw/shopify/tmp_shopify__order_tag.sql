{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'order_tag').database,
        schema=source('shopify', 'order_tag').schema,
        identifier=source('shopify', 'order_tag').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='order_tag', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='order_tag_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}
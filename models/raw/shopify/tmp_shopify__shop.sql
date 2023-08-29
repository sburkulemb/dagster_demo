{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'shop').database,
        schema=source('shopify', 'shop').schema,
        identifier=source('shopify', 'shop').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='shop', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='shop_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}